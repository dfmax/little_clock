EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:switches
LIBS:DS1307
LIBS:little_clock-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ATMEGA328-P IC1
U 1 1 5894734B
P 5200 2550
F 0 "IC1" H 4450 3800 50  0000 L BNN
F 1 "ATMEGA328-P" H 5600 1150 50  0000 L BNN
F 2 "Housings_DIP:DIP-28_W7.62mm_LongPads" H 5200 2550 50  0000 C CIN
F 3 "" H 5200 2550 50  0000 C CNN
	1    5200 2550
	1    0    0    -1  
$EndComp
$Comp
L Crystal Y2
U 1 1 58947496
P 7500 2100
F 0 "Y2" H 7500 2250 50  0000 C CNN
F 1 "16MHz" H 7500 1950 50  0000 C CNN
F 2 "Crystals:Crystal_HC18-U_Vertical" H 7500 2100 50  0001 C CNN
F 3 "" H 7500 2100 50  0000 C CNN
	1    7500 2100
	0    1    1    0   
$EndComp
$Comp
L C C11
U 1 1 5894751F
P 7800 1850
F 0 "C11" V 7750 1900 50  0000 L CNN
F 1 "20pF" V 7750 1600 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 7838 1700 50  0001 C CNN
F 3 "" H 7800 1850 50  0000 C CNN
	1    7800 1850
	0    1    1    0   
$EndComp
$Comp
L C C12
U 1 1 58947540
P 7800 2350
F 0 "C12" V 7850 2200 50  0000 L CNN
F 1 "20pF" V 7750 2400 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 7838 2200 50  0001 C CNN
F 3 "" H 7800 2350 50  0000 C CNN
	1    7800 2350
	0    -1   -1   0   
$EndComp
$Comp
L C C7
U 1 1 589475AB
P 4150 2300
F 0 "C7" H 4175 2400 50  0000 L CNN
F 1 "0.1uF" H 4175 2200 50  0000 L CNN
F 2 "Capacitors_SMD:C_1210_HandSoldering" H 4188 2150 50  0001 C CNN
F 3 "" H 4150 2300 50  0000 C CNN
	1    4150 2300
	1    0    0    -1  
$EndComp
$Comp
L R R6
U 1 1 589475DC
P 10200 2350
F 0 "R6" V 10280 2350 50  0000 C CNN
F 1 "1K" V 10200 2350 50  0000 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10130 2350 50  0001 C CNN
F 3 "" H 10200 2350 50  0000 C CNN
	1    10200 2350
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 58947643
P 9650 3300
F 0 "R5" V 9730 3300 50  0000 C CNN
F 1 "1K" V 9650 3300 50  0000 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9580 3300 50  0001 C CNN
F 3 "" H 9650 3300 50  0000 C CNN
	1    9650 3300
	0    1    1    0   
$EndComp
$Comp
L R R2
U 1 1 58947666
P 3750 6850
F 0 "R2" V 3830 6850 50  0000 C CNN
F 1 "1K" V 3750 6850 50  0000 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3680 6850 50  0001 C CNN
F 3 "" H 3750 6850 50  0000 C CNN
	1    3750 6850
	0    1    1    0   
$EndComp
$Comp
L GND #PWR01
U 1 1 5896E2BC
P 8250 2350
F 0 "#PWR01" H 8250 2100 50  0001 C CNN
F 1 "GND" H 8250 2200 50  0000 C CNN
F 2 "" H 8250 2350 50  0000 C CNN
F 3 "" H 8250 2350 50  0000 C CNN
	1    8250 2350
	1    0    0    -1  
$EndComp
$Comp
L Q_NPN_EBC Q1
U 1 1 5896EAE3
P 3450 6550
F 0 "Q1" V 3650 6600 50  0000 L CNN
F 1 "2N2222" V 3350 6650 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:TO-252-2Lead" H 3650 6650 50  0001 C CNN
F 3 "" H 3450 6550 50  0000 C CNN
	1    3450 6550
	0    1    -1   0   
$EndComp
$Comp
L CONN_01X04 P2
U 1 1 5896DBB6
P 5350 6200
F 0 "P2" H 5350 6450 50  0000 C CNN
F 1 "DHT11" V 5450 6200 50  0000 C CNN
F 2 "Connectors_Molex:Molex_NanoFit_1x04x2.50mm_Angled" H 5350 6200 50  0001 C CNN
F 3 "" H 5350 6200 50  0000 C CNN
	1    5350 6200
	-1   0    0    -1  
