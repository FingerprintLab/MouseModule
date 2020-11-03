EESchema Schematic File Version 4
EELAYER 30 0
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
L Connector_Generic:Conn_02x20_Odd_Even J?
U 1 1 5F96B64B
P 1950 2250
F 0 "J?" H 2000 3367 50  0000 C CNN
F 1 "Conn_02x20_Odd_Even" H 2000 3276 50  0000 C CNN
F 2 "" H 1950 2250 50  0001 C CNN
F 3 "~" H 1950 2250 50  0001 C CNN
	1    1950 2250
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5F96EB7A
P 900 1250
F 0 "#PWR?" H 900 1100 50  0001 C CNN
F 1 "+3.3V" H 915 1423 50  0000 C CNN
F 2 "" H 900 1250 50  0001 C CNN
F 3 "" H 900 1250 50  0001 C CNN
	1    900  1250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F96FD09
P 3200 1250
F 0 "#PWR?" H 3200 1100 50  0001 C CNN
F 1 "+5V" H 3215 1423 50  0000 C CNN
F 2 "" H 3200 1250 50  0001 C CNN
F 3 "" H 3200 1250 50  0001 C CNN
	1    3200 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 1450 2250 1450
$Comp
L power:GND #PWR?
U 1 1 5F973765
P 2000 3650
F 0 "#PWR?" H 2000 3400 50  0001 C CNN
F 1 "GND" H 2005 3477 50  0000 C CNN
F 2 "" H 2000 3650 50  0001 C CNN
F 3 "" H 2000 3650 50  0001 C CNN
	1    2000 3650
	1    0    0    -1  
$EndComp
Text GLabel 1700 1450 0    50   Input ~ 0
GPIO2(SDA)
Wire Wire Line
	1700 1450 1750 1450
Text GLabel 1700 1550 0    50   Input ~ 0
GPIO3(SCL)
Text GLabel 1700 1650 0    50   Input ~ 0
GPIO4(GPCLK0)
Wire Wire Line
	1700 1550 1750 1550
Wire Wire Line
	1700 1650 1750 1650
Text GLabel 1650 1850 0    50   Input ~ 0
GPIO17
Text GLabel 1650 1950 0    50   Input ~ 0
GPIO27
Text GLabel 1650 2050 0    50   Input ~ 0
GPIO22
Text GLabel 1650 2250 0    50   Input ~ 0
GPIO10(MOSI)
Text GLabel 1650 2350 0    50   Input ~ 0
GPIO9(MISO)
Text GLabel 1650 2450 0    50   Input ~ 0
GPIO11(SCLK)
Text GLabel 1650 2650 0    50   Input ~ 0
GPIO0(ID_SD)
Text GLabel 1650 2750 0    50   Input ~ 0
GPIO5
Text GLabel 1650 2850 0    50   Input ~ 0
GPIO6
Text GLabel 1650 2950 0    50   Input ~ 0
GPIO13(PWM1)
Text GLabel 1650 3050 0    50   Input ~ 0
GPIO19(PCM_FS)
Text GLabel 1650 3150 0    50   Input ~ 0
GPIO26
Wire Wire Line
	1650 1850 1750 1850
Wire Wire Line
	1650 1950 1750 1950
Wire Wire Line
	1650 2050 1750 2050
Wire Wire Line
	1650 2250 1750 2250
Wire Wire Line
	1650 2350 1750 2350
Wire Wire Line
	1650 2450 1750 2450
Wire Wire Line
	1650 2650 1750 2650
Wire Wire Line
	1750 2750 1650 2750
Wire Wire Line
	1650 2850 1750 2850
Wire Wire Line
	1750 2950 1650 2950
Wire Wire Line
	1650 3050 1750 3050
Wire Wire Line
	1750 3150 1650 3150
Wire Wire Line
	800  3250 1750 3250
Wire Wire Line
	800  2550 800  3250
Wire Wire Line
	800  2550 1750 2550
Connection ~ 800  3250
Wire Wire Line
	800  1750 800  2550
Wire Wire Line
	800  1750 1750 1750
Connection ~ 800  2550
Wire Wire Line
	900  1350 900  1250
Wire Wire Line
	900  1350 1750 1350
Wire Wire Line
	900  2150 900  1350
Wire Wire Line
	900  2150 1750 2150
Connection ~ 900  1350
Wire Wire Line
	3200 1250 3200 1350
Wire Wire Line
	2350 1350 2350 1450
Wire Wire Line
	2250 1350 2350 1350
Connection ~ 2350 1350
Wire Wire Line
	2350 1350 3200 1350
Text GLabel 2300 1650 2    50   Input ~ 0
GPIO14(TXD)
Wire Wire Line
	2300 1650 2250 1650
