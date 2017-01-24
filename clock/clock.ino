#include <Wire.h>
#include <LiquidCrystal.h>
#include <EEPROM.h>
#include "clock.h"

LiquidCrystal lcd(LCM_Rs, LCM_En, 7, 6, 5, 4);

void setup()
{
  byte Data[4] = {0};
  initIO();

  Serial.begin(115200);
  Wire.begin();
  for (int a = 0; a < 4; a++)
    Data[a] = EEPROM.read(0x20 + a);

  setDS1307(Data[0], Data[1], Data[2], Data[3], 0, 0, 0);
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
byte sH = 0, sM = 0, sY = 0, sN = 0, sD = 0, sW = 0;

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
  short index = 0, preIndex = 4, count = 0;
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
      {
        index--;
        count = 0;
      }
      checkUp = false;
    }
    if (checkDown == true)
    {
      if (index < menuItem - 1)
      {
        index++;
        count = 0;
      }
      checkDown = false;
    }
    if (checkSetting == true)
    {
      switch (index)
      {
        case 0:
          settingTime();
          break;
        case 1:
          settingDate();
          break;
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
          lcd.clear();
          sH = bcdTodec(GetRTCTime(DC1307_Hour));
          sM = bcdTodec(GetRTCTime(DC1307_Min));
          lcd.setCursor(5, 1);
          showTime(sH);
          lcd.print(":");
          showTime(sM);
          break;
        case 1:
          lcd.clear();
          sY = bcdTodec(GetRTCTime(DC1307_Year));
          sN = bcdTodec(GetRTCTime(DC1307_Mon));
          sD = bcdTodec(GetRTCTime(DC1307_Date));
          sW = bcdTodec(GetRTCTime(DC1307_Day));
          lcd.setCursor(2, 1);
          showTime(sY);
          lcd.print("-");
          showTime(sN);
          lcd.print("-");
          showTime(sD);
          lcd.print("/");
          showTime(sW);
          break;
      }
      //initLCM(1);
      lcd.setCursor(0, 0);
      lcd.write(0x3E);
      lcd.print(MenuText[index]);
      preIndex = index;
    }
  } while (state == true);
  initLCM(0);
  return false;
}

void settingDate()
{
  boolean state = true, checkUp = false, checkDown = false, checkSetting = false;
  byte tempY = sY, tempN = sN, tempD = sD, tempW = sW, mode = 0;
  lcd.setCursor(0, 0);
  lcd.print(" ");
  lcd.setCursor(0, 1);
  lcd.write(0x3E);
  lcd.print("Y");
  do
  {
    checkUp = getIOState(setUp);
    checkDown = getIOState(setDown);
    checkSetting = getIOState(setFunctions);
    getIOState(goBack) == true ? state = false : state = true;

    if (tempY != sY || tempN != sN || tempD != sD || tempW != sW)
    {
      lcd.setCursor(2, 1);
      showTime(tempY);
      lcd.setCursor(5, 1);
      showTime(tempN);
      lcd.setCursor(8, 1);
      showTime(tempD);
      lcd.setCursor(11, 1);
      showTime(tempW);
      sY = tempY;
      sN = tempN;
      sD = tempD;
      sW = tempW;
    }
    if (checkUp == true)
    {
      switch (mode)
      {
        case 0:
          tempY++;
          if (tempY >= 100)
            tempY = 0;
          break;
        case 1:
          tempN++;
          if (tempN >= 13)
            tempN = 1;
          break;
        case 2:
          tempD++;
          if (tempD >= 31)
            tempD = 1;
          break;
        case 3:
          tempW++;
          if (tempW >= 8)
            tempW = 1;
          break;
      }
      checkUp = false;
    }
    if (checkDown == true)
    {
      switch (mode)
      {
        case 0:
          tempY--;
          if (tempY < 0)
            tempY = 99;
          break;
        case 1:
          tempN--;
          if (tempN < 1)
            tempN = 12;
          break;
        case 2:
          tempD--;
          if (tempD < 1)
            tempD = 31;
          break;
        case 3:
          tempW--;
          if (tempW < 1)
            tempW = 7;
          break;
      }
      checkDown = false;
    }
    if (checkSetting == true)
    {
      switch (mode)
      {
        case 0:
          lcd.setCursor(1, 1);
          lcd.print("M");
          mode = 1;
          break;
        case 1:
          lcd.setCursor(1, 1);
          lcd.write("D");
          mode = 2;
          break;
        case 2:
          mode = 3;
          lcd.setCursor(1, 1);
          lcd.write("W");
          break;
        case 3:
          lcd.setCursor(1, 1);
          lcd.write("Y");
          mode = 0;
          break;
      }
      checkSetting = false;
    }
  } while (state == true);
  Wire.beginTransmission(DS1307_add);
  Wire.write(DC1307_Year);
  Wire.write(decToBcd(sY + 0x06));
  Wire.endTransmission();
  Wire.beginTransmission(DS1307_add);
  Wire.write(DC1307_Mon);
  Wire.write(decToBcd(sN + 0x06));
  Wire.endTransmission();
  Wire.beginTransmission(DS1307_add);
  Wire.write(DC1307_Date);
  Wire.write(decToBcd(sD) & 0x3F);
  Wire.endTransmission();
  Wire.beginTransmission(DS1307_add);
  Wire.write(DC1307_Day);
  Wire.write(decToBcd(sW) & 0x07);
  Wire.endTransmission();
  EEPROM.write(0x20, sY + 0x06);
  EEPROM.write(0x21, sN + 0x06);
  EEPROM.write(0x22, sD);
  EEPROM.write(0x23, sW);
  lcd.setCursor(0, 0);
  lcd.write(0x3E);
  lcd.setCursor(0, 1);
  lcd.print("  ");
}