$EndComp
$Comp
L CP1 C5
U 1 1 5896E869
P 1800 1250
F 0 "C5" H 1825 1350 50  0000 L CNN
F 1 "10uF" H 1825 1150 50  0000 L CNN
F 2 "Capacitors_SMD:CP_Elec_4x5.7" H 1800 1250 50  0001 C CNN
F 3 "" H 1800 1250 50  0000 C CNN
	1    1800 1250
	1    0    0    -1  
$EndComp
$Comp
L C C6
U 1 1 5896E9CB
P 2050 1250
F 0 "C6" H 2075 1350 50  0000 L CNN
F 1 "0.1uF" H 2075 1150 50  0000 L CNN
F 2 "Capacitors_SMD:C_1210_HandSoldering" H 2088 1100 50  0001 C CNN
F 3 "" H 2050 1250 50  0000 C CNN
	1    2050 1250
	1    0    0    -1  
$EndComp
$Comp
L BARREL_JACK CON1
U 1 1 5896F079
P 1050 1250
F 0 "CON1" H 1050 1500 50  0000 C CNN
F 1 "BARREL_JACK" H 1050 1050 50  0000 C CNN
F 2 "Connect:BARREL_JACK" H 1050 1250 50  0001 C CNN
F 3 "" H 1050 1250 50  0000 C CNN
	1    1050 1250
	1    0    0    -1  
$EndComp
Text GLabel 2250 1000 2    60   Output ~ 0
5V_POWER
$Comp
L GND #PWR02
U 1 1 5896F3AC
P 1800 1650
F 0 "#PWR02" H 1800 1400 50  0001 C CNN
F 1 "GND" H 1800 1500 50  0000 C CNN
F 2 "" H 1800 1650 50  0000 C CNN
F 3 "" H 1800 1650 50  0000 C CNN
	1    1800 1650
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 5896FA8E
P 1600 2650
F 0 "R1" V 1680 2650 50  0000 C CNN
F 1 "10K" V 1600 2650 50  0000 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1530 2650 50  0001 C CNN
F 3 "" H 1600 2650 50  0000 C CNN
	1    1600 2650
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 5896FAC5
P 1600 3150
F 0 "C3" H 1625 3250 50  0000 L CNN
F 1 "0.1uF" H 1625 3050 50  0000 L CNN
F 2 "Capacitors_SMD:C_1210_HandSoldering" H 1638 3000 50  0001 C CNN
F 3 "" H 1600 3150 50  0000 C CNN
	1    1600 3150
	1    0    0    -1  
$EndComp
Text GLabel 1400 2300 0    60   Input ~ 0
5V_POWER
$Comp
L GND #PWR03
U 1 1 589707A7
P 1600 3500
F 0 "#PWR03" H 1600 3250 50  0001 C CNN
F 1 "GND" H 1600 3350 50  0000 C CNN
F 2 "" H 1600 3500 50  0000 C CNN
F 3 "" H 1600 3500 50  0000 C CNN
	1    1600 3500
	1    0    0    -1  
$EndComp
Text GLabel 1800 2900 2    60   Output ~ 0
RESET
Text GLabel 7550 3450 2    60   Input ~ 0
RESET
$Comp
L C C4
U 1 1 58971596
P 1600 4700
F 0 "C4" H 1625 4800 50  0000 L CNN
F 1 "0.1uF" H 1625 4600 50  0000 L CNN
F 2 "Capacitors_SMD:C_1210_HandSoldering" H 1638 4550 50  0001 C CNN
F 3 "" H 1600 4700 50  0000 C CNN
	1    1600 4700
	1    0    0    -1  
$EndComp
$Comp
L L L1
U 1 1 5897182C
P 1600 4200
F 0 "L1" V 1550 4200 50  0000 C CNN
F 1 "30uH" V 1675 4200 50  0000 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 1600 4200 50  0001 C CNN
F 3 "" H 1600 4200 50  0000 C CNN
	1    1600 4200
	1    0    0    -1  
$EndComp
Text GLabel 1400 3850 0    60   Input ~ 0
5V_POWER
$Comp
L GND #PWR04
U 1 1 589722A9
P 1600 5050
F 0 "#PWR04" H 1600 4800 50  0001 C CNN
F 1 "GND" H 1600 4900 50  0000 C CNN
F 2 "" H 1600 5050 50  0000 C CNN
F 3 "" H 1600 5050 50  0000 C CNN
	1    1600 5050
	1    0    0    -1  