Text GLabel 2300 1750 2    50   Input ~ 0
GPIO15(RXD)
Text GLabel 2300 1850 2    50   Input ~ 0
GPIO18(PCM_CLK)
Text GLabel 2300 2050 2    50   Input ~ 0
GPIO23
Text GLabel 2300 2150 2    50   Input ~ 0
GPIO24
Text GLabel 2300 2350 2    50   Input ~ 0
GPIO25
Text GLabel 2300 2450 2    50   Input ~ 0
GPIO8(CE0)
Text GLabel 2300 2550 2    50   Input ~ 0
GPIO7(CE1)
Text GLabel 2300 2650 2    50   Input ~ 0
GPIO1(ID_SC)
Text GLabel 2300 2850 2    50   Input ~ 0
GPIO12(PWM0)
Text GLabel 2300 3050 2    50   Input ~ 0
GPIO16
Text GLabel 2300 3150 2    50   Input ~ 0
GPIO20(PCM_DIN)
Text GLabel 2300 3250 2    50   Input ~ 0
GPIO21(PCM_DOUT)
Wire Wire Line
	2300 1750 2250 1750
Wire Wire Line
	2300 1850 2250 1850
Wire Wire Line
	2300 2050 2250 2050
Wire Wire Line
	2300 2150 2250 2150
Wire Wire Line
	2300 2350 2250 2350
Wire Wire Line
	2300 2450 2250 2450
Wire Wire Line
	2300 2550 2250 2550
Wire Wire Line
	2300 2650 2250 2650
Wire Wire Line
	2300 2850 2250 2850
Wire Wire Line
	2300 3050 2250 3050
Wire Wire Line
	2300 3150 2250 3150
Wire Wire Line
	2300 3250 2250 3250
Wire Wire Line
	800  3500 2000 3500
Wire Wire Line
	2000 3500 2000 3650
Wire Wire Line
	800  3250 800  3500
Wire Wire Line
	2000 3500 3200 3500
Connection ~ 2000 3500
Wire Wire Line
	2250 1550 3200 1550
Wire Wire Line
	2250 1950 3200 1950
Connection ~ 3200 1950
Wire Wire Line
	3200 1950 3200 1550
Wire Wire Line
	2250 2250 3200 2250
Wire Wire Line
	3200 1950 3200 2250
Connection ~ 3200 2250
Wire Wire Line
	3200 2250 3200 2750
Wire Wire Line
	2250 2750 3200 2750
Connection ~ 3200 2750
Wire Wire Line
	3200 2750 3200 2950
Wire Wire Line
	2250 2950 3200 2950
Connection ~ 3200 2950
Wire Wire Line
	3200 2950 3200 3500
Wire Notes Line
	550  800  550  3950
Wire Notes Line
	550  3950 3500 3950
Wire Notes Line
	3500 3950 3500 800 
Wire Notes Line
	3500 800  550  800 
Text Notes 550  800  0    50   ~ 0
Raspberry Pi Zero GPIO Header
$Comp
L Analog_DAC:MCP4922 U?
U 1 1 5F9992BA
P 5050 1950
F 0 "U?" H 5050 2531 50  0000 C CNN
F 1 "MCP4922" H 5050 2440 50  0000 C CNN
F 2 "" H 5850 1650 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/22250A.pdf" H 5850 1650 50  0001 C CNN
	1    5050 1950
	1    0    0    -1  
$EndComp
Text GLabel 1700 5150 0    50   Input ~ 0
GPIO11(SCLK)
Text GLabel 1700 5250 0    50   Input ~ 0
GPIO10(MOSI)
Text GLabel 1700 5350 0    50   Input ~ 0
GPIO8(CE0)
$Comp
L power:+5V #PWR?
U 1 1 5F9A040C
P 4250 1450
F 0 "#PWR?" H 4250 1300 50  0001 C CNN
F 1 "+5V" H 4265 1623 50  0000 C CNN
F 2 "" H 4250 1450 50  0001 C CNN
F 3 "" H 4250 1450 50  0001 C CNN
	1    4250 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 1750 4550 1750
$Comp
L power:GND #PWR?
U 1 1 5F9A4F16
P 4250 2550
F 0 "#PWR?" H 4250 2300 50  0001 C CNN
F 1 "GND" H 4255 2377 50  0000 C CNN
F 2 "" H 4250 2550 50  0001 C CNN
F 3 "" H 4250 2550 50  0001 C CNN
	1    4250 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 2500 4250 2550
Wire Wire Line
	4250 2500 5050 2500
Wire Wire Line
	5050 2500 5050 2450
Wire Wire Line
	4250 2500 4250 2050
Wire Wire Line
	4250 2050 4550 2050
Connection ~ 4250 2500
Wire Wire Line
	4250 1450 4250 1500
Wire Wire Line
	5050 1550 5050 1500