void settingTime()
{
  boolean state = true, checkUp = false, checkDown = false, checkSetting = false;
  byte tempH = sH, tempM = sM, mode = 0;
  lcd.setCursor(0, 0);
  lcd.print(" ");
  lcd.setCursor(0, 1);
  lcd.write(0x3E);
  do
  {
    checkUp = getIOState(setUp);
    checkDown = getIOState(setDown);
    checkSetting = getIOState(setFunctions);
    getIOState(goBack) == true ? state = false : state = true;

    if (tempH != sH || tempM != sM)
    {
      lcd.setCursor(5, 1);
      showTime(tempH);
      lcd.print(":");
      showTime(tempM);
      sH = tempH;
      sM = tempM;
    }
    if (checkUp == true)
    {
      switch (mode)
      {
        case 0:
          tempH++;
          if (tempH >= 24)
            tempH = 0;
          break;
        case 1:
          tempM++;
          if (tempM >= 60)
            tempM = 0;
          break;
      }
      checkUp = false;
    }
    if (checkDown == true)
    {
      switch (mode)
      {
        case 0:
          tempH--;
          if (tempH < 0)
            tempH = 23;
          break;
        case 1:
          tempM--;
          if (tempM < 0)
            tempM = 59;
          break;
      }
      checkDown = false;
    }
    if (checkSetting == true)
    {
      if (mode == 0)
      {
        lcd.setCursor(15, 1);
        lcd.write(0x3C);
        lcd.setCursor(0, 1);
        lcd.print(" ");
        mode = 1;
      }
      else
      {
        lcd.setCursor(0, 1);
        lcd.write(0x3E);
        lcd.setCursor(15, 1);
        lcd.print(" ");
        mode = 0;
      }
      checkSetting = false;
    }
  } while (state == true);
  Wire.beginTransmission(DS1307_add);
  Wire.write(DC1307_Min);
  Wire.write(decToBcd(sM));
  Wire.endTransmission();
  Wire.beginTransmission(DS1307_add);
  Wire.write(DC1307_Hour);
  Wire.write(decToBcd(sH) & 0x1F);
  Wire.endTransmission();
  lcd.setCursor(0, 0);
  lcd.write(0x3E);
  lcd.setCursor(0, 1);
  lcd.print(" ");
  lcd.setCursor(15, 1);
  lcd.print(" ");
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
    //EEPROM.write(0x24, Hour);
    //EEPROM.write(0x25, Min);
  }
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