$EndComp
Text GLabel 1800 4450 2    60   Output ~ 0
AVCC
Text GLabel 3500 1750 0    60   Input ~ 0
AVCC
$Comp
L GND #PWR05
U 1 1 5897374F
P 4150 2650
F 0 "#PWR05" H 4150 2400 50  0001 C CNN
F 1 "GND" H 4150 2500 50  0000 C CNN
F 2 "" H 4150 2650 50  0000 C CNN
F 3 "" H 4150 2650 50  0000 C CNN
	1    4150 2650
	1    0    0    -1  
$EndComp
Text GLabel 3500 1450 0    60   Input ~ 0
5V_POWER
$Comp
L GND #PWR06
U 1 1 58975649
P 4150 3950
F 0 "#PWR06" H 4150 3700 50  0001 C CNN
F 1 "GND" H 4150 3800 50  0000 C CNN
F 2 "" H 4150 3950 50  0000 C CNN
F 3 "" H 4150 3950 50  0000 C CNN
	1    4150 3950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 58976D68
P 1250 6550
F 0 "#PWR07" H 1250 6300 50  0001 C CNN
F 1 "GND" H 1250 6400 50  0000 C CNN
F 2 "" H 1250 6550 50  0000 C CNN
F 3 "" H 1250 6550 50  0000 C CNN
	1    1250 6550
	1    0    0    -1  
$EndComp
Text GLabel 1300 7250 0    60   Input ~ 0
5V_POWER
$Comp
L GND #PWR08
U 1 1 589778A8
P 2950 6550
F 0 "#PWR08" H 2950 6300 50  0001 C CNN
F 1 "GND" H 2950 6400 50  0000 C CNN
F 2 "" H 2950 6550 50  0000 C CNN
F 3 "" H 2950 6550 50  0000 C CNN
	1    2950 6550
	1    0    0    -1  
$EndComp
$Comp
L RC1602A-GHW-ESX DS1
U 1 1 58977D5A
P 2200 5750
F 0 "DS1" H 1400 6150 50  0000 C CNN
F 1 "RC1602A-GHW-ESX" H 2750 6150 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x16_Pitch2.54mm" H 2200 5700 50  0000 C CIN
F 3 "" H 2200 5750 50  0000 C CNN
	1    2200 5750
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 589791E2
P 4000 6450
F 0 "R3" V 4080 6450 50  0000 C CNN
F 1 "220" V 4000 6450 50  0000 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3930 6450 50  0001 C CNN
F 3 "" H 4000 6450 50  0000 C CNN
	1    4000 6450
	0    1    1    0   
$EndComp
Text GLabel 4350 6450 2    60   Input ~ 0
5V_POWER
$Comp
L R_Network04 RN1
U 1 1 5897A674
P 2000 7050
F 0 "RN1" V 1850 7250 50  0000 C CNN
F 1 "10K" V 1700 7050 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x05_Pitch2.54mm" V 2275 7050 50  0001 C CNN
F 3 "" H 2000 7050 50  0000 C CNN
	1    2000 7050
	0    -1   -1   0   
$EndComp
$Comp
L C C10
U 1 1 5897B0CB
P 5750 6650
F 0 "C10" H 5775 6750 50  0000 L CNN
F 1 "0.1uF" H 5775 6550 50  0000 L CNN
F 2 "Capacitors_SMD:C_1210_HandSoldering" H 5788 6500 50  0001 C CNN
F 3 "" H 5750 6650 50  0000 C CNN
	1    5750 6650
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 5897B652
P 6000 6050
F 0 "R4" V 6080 6050 50  0000 C CNN
F 1 "10K" V 6000 6050 50  0000 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5930 6050 50  0001 C CNN
F 3 "" H 6000 6050 50  0000 C CNN
	1    6000 6050
	0    1    1    0   
$EndComp
Text GLabel 5600 5700 0    60   Input ~ 0
5V_POWER
$Comp
L GND #PWR09
U 1 1 5897C014
P 5750 7050
F 0 "#PWR09" H 5750 6800 50  0001 C CNN
F 1 "GND" H 5750 6900 50  0000 C CNN
F 2 "" H 5750 7050 50  0000 C CNN
F 3 "" H 5750 7050 50  0000 C CNN
	1    5750 7050
	1    0    0    -1  
$EndComp
$Comp
L Buzzer BZ1
U 1 1 5897D14C
P 10650 2550
F 0 "BZ1" H 10800 2600 50  0000 L CNN
F 1 "Buzzer" H 10800 2500 50  0000 L CNN
F 2 "Buzzers_Beepers:Buzzer_12x9.5RM7.6" V 10625 2650 50  0001 C CNN
F 3 "" V 10625 2650 50  0000 C CNN
	1    10650 2550
	1    0    0    -1  