Wire Wire Line
	5050 1500 4250 1500
Connection ~ 4250 1500
Wire Wire Line
	4250 1500 4250 1750
Wire Wire Line
	5550 1750 5600 1750
Wire Wire Line
	5600 1750 5600 1500
Wire Wire Line
	5600 1500 5050 1500
Connection ~ 5050 1500
Wire Wire Line
	5550 2250 5600 2250
Wire Wire Line
	5600 2250 5600 1750
Connection ~ 5600 1750
$Comp
L Device:R_Small R?
U 1 1 5F984F60
P 5900 1850
F 0 "R?" V 5704 1850 50  0000 C CNN
F 1 "6.8k" V 5795 1850 50  0000 C CNN
F 2 "" H 5900 1850 50  0001 C CNN
F 3 "~" H 5900 1850 50  0001 C CNN
	1    5900 1850
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5F9854FB
P 5900 1250
F 0 "R?" V 5704 1250 50  0000 C CNN
F 1 "3.9k" V 5795 1250 50  0000 C CNN
F 2 "" H 5900 1250 50  0001 C CNN
F 3 "~" H 5900 1250 50  0001 C CNN
	1    5900 1250
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5F9857B0
P 6550 1250
F 0 "R?" V 6354 1250 50  0000 C CNN
F 1 "5.6k" V 6445 1250 50  0000 C CNN
F 2 "" H 6550 1250 50  0001 C CNN
F 3 "~" H 6550 1250 50  0001 C CNN
	1    6550 1250
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5F985BD1
P 5850 2650
F 0 "R?" H 5909 2696 50  0000 L CNN
F 1 "6.8k" H 5909 2605 50  0000 L CNN
F 2 "" H 5850 2650 50  0001 C CNN
F 3 "~" H 5850 2650 50  0001 C CNN
	1    5850 2650
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:TL074 U?
U 1 1 5F9860C2
P 6500 1750
F 0 "U?" H 6500 1450 50  0000 C CNN
F 1 "TL074" H 6500 1550 50  0000 C CNN
F 2 "" H 6450 1850 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 6550 1950 50  0001 C CNN
	1    6500 1750
	1    0    0    1   
$EndComp
$Comp
L Amplifier_Operational:TL074 U?
U 2 1 5F987908
P 6500 3050
F 0 "U?" H 6500 3417 50  0000 C CNN
F 1 "TL074" H 6500 3326 50  0000 C CNN
F 2 "" H 6450 3150 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 6550 3250 50  0001 C CNN
	2    6500 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5F991806
P 6100 2050
F 0 "R?" H 6041 2004 50  0000 R CNN
F 1 "33k" H 6041 2095 50  0000 R CNN
F 2 "" H 6100 2050 50  0001 C CNN
F 3 "~" H 6100 2050 50  0001 C CNN
	1    6100 2050
	-1   0    0    1   
$EndComp
Wire Wire Line
	6100 1950 6100 1850
Wire Wire Line
	6100 1850 6000 1850
Wire Wire Line
	6200 1850 6100 1850
Connection ~ 6100 1850
Wire Wire Line
	6450 1250 6100 1250
Wire Wire Line
	6200 1650 6100 1650
Wire Wire Line
	6100 1650 6100 1250
Connection ~ 6100 1250
Wire Wire Line
	6100 1250 6000 1250
Wire Wire Line
	6650 1250 6900 1250
Wire Wire Line
	6900 1250 6900 1750
Wire Wire Line
	6900 1750 6800 1750
$Comp
L power:GND #PWR?
U 1 1 5F9A46E1
P 5750 1300
F 0 "#PWR?" H 5750 1050 50  0001 C CNN
F 1 "GND" H 5755 1127 50  0000 C CNN
F 2 "" H 5750 1300 50  0001 C CNN
F 3 "" H 5750 1300 50  0001 C CNN
	1    5750 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 1300 5750 1250
Wire Wire Line
	5750 1250 5800 1250
Wire Wire Line
	6100 2200 6100 2150
Wire Wire Line
	5850 2150 5550 2150
$Comp
L Device:R_Small R?
U 1 1 5F9AF611
P 5450 2950
F 0 "R?" V 5254 2950 50  0000 C CNN
F 1 "33k" V 5345 2950 50  0000 C CNN
F 2 "" H 5450 2950 50  0001 C CNN
F 3 "~" H 5450 2950 50  0001 C CNN
	1    5450 2950
	0    1    1    0   
$EndComp
Wire Wire Line
	5850 2750 5850 2950
Wire Wire Line
	5250 3050 5250 2950
Wire Wire Line
	5250 2950 5350 2950
Wire Wire Line
	5550 2950 5850 2950
