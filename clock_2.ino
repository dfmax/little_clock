#include <Wire.h>
#include <LiquidCrystal.h>
#include <EEPROM.h>
#include "clock_2.h"

LiquidCrystal lcd(8, 10, 7, 6, 5, 4);

void setup()
{
  byte Data[6] = {0};
  pinMode(LCM_contrast, OUTPUT);
  pinMode(LCM_RW, OUTPUT);
  pinMode(LCM_bLight, OUTPUT);

  Serial.begin(115200);
  Wire.begin();
  for (int a = 0; a < 6; a++)
  {
    Data[a] = EEPROM.read(0x20 + a);
  }
  setDS1307(Data[0], Data[1], Data[2], Data[3], Data[4], Data[5], 0);

  //setDS1307(23, 1, 14, 6, 12, 24, 0);

  analogWrite(LCM_contrast, 50);
  analogWrite(LCM_bLight, 10);
  digitalWrite(LCM_RW, LOW);
  delay(100);

  lcd.begin(16, 2);
  createLCMChar();
}

long pTime[10] = {0};

void loop()
{
  long tTime = millis();

  if (tTime - refreshTemp > pTime[0])
  {
    tempRefresh();
    pTime[0] = tTime;
  }

  if (tTime - refreshTime > pTime[1])
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

void createLCMChar()
{
  uint8_t temp[8]  = {0x04, 0x0A, 0x0A, 0x0E, 0x0E, 0x1F, 0x1F, 0xE};
  lcd.createChar(0, temp);
  lcd.setCursor(0, 1);
  lcd.print("Err");

  lcd.setCursor(10, 1);
  lcd.write(byte(0));
  lcd.print(":Err");
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
  for (int a = 0; a < 5; a++)
    Temp += analogRead(LM35_Pin);
  Temp /= 5;
  int Data = (125 * Temp) >> 8;
  lcd.setCursor(12, 1);
  lcd.print(Data);
  lcd.write(0xDF);
  lcd.print("C");
}

void timeRefresh()
{


  byte Year = bcdTodec(GetRTCTime(DC1307_Year));
  byte Mon = bcdTodec(GetRTCTime(DC1307_Mon));
  byte Date = bcdTodec(GetRTCTime(DC1307_Date));
  byte Day = bcdTodec(GetRTCTime(DC1307_Day));

  lcd.setCursor(11, 0);
  lcd.print(dayData[Day]);
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
  EEPROM.write(0x20, Year);
  EEPROM.write(0x21, Mon);
  EEPROM.write(0x22, Date);
  EEPROM.write(0x23, Day);
  EEPROM.write(0x24, Hour);
  EEPROM.write(0x25, Min);
}

void showTime(byte X)
{
  if (X <= 9)
    lcd.print("0");
  lcd.print(X);
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