$EndComp
$Comp
L Q_NPN_EBC Q2
U 1 1 5897D36C
P 10100 3300
F 0 "Q2" H 10000 3150 50  0000 L CNN
F 1 "2N2222" H 9850 3450 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:TO-252-2Lead" H 10300 3400 50  0001 C CNN
F 3 "" H 10100 3300 50  0000 C CNN
	1    10100 3300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 58971160
P 10500 5600
F 0 "#PWR010" H 10500 5350 50  0001 C CNN
F 1 "GND" H 10500 5450 50  0000 C CNN
F 2 "" H 10500 5600 50  0000 C CNN
F 3 "" H 10500 5600 50  0000 C CNN
	1    10500 5600
	1    0    0    -1  
$EndComp
Text GLabel 9500 4250 0    60   Output ~ 0
func_UP
Text GLabel 9500 4650 0    60   Output ~ 0
func_DOWN
Text GLabel 9500 5050 0    60   Output ~ 0
Back/Alarm
Text GLabel 9500 5450 0    60   Output ~ 0
Menu/Enter
Text GLabel 7550 2700 2    60   Input ~ 0
func_UP
Text GLabel 7550 2850 2    60   Input ~ 0
func_DOWN
Text GLabel 7550 3600 2    60   Input ~ 0
Back/Alarm
Text GLabel 7550 3000 2    60   Input ~ 0
Menu/Enter
$Comp
L C C2
U 1 1 58975CCC
P 1450 6750
F 0 "C2" H 1350 6850 50  0000 L CNN
F 1 "0.1uF" H 1200 6650 50  0000 L CNN
F 2 "Capacitors_SMD:C_1210_HandSoldering" H 1488 6600 50  0001 C CNN
F 3 "" H 1450 6750 50  0000 C CNN
	1    1450 6750
	1    0    0    -1  
$EndComp
Text GLabel 6450 6250 2    60   Output ~ 0
DHT11_DATA
Text GLabel 750  6350 0    60   Input ~ 0
Vo
Text GLabel 4350 6850 2    60   Input ~ 0
BL
Text GLabel 3000 6850 2    60   Input ~ 0
LCM_D4
Text GLabel 1950 6550 3    60   Input ~ 0
LCM_E
Text GLabel 1750 6550 3    60   Input ~ 0
LCM_RS
Text GLabel 3000 7000 2    60   Input ~ 0
LCM_D5
Text GLabel 3000 7150 2    60   Input ~ 0
LCM_D6
Text GLabel 3000 7300 2    60   Input ~ 0
LCM_D7
$Comp
L CP C1
U 1 1 58978995
P 1000 6600
F 0 "C1" H 1025 6700 50  0000 L CNN
F 1 "10uF" H 800 6500 50  0000 L CNN
F 2 "Capacitors_SMD:CP_Elec_4x5.7" H 1038 6450 50  0001 C CNN
F 3 "" H 1000 6600 50  0000 C CNN
	1    1000 6600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR011
U 1 1 58978BEA
P 1000 6900
F 0 "#PWR011" H 1000 6650 50  0001 C CNN
F 1 "GND" H 1000 6750 50  0000 C CNN
F 2 "" H 1000 6900 50  0000 C CNN
F 3 "" H 1000 6900 50  0000 C CNN
	1    1000 6900
	1    0    0    -1  
$EndComp
$Comp
L DS1307 U1
U 1 1 58979271
P 5200 5050
F 0 "U1" H 4900 5270 50  0000 L CNN
F 1 "DS1307" H 5200 5050 50  0001 L CNN
F 2 "Housings_DIP:DIP-8_W7.62mm_Socket_LongPads" H 5200 5050 60  0001 C CNN
F 3 "" H 5200 5050 60  0001 C CNN
	1    5200 5050
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P1
U 1 1 58979856
P 3700 5200
F 0 "P1" H 3700 5350 50  0000 C CNN
F 1 "DS1307_BAT" V 3800 5200 50  0000 C CNN
F 2 "Sockets_WAGO734:WAGO_734_2pin_Straight_RuggedPads" H 3700 5200 50  0001 C CNN
F 3 "" H 3700 5200 50  0000 C CNN
	1    3700 5200
	-1   0    0    1   