$Comp
L Device:R_Small R?
U 1 1 5F9BA97B
P 5900 3500
F 0 "R?" V 5704 3500 50  0000 C CNN
F 1 "3.9k" V 5795 3500 50  0000 C CNN
F 2 "" H 5900 3500 50  0001 C CNN
F 3 "~" H 5900 3500 50  0001 C CNN
	1    5900 3500
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5F9BA981
P 6550 3500
F 0 "R?" V 6354 3500 50  0000 C CNN
F 1 "5.6k" V 6445 3500 50  0000 C CNN
F 2 "" H 6550 3500 50  0001 C CNN
F 3 "~" H 6550 3500 50  0001 C CNN
	1    6550 3500
	0    1    1    0   
$EndComp
Wire Wire Line
	6650 3500 6900 3500
$Comp
L power:GND #PWR?
U 1 1 5F9BA98C
P 5750 3550
F 0 "#PWR?" H 5750 3300 50  0001 C CNN
F 1 "GND" H 5755 3377 50  0000 C CNN
F 2 "" H 5750 3550 50  0001 C CNN
F 3 "" H 5750 3550 50  0001 C CNN
	1    5750 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 3500 5800 3500
Wire Wire Line
	6000 3500 6100 3500
Wire Wire Line
	6100 3500 6100 3150
Wire Wire Line
	6100 3150 6200 3150
Connection ~ 6100 3500
Wire Wire Line
	6100 3500 6450 3500
Wire Wire Line
	6900 3500 6900 3050
Wire Wire Line
	6900 3050 6800 3050
Wire Wire Line
	5850 2550 5850 2150
Connection ~ 6900 1750
Wire Wire Line
	6900 3050 6950 3050
Connection ~ 6900 3050
Text GLabel 6950 1750 2    50   Input ~ 0
CV_X0
Wire Wire Line
	6900 1750 6950 1750
Text GLabel 6950 3050 2    50   Input ~ 0
CV_Y0
$Comp
L 74xx:74LS244 U?
U 1 1 5F9F21DC
P 2200 5650
F 0 "U?" H 2450 6450 50  0000 C CNN
F 1 "74LS244" H 2450 6350 50  0000 C CNN
F 2 "" H 2200 5650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS244" H 2200 5650 50  0001 C CNN
	1    2200 5650
	1    0    0    -1  
$EndComp
Text GLabel 1700 5450 0    50   Input ~ 0
GPIO7(CE1)
Text Notes 900  5650 0    50   ~ 0
GPIO for mouse 1
Text GLabel 2700 5150 2    50   Input ~ 0
SCK
Text GLabel 2700 5250 2    50   Input ~ 0
SDI
Text GLabel 2700 5350 2    50   Input ~ 0
CS0
Text GLabel 2700 5450 2    50   Input ~ 0
CS1
Text GLabel 2700 5550 2    50   Input ~ 0
GATE1
Text GLabel 2700 5650 2    50   Input ~ 0
TRIG1
Text GLabel 2700 5750 2    50   Input ~ 0
GATE2
Text GLabel 2700 5850 2    50   Input ~ 0
TRIG2
$Comp
L power:+5V #PWR?
U 1 1 5FA02396
P 2200 4550
F 0 "#PWR?" H 2200 4400 50  0001 C CNN
F 1 "+5V" H 2215 4723 50  0000 C CNN
F 2 "" H 2200 4550 50  0001 C CNN
F 3 "" H 2200 4550 50  0001 C CNN
	1    2200 4550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FA0283C
P 2200 6550
F 0 "#PWR?" H 2200 6300 50  0001 C CNN
F 1 "GND" H 2205 6377 50  0000 C CNN
F 2 "" H 2200 6550 50  0001 C CNN
F 3 "" H 2200 6550 50  0001 C CNN
	1    2200 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 6050 1650 6050
Wire Wire Line
	1650 6050 1650 6150
Wire Wire Line
	1650 6150 1700 6150
Wire Wire Line
	2200 6550 2200 6500
Wire Wire Line
	2200 6500 1650 6500
Wire Wire Line
	1650 6500 1650 6150
Connection ~ 2200 6500
Wire Wire Line
	2200 6500 2200 6450
Connection ~ 1650 6150
Text Notes 900  5850 0    50   ~ 0
GPIO for mouse 2
$Comp
L Device:R_Small R?
U 1 1 5FA3592B
P 4100 6600
F 0 "R?" V 3904 6600 50  0000 C CNN
F 1 "5k" V 3995 6600 50  0000 C CNN
F 2 "" H 4100 6600 50  0001 C CNN
F 3 "~" H 4100 6600 50  0001 C CNN
	1    4100 6600
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5FA360C5
P 4300 6800
F 0 "R?" H 4241 6754 50  0000 R CNN
F 1 "10k" H 4241 6845 50  0000 R CNN
F 2 "" H 4300 6800 50  0001 C CNN
F 3 "~" H 4300 6800 50  0001 C CNN
	1    4300 6800
	-1   0    0    1   
