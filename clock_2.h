#ifndef Morse_h
#define Morse_h
#include "Arduino.h"

#define TimePosition   0
#define refreshTemp 2000
#define refreshTime  500


#define DS1307_add  0x68
#define LCM_contrast  11
#define LCM_RW         9
#define LCM_bLight     3

#define LM35_Pin      A0

#define DC1307_Sec  0x00
#define DC1307_Min  0x01
#define DC1307_Hour 0x02
#define DC1307_Day  0x03
#define DC1307_Date 0x04
#define DC1307_Mon  0x05
#define DC1307_Year 0x06

String monthData[12] = {"Jan.", "Feb.", "Mar.",
                        "Apr.", "May", "Jun.",
                        "Jul.", "Aug.", "Sep.",
                        "Oct.", "Nov.", "Dec."};
String dayData[7] = {"Mon.", "Tues.", "Wed.", "Thur.",
                     "Fri", "Sat.", "Sun."};

#endif