$EndComp
$Comp
L C C9
U 1 1 589798E7
P 5300 4700
F 0 "C9" V 5350 4750 50  0000 L CNN
F 1 "0.1uF" V 5250 4450 50  0000 L CNN
F 2 "Capacitors_SMD:C_1210_HandSoldering" H 5338 4550 50  0001 C CNN
F 3 "" H 5300 4700 50  0000 C CNN
	1    5300 4700
	0    1    1    0   
$EndComp
$Comp
L C C8
U 1 1 58979985
P 4400 5450
F 0 "C8" V 4350 5500 50  0000 L CNN
F 1 "0.1uF" V 4450 5200 50  0000 L CNN
F 2 "Capacitors_SMD:C_1210_HandSoldering" H 4438 5300 50  0001 C CNN
F 3 "" H 4400 5450 50  0000 C CNN
	1    4400 5450
	0    1    1    0   
$EndComp
$Comp
L Crystal Y1
U 1 1 5897B832
P 4350 4700
F 0 "Y1" H 4350 4850 50  0000 C CNN
F 1 "32.768KHz" H 4350 4550 50  0000 C CNN
F 2 "Crystals:Crystal_AT310_d3.0mm_l10.0mm_Horizontal" H 4350 4700 50  0001 C CNN
F 3 "" H 4350 4700 50  0000 C CNN
	1    4350 4700
	-1   0    0    1   
$EndComp
Text GLabel 6250 5250 2    60   Output ~ 0
DS1307_SDA
Text GLabel 6250 5050 2    60   Input ~ 0
DS1307_SCL
Text GLabel 7550 3150 2    60   Input ~ 0
DS1307_SDA
Text GLabel 7550 3300 2    60   Output ~ 0
DS1307_SCL
$Comp
L D D1
U 1 1 58980F39
P 10200 2750
F 0 "D1" H 10200 2850 50  0000 C CNN
F 1 "1N4148" H 10200 2650 50  0000 C CNN
F 2 "Diodes_ThroughHole:D_DO-41_SOD81_P7.62mm_Horizontal" H 10200 2750 50  0001 C CNN
F 3 "" H 10200 2750 50  0000 C CNN
	1    10200 2750
	0    1    1    0   
$EndComp
$Comp
L GND #PWR012
U 1 1 5898294C
P 10200 3600
F 0 "#PWR012" H 10200 3350 50  0001 C CNN
F 1 "GND" H 10200 3450 50  0000 C CNN
F 2 "" H 10200 3600 50  0000 C CNN
F 3 "" H 10200 3600 50  0000 C CNN
	1    10200 3600
	1    0    0    -1  
$EndComp
Text GLabel 10000 2100 0    60   Input ~ 0
5V_POWER
Text GLabel 5600 4450 0    60   Input ~ 0
5V_POWER
Text GLabel 9300 3300 0    60   Input ~ 0
BUZZ_control
Wire Wire Line
	6200 2050 7200 2050
Wire Wire Line
	7200 2050 7200 1850
Wire Wire Line
	7200 1850 7650 1850
Wire Wire Line
	6200 2150 7200 2150
Wire Wire Line
	7200 2150 7200 2350
Wire Wire Line
	7200 2350 7650 2350
Wire Wire Line
	7500 2250 7500 2350
Connection ~ 7500 2350
Wire Wire Line
	7500 1950 7500 1850
Connection ~ 7500 1850
Wire Wire Line
	7950 1850 8050 1850
Wire Wire Line
	8050 1850 8050 2350
Wire Wire Line
	8050 2350 7950 2350
Wire Wire Line
	8250 2350 8250 2100
Wire Wire Line
	8250 2100 8050 2100
Connection ~ 8050 2100
Wire Wire Line
	1350 1150 1550 1150
Wire Wire Line
	1550 1150 1550 1000
Wire Wire Line
	1550 1000 2250 1000
Wire Wire Line
	1800 1000 1800 1100
Wire Wire Line
	1350 1350 1550 1350
Wire Wire Line
	1550 1250 1550 1500
Wire Wire Line
	1550 1250 1350 1250
Wire Wire Line
	1550 1500 2050 1500
Wire Wire Line
	1800 1400 1800 1650
Connection ~ 1550 1350
Connection ~ 1800 1500
Connection ~ 1800 1000
Wire Wire Line
	1600 2800 1600 3000
Wire Wire Line
	1400 2300 1600 2300
Wire Wire Line
	1600 2300 1600 2500
Wire Wire Line
	1600 3300 1600 3500
Wire Wire Line
	1800 2900 1600 2900
Connection ~ 1600 2900
Wire Wire Line
	1600 4350 1600 4550