$EndComp
Wire Wire Line
	4300 6700 4300 6600
Wire Wire Line
	4300 6600 4200 6600
Text GLabel 3850 6600 0    50   Input ~ 0
CLOCK_IN
Wire Wire Line
	3850 6600 4000 6600
$Comp
L power:GND #PWR?
U 1 1 5FA40CC6
P 4300 6950
F 0 "#PWR?" H 4300 6700 50  0001 C CNN
F 1 "GND" H 4305 6777 50  0000 C CNN
F 2 "" H 4300 6950 50  0001 C CNN
F 3 "" H 4300 6950 50  0001 C CNN
	1    4300 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 6950 4300 6900
Connection ~ 4300 6600
Wire Wire Line
	4300 6600 4550 6600
Text Notes 4550 6600 0    50   ~ 0
GPIO for clock input
Text GLabel 4550 2150 0    50   Input ~ 0
SDI
Text GLabel 4550 2250 0    50   Input ~ 0
CS0
Text Notes 3550 800  0    50   ~ 0
DAC0
Wire Notes Line
	1650 5550 1600 5550
Wire Notes Line
	1600 5550 1600 5650
Wire Notes Line
	1600 5650 1650 5650
Wire Notes Line
	1650 5750 1600 5750
Wire Notes Line
	1600 5750 1600 5850
Wire Notes Line
	1600 5850 1650 5850
$Comp
L Amplifier_Operational:TL074 U?
U 5 1 5FB81C4E
P 4250 5200
F 0 "U?" H 4208 5246 50  0000 L CNN
F 1 "TL074" H 4208 5155 50  0000 L CNN
F 2 "" H 4200 5300 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 4300 5400 50  0001 C CNN
	5    4250 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 4550 2200 4700
$Comp
L power:GND #PWR?
U 1 1 5FA27ED5
P 1650 4750
F 0 "#PWR?" H 1650 4500 50  0001 C CNN
F 1 "GND" H 1655 4577 50  0000 C CNN
F 2 "" H 1650 4750 50  0001 C CNN
F 3 "" H 1650 4750 50  0001 C CNN
	1    1650 4750
	-1   0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5FA4B461
P 1900 4700
F 0 "C?" V 1671 4700 50  0000 C CNN
F 1 "0.1uF" V 1762 4700 50  0000 C CNN
F 2 "" H 1900 4700 50  0001 C CNN
F 3 "~" H 1900 4700 50  0001 C CNN
	1    1900 4700
	0    -1   1    0   
$EndComp
Wire Wire Line
	2000 4700 2200 4700
Connection ~ 2200 4700
Wire Wire Line
	2200 4700 2200 4850
Wire Wire Line
	1650 4700 1800 4700
Wire Wire Line
	1650 4750 1650 4700
$Comp
L Device:C_Small C?
U 1 1 5FAA2A19
P 4500 4800
F 0 "C?" V 4271 4800 50  0000 C CNN
F 1 "0.1uF" V 4362 4800 50  0000 C CNN
F 2 "" H 4500 4800 50  0001 C CNN
F 3 "~" H 4500 4800 50  0001 C CNN
	1    4500 4800
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FAA3016
P 4950 5300
F 0 "#PWR?" H 4950 5050 50  0001 C CNN
F 1 "GND" H 4955 5127 50  0000 C CNN
F 2 "" H 4950 5300 50  0001 C CNN
F 3 "" H 4950 5300 50  0001 C CNN
	1    4950 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5FAA33D3
P 4500 5600
F 0 "C?" V 4271 5600 50  0000 C CNN
F 1 "0.1uF" V 4362 5600 50  0000 C CNN
F 2 "" H 4500 5600 50  0001 C CNN
F 3 "~" H 4500 5600 50  0001 C CNN
	1    4500 5600
	0    1    1    0   
$EndComp
Wire Wire Line
	4400 5600 4150 5600
Wire Wire Line
	4150 5600 4150 5500
Wire Wire Line
	4150 5700 4150 5600
Connection ~ 4150 5600
Wire Wire Line
	4400 4800 4150 4800
Wire Wire Line
	4150 4800 4150 4900
Wire Wire Line
	4150 4800 4150 4700
Connection ~ 4150 4800
Wire Wire Line
	4950 5300 4950 5200
Wire Wire Line
	4950 5200 4800 5200
Wire Wire Line
	4800 5200 4800 4800
Wire Wire Line
	4800 4800 4600 4800
Wire Wire Line
	4600 5600 4800 5600
Wire Wire Line
	4800 5600 4800 5200
