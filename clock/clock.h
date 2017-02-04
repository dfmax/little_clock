#ifndef Morse_h
#define Morse_h
#include "Arduino.h"

#define TimePosition     0
#define setDelayTime  1000
#define refreshTemp   5000
#define refreshTime    500

#define setFunctions    12
#define setUp           15
#define setDown         16
#define goBack          17


#define CTROMAddr     0x05
#define BLROMAddr     0x06

#define DS1307_add    0x68
#define LCM_contrast    11
#define LCM_Rs           8
#define LCM_RW           9
#define LCM_En          10
#define LCM_bLight       3

#define LCMbit7          7
#define LCMbit6          6
#define LCMbit5          5
#define LCMbit4          4

#define LM35_Pin        A0
#define BUZZ             2

#define DC1307_Sec    0x00
#define DC1307_Min    0x01
#define DC1307_Hour   0x02
#define DC1307_Day    0x03
#define DC1307_Date   0x04
#define DC1307_Mon    0x05
#define DC1307_Year   0x06

#define LCMBLMin         0
#define LCMBLMax       185
#define LCMInitialBL    10

#define LCMCTMin        10
#define LCMCTMax        80
#define LCMInitialCT    50

#define menuItem         4

String monthData[12] = {"Jan.", "Feb.", "Mar.",
                        "Apr.", "May ", "Jun.",
                        "Jul.", "Aug.", "Sep.",
                        "Oct.", "Nov.", "Dec."};
String dayData[7] = {"Mon.", "Tues.", "Wed.", "Thur.",
                     "Fri", "Sat.", "Sun."};

String MenuText[5] = {"Setting Alarm",
                      "Setting Time ",
                      "Setting Date ",
                      "Setting LCM  ",
                      "EXIT         "};

uint8_t bell[8]  = {0x4,0xe,0xe,0xe,0x1f,0x0,0x4};
uint8_t temp[8]  = {0x04, 0x0A, 0x0A, 0x0E, 0x0E, 0x1F, 0x1F, 0x0E};

int alarmTime[2] = {600, 1000};

byte  Hour = 0x00, Min = 0x00;
byte sCT = 0x00, sBL = 0x00;              
byte sAlH = 0x00, sAlM = 0x00;
boolean AlarmFlag = false;
                      
#endif