Wire Wire Line
	1400 3850 1600 3850
Wire Wire Line
	1600 3850 1600 4050
Wire Wire Line
	1600 4850 1600 5050
Wire Wire Line
	1800 4450 1600 4450
Connection ~ 1600 4450
Wire Wire Line
	4300 1750 3500 1750
Wire Wire Line
	4150 2050 4150 2150
Wire Wire Line
	4300 2050 4150 2050
Wire Wire Line
	4150 2450 4150 2650
Wire Wire Line
	2050 1100 2050 1000
Connection ~ 2050 1000
Wire Wire Line
	2050 1500 2050 1400
Wire Wire Line
	4300 1450 3500 1450
Wire Wire Line
	4300 3650 4150 3650
Wire Wire Line
	4150 3650 4150 3950
Wire Wire Line
	4300 3750 4150 3750
Connection ~ 4150 3750
Wire Wire Line
	1450 6250 1450 6600
Wire Wire Line
	1250 6450 1850 6450
Wire Wire Line
	1250 6450 1250 6550
Wire Wire Line
	1550 6250 1550 7250
Wire Wire Line
	2950 6250 2950 6550
Wire Wire Line
	3250 6450 2850 6450
Wire Wire Line
	2850 6450 2850 6250
Wire Wire Line
	3850 6450 3650 6450
Wire Wire Line
	4350 6450 4150 6450
Wire Wire Line
	1850 6450 1850 6250
Connection ~ 1450 6450
Wire Wire Line
	1800 7250 1300 7250
Connection ~ 1550 7250
Wire Wire Line
	2200 6950 2850 6950
Wire Wire Line
	2450 6950 2450 6250
Wire Wire Line
	2550 6250 2550 7050
Wire Wire Line
	2200 7050 2950 7050
Wire Wire Line
	2650 6250 2650 7150
Wire Wire Line
	2200 7150 3000 7150
Wire Wire Line
	2200 7250 2850 7250
Wire Wire Line
	2750 7250 2750 6250
Wire Wire Line
	5550 6050 5850 6050
Wire Wire Line
	5750 5700 5750 6500
Wire Wire Line
	5550 6350 5600 6350
Wire Wire Line
	5600 6350 5600 6900
Wire Wire Line
	5600 6900 5750 6900
Wire Wire Line
	5750 6800 5750 7050
Connection ~ 5750 6050
Wire Wire Line
	5550 6150 5850 6150
Wire Wire Line
	5850 6150 5850 6250
Wire Wire Line
	5850 6250 6450 6250
Wire Wire Line
	6250 6250 6250 6050
Wire Wire Line
	6250 6050 6150 6050
Wire Wire Line
	5600 5700 5750 5700
Connection ~ 5750 6900
Wire Wire Line
	3600 6850 3450 6850
Wire Wire Line
	3450 6850 3450 6750
Wire Wire Line
	1450 6900 1450 7050
Wire Wire Line
	1450 7050 1550 7050
Connection ~ 1550 7050
Connection ~ 6250 6250
Wire Wire Line
	1950 6550 1950 6250
Wire Wire Line
	1750 6550 1750 6250
Wire Wire Line
	2950 7050 2950 7000
Wire Wire Line
	2950 7000 3000 7000
Connection ~ 2550 7050
Connection ~ 2650 7150
Wire Wire Line
	2850 7250 2850 7300
Wire Wire Line
	2850 7300 3000 7300
Connection ~ 2750 7250
Wire Wire Line
	2850 6950 2850 6850
Wire Wire Line
	2850 6850 3000 6850
Connection ~ 2450 6950
Wire Wire Line
	4350 6850 3900 6850
Wire Wire Line
	1650 6250 1650 6350
Wire Wire Line
	1650 6350 750  6350
Wire Wire Line
	1000 6450 1000 6350
Connection ~ 1000 6350
Wire Wire Line
	1000 6900 1000 6750
Wire Wire Line
	5950 4450 5950 4600
Wire Wire Line
	5600 4450 6050 4450
Wire Wire Line
	6050 4450 6050 4600
Wire Wire Line
	5800 4950 5700 4950
Wire Wire Line
	5800 4450 5800 4950
Wire Wire Line
	5800 4700 5450 4700
Wire Wire Line
	5950 5150 5700 5150
Wire Wire Line
	5950 4900 5950 5150
Wire Wire Line
	6050 4900 6050 5250
Wire Wire Line
	5700 5250 6250 5250