Connection ~ 4800 5200
$Comp
L power:-12V #PWR?
U 1 1 5FBAFEA1
P 5250 3050
F 0 "#PWR?" H 5250 3150 50  0001 C CNN
F 1 "-12V" H 5265 3223 50  0000 C CNN
F 2 "" H 5250 3050 50  0001 C CNN
F 3 "" H 5250 3050 50  0001 C CNN
	1    5250 3050
	-1   0    0    1   
$EndComp
$Comp
L power:-12V #PWR?
U 1 1 5FBB05B7
P 6100 2200
F 0 "#PWR?" H 6100 2300 50  0001 C CNN
F 1 "-12V" H 6115 2373 50  0000 C CNN
F 2 "" H 6100 2200 50  0001 C CNN
F 3 "" H 6100 2200 50  0001 C CNN
	1    6100 2200
	-1   0    0    1   
$EndComp
$Comp
L power:-12V #PWR?
U 1 1 5FBFC8A7
P 4150 5700
F 0 "#PWR?" H 4150 5800 50  0001 C CNN
F 1 "-12V" H 4165 5873 50  0000 C CNN
F 2 "" H 4150 5700 50  0001 C CNN
F 3 "" H 4150 5700 50  0001 C CNN
	1    4150 5700
	-1   0    0    1   
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 5FBFD9A1
P 4150 4700
F 0 "#PWR?" H 4150 4550 50  0001 C CNN
F 1 "+12V" H 4165 4873 50  0000 C CNN
F 2 "" H 4150 4700 50  0001 C CNN
F 3 "" H 4150 4700 50  0001 C CNN
	1    4150 4700
	1    0    0    -1  
$EndComp
Text GLabel 4550 1950 0    50   Input ~ 0
SCK
$Comp
L Device:C_Small C?
U 1 1 5FC2D6E0
P 4250 1900
F 0 "C?" H 4159 1854 50  0000 R CNN
F 1 "0.1uF" H 4159 1945 50  0000 R CNN
F 2 "" H 4250 1900 50  0001 C CNN
F 3 "~" H 4250 1900 50  0001 C CNN
	1    4250 1900
	1    0    0    1   
$EndComp
Wire Wire Line
	4250 1800 4250 1750
Connection ~ 4250 1750
Wire Wire Line
	4250 2000 4250 2050
Connection ~ 4250 2050
$Comp
L Device:C_Small C?
U 1 1 5FC37CD2
P 3850 1900
F 0 "C?" H 3759 1854 50  0000 R CNN
F 1 "10uF" H 3759 1945 50  0000 R CNN
F 2 "" H 3850 1900 50  0001 C CNN
F 3 "~" H 3850 1900 50  0001 C CNN
	1    3850 1900
	1    0    0    1   
$EndComp
Wire Wire Line
	3850 1800 3850 1750
Wire Wire Line
	3850 1750 4250 1750
Wire Wire Line
	3850 2000 3850 2050
Wire Wire Line
	3850 2050 4250 2050
Wire Wire Line
	5800 1850 5550 1850
Wire Wire Line
	5750 3500 5750 3550
Wire Wire Line
	6200 2950 5850 2950
Connection ~ 5850 2950
Wire Notes Line
	3550 800  3550 3950
Wire Notes Line
	3550 3950 7300 3950
Wire Notes Line
	7300 3950 7300 800 
Wire Notes Line
	7300 800  3550 800 
$Comp
L Analog_DAC:MCP4922 U?
U 1 1 5FCAD1B0
P 8850 1950
F 0 "U?" H 8850 2531 50  0000 C CNN
F 1 "MCP4922" H 8850 2440 50  0000 C CNN
F 2 "" H 9650 1650 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/22250A.pdf" H 9650 1650 50  0001 C CNN
	1    8850 1950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FCAD1B6
P 8050 1450
F 0 "#PWR?" H 8050 1300 50  0001 C CNN
F 1 "+5V" H 8065 1623 50  0000 C CNN
F 2 "" H 8050 1450 50  0001 C CNN
F 3 "" H 8050 1450 50  0001 C CNN
	1    8050 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 1750 8350 1750
$Comp
L power:GND #PWR?
U 1 1 5FCAD1BD
P 8050 2550
F 0 "#PWR?" H 8050 2300 50  0001 C CNN
F 1 "GND" H 8055 2377 50  0000 C CNN
F 2 "" H 8050 2550 50  0001 C CNN
F 3 "" H 8050 2550 50  0001 C CNN
	1    8050 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 2500 8050 2550
Wire Wire Line
	8050 2500 8850 2500
Wire Wire Line
	8850 2500 8850 2450
Wire Wire Line
	8050 2500 8050 2050
Wire Wire Line
	8050 2050 8350 2050
Connection ~ 8050 2500
Wire Wire Line
	8050 1450 8050 1500
