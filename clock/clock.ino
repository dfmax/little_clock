#include <Wire.h>
#include <LiquidCrystal.h>
#include <EEPROM.h>
#include "clock.h"

LiquidCrystal lcd(LCM_Rs, LCM_En, 7, 6, 5, 4);

void setup()
{
  byte Data[6] = {0};
  initIO();

  Serial.begin(115200);
  Wire.begin();
  for (int a = 0; a < 6; a++)
    Data[a] = EEPROM.read(0x20 + a);

  setDS1307(Data[0], Data[1], Data[2], Data[3], Data[4], Data[5], 0);
  //setDS1307(Year, Month, Date, week, hour, min, sec);
  //setDS1307(23, 1, 14, 6, 12, 24, 0); //then system need to initial the clock time when EEPROM data are float.

  analogWrite(LCM_contrast, 50);
  analogWrite(LCM_bLight, 10);
  digitalWrite(LCM_RW, LOW);
  delay(100);

  lcd.begin(16, 2);
  createLCMChar();
}

long pTime[10] = {0};
boolean settingMode = false;
byte sH = 0, sM = 0;

void loop()
{
  long tTime = millis();
  if (settingMode == false)
    settingMode = getIOState(setFunctions);

  if (settingMode == true)
  {
    settingMode = menuFunctions();
  }

  if ((tTime - refreshTemp > pTime[0]) && settingMode != true)
  {
    tempRefresh();
    pTime[0] = tTime;
  }

  if ((tTime - refreshTime > pTime[1]) && settingMode != true)
  {
    timeRefresh();
    pTime[1] = tTime;
  }
  delay(1);
}

byte GetRTCTime(byte TimeReg)
{
  Wire.beginTransmission(DS1307_add);
  Wire.write(TimeReg);
  Wire.endTransmission();

  Wire.requestFrom(DS1307_add, 1, 1);
  byte Data = Wire.read();
  return bcdTodec(Data);
}

void initLCM(short Mode)
{
  lcd.clear();
  switch (Mode)
  {
    case 0:
      lcd.setCursor(0, 1);
      lcd.print("Err");
      lcd.setCursor(10, 1);
      lcd.write(byte(0));
      lcd.print(":Wait");
      break;
    case 1:
      lcd.setCursor(1, 0);
      lcd.print(MenuText[0]);
      break;
  }

}

void createLCMChar()
{
  uint8_t temp[8]  = {0x04, 0x0A, 0x0A, 0x0E, 0x0E, 0x1F, 0x1F, 0x0E};
  lcd.createChar(0, temp);
  initLCM(0);
}

boolean getIOState(byte X)
{
  if (digitalRead(X) == LOW)
  {
    do {
      delay(10);
    } while (digitalRead(X) == LOW);
    return true;
  }
  else
    return false;
}

void setDS1307(byte Y, byte M, byte D, byte W, byte h, byte m, byte s)
{
  Wire.beginTransmission(DS1307_add);
  Wire.write(0);
  Wire.write(decToBcd(s));
  Wire.write(decToBcd(m));
  Wire.write(decToBcd(h) & 0x1F);
  Wire.write(decToBcd(W));
  Wire.write(decToBcd(D));
  Wire.write(decToBcd(M));
  Wire.write(decToBcd(Y));
  Wire.endTransmission();
}

void tempRefresh()
{
  int Temp = 0;
  for (int a = 0; a < 8; a++)
    Temp += analogRead(LM35_Pin);
  Temp /= 8;
  int Data = (125 * Temp) >> 8;
  lcd.setCursor(12, 1);
  if (Data <= 99 && Data > 0)
  {
    lcd.print(Data);
    lcd.write(0xDF);
    lcd.print("C");
  }
  else
    lcd.print("Err ");
}

boolean menuFunctions()
{
  boolean state = true, checkUp = false, checkDown = false, checkSetting = false;
  short index = 0, preIndex = 4;
  initLCM(1);
  lcd.setCursor(0, 0);
  lcd.write(0x3E);
  do
  {
    checkUp = getIOState(setUp);
    checkDown = getIOState(setDown);
    checkSetting = getIOState(setFunctions);
    if (checkSetting == false)
      getIOState(goBack) == true ? state = false : state = true;
    if (checkUp == true)
    {
      if (index > 0)
        index--;
      checkUp = false;
    }
    if (checkDown == true)
    {
      if (index < menuItem - 1)
        index++;
      checkDown = false;
    }
    if (checkSetting == true)
    {
      switch (index)
      {
        case 3:
          state = false;
          break;
      }
      checkSetting = false;
    }
    if (preIndex != index)
    {
      lcd.clear();
      switch (index)
      {
        case 0:
          byte Hour = bcdTodec(GetRTCTime(DC1307_Hour));
          byte Min = bcdTodec(GetRTCTime(DC1307_Min));
          sH = Hour;
          sM = Min;
          break;
      }
      //initLCM(1);
      
      lcd.setCursor(0, 0);
      lcd.write(0x3E);
      lcd.print(MenuText[index]);
      lcd.setCursor(5, 1);
      showTime(sH);
      lcd.print(":");
      showTime(sM);
      preIndex = index;
    }
    Serial.println(index);
  } while (state == true);
  initLCM(0);
  return false;
}

void timeRefresh()
{
  byte Year = bcdTodec(GetRTCTime(DC1307_Year));
  byte Mon = bcdTodec(GetRTCTime(DC1307_Mon));
  byte Date = bcdTodec(GetRTCTime(DC1307_Date));
  byte Day = bcdTodec(GetRTCTime(DC1307_Day) & 0x07);

  lcd.setCursor(11, 0);
  lcd.print(dayData[Day - 1]);
  lcd.print(" ");

  lcd.setCursor(0, 0);
  showTime(Year);
  lcd.print(" ");
  lcd.print(monthData[Mon - 1]);
  //lcd.print(" ");
  showTime(Date);
  lcd.print(" ");

  byte Hour = bcdTodec(GetRTCTime(DC1307_Hour));
  byte Min = bcdTodec(GetRTCTime(DC1307_Min));
  lcd.setCursor(TimePosition, 1);
  showTime(Hour);
  if (bcdTodec(GetRTCTime(DC1307_Sec)) % 2 == 0)
    lcd.print(":");
  else
    lcd.print(" ");
  showTime(Min);
  if (EEPROM.read(0x22) != Date)
  {
    EEPROM.write(0x20, Year);
    EEPROM.write(0x21, Mon);
    EEPROM.write(0x22, Date);
    EEPROM.write(0x23, Day);
    EEPROM.write(0x24, Hour);
    EEPROM.write(0x25, Min);
  }
}

void settingTime()
{
  lcd.setCursor(1, 1);

}

void showTime(byte X)
{
  if (X <= 9)
    lcd.print("0");
  lcd.print(X);
}

void initIO()
{
  pinMode(LCM_contrast, OUTPUT);
  pinMode(LCM_RW, OUTPUT);
  pinMode(LCM_bLight, OUTPUT);
  pinMode(goBack,       INPUT_PULLUP);
  pinMode(setFunctions, INPUT_PULLUP);
  pinMode(setUp,        INPUT_PULLUP);
  pinMode(setDown,      INPUT_PULLUP);
}

/*data tranfer functions*/
byte decToBcd(byte X)
{
  uint16_t a = X;
  byte b = (a * 103) >> 10;
  return  X + b * 6;
}

byte bcdTodec(byte X)
{
  return (X - 6 * (X / 16));
}