Connection ~ 5800 4700
Connection ~ 5950 4450
Wire Wire Line
	5150 4700 4700 4700
Wire Wire Line
	3900 5250 4800 5250
Wire Wire Line
	4800 4950 4600 4950
Wire Wire Line
	4600 4700 4500 4700
Wire Wire Line
	4200 4700 4100 4700
Wire Wire Line
	4100 5050 4800 5050
Connection ~ 4700 5250
Wire Wire Line
	4800 5150 3900 5150
Wire Wire Line
	4700 4700 4700 5550
Wire Wire Line
	4700 5450 4550 5450
Wire Wire Line
	4150 5450 4150 5150
Connection ~ 4150 5150
Wire Wire Line
	4150 5450 4250 5450
Connection ~ 6050 5250
Wire Wire Line
	6250 5050 5950 5050
Connection ~ 5950 5050
Wire Wire Line
	10200 2500 10200 2600
Wire Wire Line
	10200 2900 10200 3100
Wire Wire Line
	10550 2650 10450 2650
Wire Wire Line
	10450 2650 10450 3000
Wire Wire Line
	10450 3000 10200 3000
Connection ~ 10200 3000
Wire Wire Line
	10200 2200 10200 2100
Wire Wire Line
	10000 2100 10450 2100
Wire Wire Line
	10450 2100 10450 2450
Wire Wire Line
	10450 2450 10550 2450
Wire Wire Line
	9900 3300 9800 3300
Wire Wire Line
	10200 3600 10200 3500
Connection ~ 5800 4450
Connection ~ 10200 2100
Wire Wire Line
	9300 3300 9500 3300
Text GLabel 7550 2550 2    60   Input ~ 0
DHT11_DATA
Wire Wire Line
	7550 2550 7100 2550
Wire Wire Line
	7100 2550 7100 2300
Wire Wire Line
	7100 2300 6200 2300
Wire Wire Line
	6200 2400 7050 2400
Wire Wire Line
	7050 2400 7050 2700
Wire Wire Line
	7050 2700 7550 2700
Wire Wire Line
	7550 2850 7000 2850
Wire Wire Line
	7000 2850 7000 2500
Wire Wire Line
	7000 2500 6200 2500
Wire Wire Line
	6200 2600 6950 2600
Wire Wire Line
	6950 2600 6950 3000
Wire Wire Line
	6950 3000 7550 3000
Wire Wire Line
	6200 2700 6900 2700
Wire Wire Line
	6900 2700 6900 3150
Wire Wire Line
	6900 3150 7550 3150
Wire Wire Line
	7550 3300 6850 3300
Wire Wire Line
	6850 3300 6850 2800
Wire Wire Line
	6850 2800 6200 2800
Wire Wire Line
	7550 3450 6800 3450
Wire Wire Line
	6800 3450 6800 2900
Wire Wire Line
	6800 2900 6200 2900
Text GLabel 7550 4050 2    60   Output ~ 0
LCM_E
Text GLabel 7550 3900 2    60   Output ~ 0
LCM_RS
Text GLabel 7550 4200 2    60   Output ~ 0
LCM_D4
Text GLabel 7550 4350 2    60   Output ~ 0
LCM_D5
Text GLabel 7200 900  2    60   Output ~ 0
LCM_D6
Text GLabel 7200 1050 2    60   Output ~ 0
LCM_D7
Text GLabel 7200 1200 2    60   Output ~ 0
BL
Text GLabel 7550 3750 2    60   Output ~ 0
Vo
Wire Wire Line
	7550 3600 6750 3600
Wire Wire Line
	6750 3600 6750 3250
Wire Wire Line
	6750 3250 6200 3250
Wire Wire Line
	7550 3750 6700 3750
Wire Wire Line
	6700 3750 6700 3350
Wire Wire Line
	6700 3350 6200 3350
Wire Wire Line
	7550 3900 6650 3900
Wire Wire Line
	6650 3900 6650 3450
Wire Wire Line
	6650 3450 6200 3450
Wire Wire Line
	6200 3550 6600 3550
Wire Wire Line
	6600 3550 6600 4050
Wire Wire Line
	6600 4050 7550 4050
Wire Wire Line
	6200 3650 6550 3650
Wire Wire Line
	6550 3650 6550 4200
Wire Wire Line
	6550 4200 7550 4200
Wire Wire Line
	6200 3750 6500 3750
Wire Wire Line
	6500 3750 6500 4350
Wire Wire Line
	6500 4350 7550 4350
Wire Wire Line
	7200 900  6500 900 