Wire Wire Line
	8850 1550 8850 1500
Wire Wire Line
	8850 1500 8050 1500
Connection ~ 8050 1500
Wire Wire Line
	8050 1500 8050 1750
Wire Wire Line
	9350 1750 9400 1750
Wire Wire Line
	9400 1750 9400 1500
Wire Wire Line
	9400 1500 8850 1500
Connection ~ 8850 1500
Wire Wire Line
	9350 2250 9400 2250
Wire Wire Line
	9400 2250 9400 1750
Connection ~ 9400 1750
$Comp
L Device:R_Small R?
U 1 1 5FCAD1D5
P 9700 1850
F 0 "R?" V 9504 1850 50  0000 C CNN
F 1 "6.8k" V 9595 1850 50  0000 C CNN
F 2 "" H 9700 1850 50  0001 C CNN
F 3 "~" H 9700 1850 50  0001 C CNN
	1    9700 1850
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5FCAD1DB
P 9700 1250
F 0 "R?" V 9504 1250 50  0000 C CNN
F 1 "3.9k" V 9595 1250 50  0000 C CNN
F 2 "" H 9700 1250 50  0001 C CNN
F 3 "~" H 9700 1250 50  0001 C CNN
	1    9700 1250
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5FCAD1E1
P 10350 1250
F 0 "R?" V 10154 1250 50  0000 C CNN
F 1 "5.6k" V 10245 1250 50  0000 C CNN
F 2 "" H 10350 1250 50  0001 C CNN
F 3 "~" H 10350 1250 50  0001 C CNN
	1    10350 1250
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5FCAD1E7
P 9650 2650
F 0 "R?" H 9709 2696 50  0000 L CNN
F 1 "6.8k" H 9709 2605 50  0000 L CNN
F 2 "" H 9650 2650 50  0001 C CNN
F 3 "~" H 9650 2650 50  0001 C CNN
	1    9650 2650
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:TL074 U?
U 1 1 5FCAD1ED
P 10300 1750
F 0 "U?" H 10300 1450 50  0000 C CNN
F 1 "TL074" H 10300 1550 50  0000 C CNN
F 2 "" H 10250 1850 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 10350 1950 50  0001 C CNN
	1    10300 1750
	1    0    0    1   
$EndComp
$Comp
L Amplifier_Operational:TL074 U?
U 2 1 5FCAD1F3
P 10300 3050
F 0 "U?" H 10300 3417 50  0000 C CNN
F 1 "TL074" H 10300 3326 50  0000 C CNN
F 2 "" H 10250 3150 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 10350 3250 50  0001 C CNN
	2    10300 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5FCAD1F9
P 9900 2050
F 0 "R?" H 9841 2004 50  0000 R CNN
F 1 "33k" H 9841 2095 50  0000 R CNN
F 2 "" H 9900 2050 50  0001 C CNN
F 3 "~" H 9900 2050 50  0001 C CNN
	1    9900 2050
	-1   0    0    1   
$EndComp
Wire Wire Line
	9900 1950 9900 1850
Wire Wire Line
	9900 1850 9800 1850
Wire Wire Line
	10000 1850 9900 1850
Connection ~ 9900 1850
Wire Wire Line
	10250 1250 9900 1250
Wire Wire Line
	10000 1650 9900 1650
Wire Wire Line
	9900 1650 9900 1250
Connection ~ 9900 1250
Wire Wire Line
	9900 1250 9800 1250
Wire Wire Line
	10450 1250 10700 1250
Wire Wire Line
	10700 1250 10700 1750
Wire Wire Line
	10700 1750 10600 1750
$Comp
L power:GND #PWR?
U 1 1 5FCAD20B
P 9550 1300
F 0 "#PWR?" H 9550 1050 50  0001 C CNN
F 1 "GND" H 9555 1127 50  0000 C CNN
F 2 "" H 9550 1300 50  0001 C CNN
F 3 "" H 9550 1300 50  0001 C CNN
	1    9550 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 1300 9550 1250
Wire Wire Line
	9550 1250 9600 1250
Wire Wire Line
	9900 2200 9900 2150
Wire Wire Line
	9650 2150 9350 2150
$Comp
L Device:R_Small R?
U 1 1 5FCAD215
P 9250 2950
F 0 "R?" V 9054 2950 50  0000 C CNN
F 1 "33k" V 9145 2950 50  0000 C CNN
F 2 "" H 9250 2950 50  0001 C CNN
F 3 "~" H 9250 2950 50  0001 C CNN
	1    9250 2950
	0    1    1    0   
$EndComp
Wire Wire Line
	9650 2750 9650 2950
Wire Wire Line
	9050 3050 9050 2950
Wire Wire Line
	9050 2950 9150 2950
Wire Wire Line
	9350 2950 9650 2950