Wire Wire Line
	6500 900  6500 1450
Wire Wire Line
	6500 1450 6200 1450
Wire Wire Line
	7200 1050 6550 1050
Wire Wire Line
	6550 1050 6550 1550
Wire Wire Line
	6550 1550 6200 1550
Wire Wire Line
	7200 1200 6600 1200
Wire Wire Line
	6600 1200 6600 1650
Wire Wire Line
	6600 1650 6200 1650
Text GLabel 7200 1350 2    60   Output ~ 0
BUZZ_control
Wire Wire Line
	7200 1350 6650 1350
Wire Wire Line
	6650 1350 6650 1750
Wire Wire Line
	6650 1750 6200 1750
$Comp
L R R7
U 1 1 589A06BA
P 5950 4750
F 0 "R7" V 6000 4900 50  0000 C CNN
F 1 "10k" V 5950 4750 50  0000 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5880 4750 50  0001 C CNN
F 3 "" H 5950 4750 50  0000 C CNN
	1    5950 4750
	1    0    0    -1  
$EndComp
$Comp
L R R8
U 1 1 589A0FE2
P 6050 4750
F 0 "R8" V 6100 4900 50  0000 C CNN
F 1 "10k" V 6050 4750 50  0000 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5980 4750 50  0001 C CNN
F 3 "" H 6050 4750 50  0000 C CNN
	1    6050 4750
	1    0    0    -1  
$EndComp
$Comp
L SW_PUSH SW1
U 1 1 589A2274
P 10050 4250
F 0 "SW1" H 10200 4360 50  0000 C CNN
F 1 "UP_button" H 10050 4170 50  0000 C CNN
F 2 "Buttons_Switches_ThroughHole:SW_Tactile_SKHH_Angled" H 10050 4250 50  0001 C CNN
F 3 "" H 10050 4250 50  0000 C CNN
	1    10050 4250
	1    0    0    -1  
$EndComp
$Comp
L SW_PUSH SW2
U 1 1 589A22EF
P 10050 4650
F 0 "SW2" H 10200 4760 50  0000 C CNN
F 1 "DOWN_button" H 10050 4570 50  0000 C CNN
F 2 "Buttons_Switches_ThroughHole:SW_Tactile_SKHH_Angled" H 10050 4650 50  0001 C CNN
F 3 "" H 10050 4650 50  0000 C CNN
	1    10050 4650
	1    0    0    -1  
$EndComp
$Comp
L SW_PUSH SW3
U 1 1 589A2729
P 10050 5050
F 0 "SW3" H 10200 5160 50  0000 C CNN
F 1 "B/A_button" H 10050 4970 50  0000 C CNN
F 2 "Buttons_Switches_ThroughHole:SW_Tactile_SKHH_Angled" H 10050 5050 50  0001 C CNN
F 3 "" H 10050 5050 50  0000 C CNN
	1    10050 5050
	1    0    0    -1  
$EndComp
$Comp
L SW_PUSH SW4
U 1 1 589A27AA
P 10050 5450
F 0 "SW4" H 10200 5560 50  0000 C CNN
F 1 "M/E_button" H 10050 5370 50  0000 C CNN
F 2 "Buttons_Switches_ThroughHole:SW_Tactile_SKHH_Angled" H 10050 5450 50  0001 C CNN
F 3 "" H 10050 5450 50  0000 C CNN
	1    10050 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 4250 9750 4250
Wire Wire Line
	9750 4650 9500 4650
Wire Wire Line
	9500 5050 9750 5050
Wire Wire Line
	9500 5450 9750 5450
Wire Wire Line
	10500 5600 10500 4250
Wire Wire Line
	10500 4250 10350 4250
Wire Wire Line
	10350 4650 10500 4650
Connection ~ 10500 4650
Wire Wire Line
	10350 5450 10500 5450
Connection ~ 10500 5450
Wire Wire Line
	10350 5050 10500 5050
Connection ~ 10500 5050
Wire Wire Line
	4100 4700 4100 5050
Wire Wire Line
	4600 4950 4600 4700
$Comp
L GND #PWR?
U 1 1 589A8FFB
P 4700 5550
F 0 "#PWR?" H 4700 5300 50  0001 C CNN
F 1 "GND" H 4700 5400 50  0000 C CNN
F 2 "" H 4700 5550 50  0000 C CNN
F 3 "" H 4700 5550 50  0000 C CNN
	1    4700 5550
	1    0    0    -1  
$EndComp
Connection ~ 4700 5450
$EndSCHEMATC