$Comp
L Device:R_Small R?
U 1 1 5FCAD21F
P 9700 3500
F 0 "R?" V 9504 3500 50  0000 C CNN
F 1 "3.9k" V 9595 3500 50  0000 C CNN
F 2 "" H 9700 3500 50  0001 C CNN
F 3 "~" H 9700 3500 50  0001 C CNN
	1    9700 3500
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5FCAD225
P 10350 3500
F 0 "R?" V 10154 3500 50  0000 C CNN
F 1 "5.6k" V 10245 3500 50  0000 C CNN
F 2 "" H 10350 3500 50  0001 C CNN
F 3 "~" H 10350 3500 50  0001 C CNN
	1    10350 3500
	0    1    1    0   
$EndComp
Wire Wire Line
	10450 3500 10700 3500
$Comp
L power:GND #PWR?
U 1 1 5FCAD22C
P 9550 3550
F 0 "#PWR?" H 9550 3300 50  0001 C CNN
F 1 "GND" H 9555 3377 50  0000 C CNN
F 2 "" H 9550 3550 50  0001 C CNN
F 3 "" H 9550 3550 50  0001 C CNN
	1    9550 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 3500 9600 3500
Wire Wire Line
	9800 3500 9900 3500
Wire Wire Line
	9900 3500 9900 3150
Wire Wire Line
	9900 3150 10000 3150
Connection ~ 9900 3500
Wire Wire Line
	9900 3500 10250 3500
Wire Wire Line
	10700 3500 10700 3050
Wire Wire Line
	10700 3050 10600 3050
Wire Wire Line
	9650 2550 9650 2150
Connection ~ 10700 1750
Wire Wire Line
	10700 3050 10750 3050
Connection ~ 10700 3050
Text GLabel 10750 1750 2    50   Input ~ 0
CV_X1
Wire Wire Line
	10700 1750 10750 1750
Text GLabel 10750 3050 2    50   Input ~ 0
CV_Y1
Text GLabel 8350 2150 0    50   Input ~ 0
SDI
Text Notes 7350 800  0    50   ~ 0
DAC1
$Comp
L power:-12V #PWR?
U 1 1 5FCAD244
P 9050 3050
F 0 "#PWR?" H 9050 3150 50  0001 C CNN
F 1 "-12V" H 9065 3223 50  0000 C CNN
F 2 "" H 9050 3050 50  0001 C CNN
F 3 "" H 9050 3050 50  0001 C CNN
	1    9050 3050
	-1   0    0    1   
$EndComp
$Comp
L power:-12V #PWR?
U 1 1 5FCAD24A
P 9900 2200
F 0 "#PWR?" H 9900 2300 50  0001 C CNN
F 1 "-12V" H 9915 2373 50  0000 C CNN
F 2 "" H 9900 2200 50  0001 C CNN
F 3 "" H 9900 2200 50  0001 C CNN
	1    9900 2200
	-1   0    0    1   
$EndComp
Text GLabel 8350 1950 0    50   Input ~ 0
SCK
$Comp
L Device:C_Small C?
U 1 1 5FCAD251
P 8050 1900
F 0 "C?" H 7959 1854 50  0000 R CNN
F 1 "0.1uF" H 7959 1945 50  0000 R CNN
F 2 "" H 8050 1900 50  0001 C CNN
F 3 "~" H 8050 1900 50  0001 C CNN
	1    8050 1900
	1    0    0    1   
$EndComp
Wire Wire Line
	8050 1800 8050 1750
Connection ~ 8050 1750
Wire Wire Line
	8050 2000 8050 2050
Connection ~ 8050 2050
$Comp
L Device:C_Small C?
U 1 1 5FCAD25B
P 7650 1900
F 0 "C?" H 7559 1854 50  0000 R CNN
F 1 "10uF" H 7559 1945 50  0000 R CNN
F 2 "" H 7650 1900 50  0001 C CNN
F 3 "~" H 7650 1900 50  0001 C CNN
	1    7650 1900
	1    0    0    1   
$EndComp
Wire Wire Line
	7650 1800 7650 1750
Wire Wire Line
	7650 1750 8050 1750
Wire Wire Line
	7650 2000 7650 2050
Wire Wire Line
	7650 2050 8050 2050
Wire Wire Line
	9600 1850 9350 1850
Wire Wire Line
	9550 3500 9550 3550
Wire Wire Line
	10000 2950 9650 2950
Connection ~ 9650 2950
Wire Notes Line
	7350 800  7350 3950
Wire Notes Line
	7350 3950 11100 3950
Wire Notes Line
	11100 3950 11100 800 
Wire Notes Line
	11100 800  7350 800 
Text GLabel 8350 2250 0    50   Input ~ 0
CS1
$EndSCHEMATC
