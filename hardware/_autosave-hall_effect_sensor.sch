EESchema Schematic File Version 4
LIBS:basicsensormodule-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 6
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
L Sensor_Magnetic:A1101ELHL U?
U 1 1 5CD661D6
P 5650 2950
AR Path="/5CD661D6" Ref="U?"  Part="1" 
AR Path="/5CD559BA/5CD661D6" Ref="U301"  Part="1" 
F 0 "U301" H 5420 2996 50  0000 R CNN
F 1 "A1101ELHL" H 5420 2905 50  0000 R CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5650 2600 50  0001 L CIN
F 3 "http://www.allegromicro.com/en/Products/Part_Numbers/1101/1101.pdf" H 5650 3600 50  0001 C CNN
	1    5650 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Zener_Small Z?
U 1 1 5CD661E2
P 4300 2900
AR Path="/5CD661E2" Ref="Z?"  Part="1" 
AR Path="/5CD559BA/5CD661E2" Ref="Z101"  Part="1" 
F 0 "Z101" V 4254 2968 50  0000 L CNN
F 1 "4.7V" V 4345 2968 50  0000 L CNN
F 2 "Diode_SMD:D_MiniMELF_Handsoldering" V 4300 2900 50  0001 C CNN
F 3 "~" V 4300 2900 50  0001 C CNN
	1    4300 2900
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5CD661E8
P 4750 2900
AR Path="/5CD661E8" Ref="C?"  Part="1" 
AR Path="/5CD559BA/5CD661E8" Ref="C101"  Part="1" 
F 0 "C101" H 4842 2946 50  0000 L CNN
F 1 "100n" H 4842 2855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4750 2900 50  0001 C CNN
F 3 "~" H 4750 2900 50  0001 C CNN
	1    4750 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5CD661EE
P 6400 2600
AR Path="/5CD661EE" Ref="R?"  Part="1" 
AR Path="/5CD559BA/5CD661EE" Ref="R102"  Part="1" 
F 0 "R102" H 6459 2646 50  0000 L CNN
F 1 "10k" H 6459 2555 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6400 2600 50  0001 C CNN
F 3 "~" H 6400 2600 50  0001 C CNN
	1    6400 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Small D?
U 1 1 5CD661F4
P 3650 2450
AR Path="/5CD661F4" Ref="D?"  Part="1" 
AR Path="/5CD559BA/5CD661F4" Ref="D101"  Part="1" 
F 0 "D101" H 3650 2245 50  0000 C CNN
F 1 "LL4148" H 3650 2336 50  0000 C CNN
F 2 "Diode_SMD:D_MiniMELF_Handsoldering" V 3650 2450 50  0001 C CNN
F 3 "~" V 3650 2450 50  0001 C CNN
	1    3650 2450
	-1   0    0    1   
$EndComp
Wire Wire Line
	3750 2450 3850 2450
Wire Wire Line
	4200 2450 4300 2450
Wire Wire Line
	6400 2450 6400 2500
Wire Wire Line
	4300 2800 4300 2650
Connection ~ 4300 2450
Wire Wire Line
	4300 2450 4750 2450
Wire Wire Line
	4750 2800 4750 2450
Connection ~ 4750 2450
Wire Wire Line
	6400 3200 6400 2950
$Comp
L power:GND #PWR?
U 1 1 5CD66207
P 6400 3550
AR Path="/5CD66207" Ref="#PWR?"  Part="1" 
AR Path="/5CD559BA/5CD66207" Ref="#PWR0110"  Part="1" 
F 0 "#PWR0110" H 6400 3300 50  0001 C CNN
F 1 "GND" H 6405 3377 50  0000 C CNN
F 2 "" H 6400 3550 50  0001 C CNN
F 3 "" H 6400 3550 50  0001 C CNN
	1    6400 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5CD6620F
P 5550 3550
AR Path="/5CD6620F" Ref="#PWR?"  Part="1" 
AR Path="/5CD559BA/5CD6620F" Ref="#PWR0111"  Part="1" 
F 0 "#PWR0111" H 5550 3300 50  0001 C CNN
F 1 "GND" H 5555 3377 50  0000 C CNN
F 2 "" H 5550 3550 50  0001 C CNN
F 3 "" H 5550 3550 50  0001 C CNN
	1    5550 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 3550 5550 3450
Wire Wire Line
	5550 3450 4750 3450
Wire Wire Line
	4300 3450 4300 3000
Connection ~ 5550 3450
Wire Wire Line
	5550 3450 5550 3350
Wire Wire Line
	4750 3000 4750 3450
Connection ~ 4750 3450
Wire Wire Line
	4750 3450 4300 3450
$Comp
L power:+5V #PWR?
U 1 1 5CD6621D
P 3450 2400
AR Path="/5CD6621D" Ref="#PWR?"  Part="1" 
AR Path="/5CD559BA/5CD6621D" Ref="#PWR0112"  Part="1" 
F 0 "#PWR0112" H 3450 2250 50  0001 C CNN
F 1 "+5V" H 3465 2573 50  0000 C CNN
F 2 "" H 3450 2400 50  0001 C CNN
F 3 "" H 3450 2400 50  0001 C CNN
	1    3450 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 2950 6400 2950
Connection ~ 6400 2950
Wire Wire Line
	6400 2950 6400 2700
Wire Wire Line
	6400 3550 6400 3500
$Comp
L Device:C_Small C?
U 1 1 5CD66228
P 6400 3300
AR Path="/5CD66228" Ref="C?"  Part="1" 
AR Path="/5CD559BA/5CD66228" Ref="C1"  Part="1" 
F 0 "C1" H 6492 3346 50  0000 L CNN
F 1 "4.7n" H 6492 3255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6400 3300 50  0001 C CNN
F 3 "~" H 6400 3300 50  0001 C CNN
	1    6400 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 2450 5550 2450
Wire Wire Line
	5550 2550 5550 2450
Connection ~ 5550 2450
Wire Wire Line
	5550 2450 6400 2450
$Comp
L power:+5V #PWR?
U 1 1 5CD6D8F6
P 3450 2800
AR Path="/5CD6D8F6" Ref="#PWR?"  Part="1" 
AR Path="/5CD559BA/5CD6D8F6" Ref="#PWR0113"  Part="1" 
F 0 "#PWR0113" H 3450 2650 50  0001 C CNN
F 1 "+5V" H 3465 2973 50  0000 C CNN
F 2 "" H 3450 2800 50  0001 C CNN
F 3 "" H 3450 2800 50  0001 C CNN
	1    3450 2800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5CD6DFF4
P 3450 3050
AR Path="/5CD6DFF4" Ref="#PWR?"  Part="1" 
AR Path="/5CD559BA/5CD6DFF4" Ref="#PWR0114"  Part="1" 
F 0 "#PWR0114" H 3450 2800 50  0001 C CNN
F 1 "GND" H 3455 2877 50  0000 C CNN
F 2 "" H 3450 3050 50  0001 C CNN
F 3 "" H 3450 3050 50  0001 C CNN
	1    3450 3050
	1    0    0    -1  
$EndComp
Text HLabel 3250 2800 0    50   Input ~ 0
VCC
Wire Wire Line
	3250 2800 3450 2800
Text HLabel 3250 3050 0    50   Output ~ 0
GND
Wire Wire Line
	3250 3050 3450 3050
Wire Wire Line
	3550 2450 3450 2450
Wire Wire Line
	3450 2450 3450 2400
Text HLabel 7400 2950 2    50   Output ~ 0
VOUT
Wire Wire Line
	6400 2950 6900 2950
$Comp
L Device:D_Zener_Small Z?
U 1 1 5CD77936
P 6900 3300
AR Path="/5CD77936" Ref="Z?"  Part="1" 
AR Path="/5CD559BA/5CD77936" Ref="Z102"  Part="1" 
F 0 "Z102" V 6854 3368 50  0000 L CNN
F 1 "4.7V" V 6945 3368 50  0000 L CNN
F 2 "Diode_SMD:D_MiniMELF_Handsoldering" V 6900 3300 50  0001 C CNN
F 3 "~" V 6900 3300 50  0001 C CNN
	1    6900 3300
	0    1    1    0   
$EndComp
Wire Wire Line
	6900 3200 6900 2950
Connection ~ 6900 2950
Wire Wire Line
	6900 2950 7400 2950
Wire Wire Line
	6900 3400 6900 3500
Wire Wire Line
	6900 3500 6400 3500
Connection ~ 6400 3500
Wire Wire Line
	6400 3500 6400 3400
$Comp
L Device:R_Small R?
U 1 1 5CDCB5EE
P 4100 2150
AR Path="/5CDCB5EE" Ref="R?"  Part="1" 
AR Path="/5CD559BA/5CDCB5EE" Ref="R601"  Part="1" 
F 0 "R601" V 3904 2150 50  0000 C CNN
F 1 "330" V 3995 2150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4100 2150 50  0001 C CNN
F 3 "~" H 4100 2150 50  0001 C CNN
	1    4100 2150
	0    1    1    0   
$EndComp
Wire Wire Line
	4200 2650 4300 2650
Connection ~ 4300 2650
Wire Wire Line
	4300 2650 4300 2450
Wire Wire Line
	4200 2150 4300 2150
Wire Wire Line
	4300 2150 4300 2450
Wire Wire Line
	4000 2650 3850 2650
Wire Wire Line
	3850 2650 3850 2450
Connection ~ 3850 2450
Wire Wire Line
	3850 2450 4000 2450
$Comp
L Device:R_Small R?
U 1 1 5CDCB2C6
P 4100 2650
AR Path="/5CDCB2C6" Ref="R?"  Part="1" 
AR Path="/5CD559BA/5CDCB2C6" Ref="R103"  Part="1" 
F 0 "R103" V 4296 2650 50  0000 C CNN
F 1 "330" V 4205 2650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4100 2650 50  0001 C CNN
F 3 "~" H 4100 2650 50  0001 C CNN
	1    4100 2650
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5CD661DC
P 4100 2450
AR Path="/5CD661DC" Ref="R?"  Part="1" 
AR Path="/5CD559BA/5CD661DC" Ref="R101"  Part="1" 
F 0 "R101" V 3904 2450 50  0000 C CNN
F 1 "330" V 3995 2450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4100 2450 50  0001 C CNN
F 3 "~" H 4100 2450 50  0001 C CNN
	1    4100 2450
	0    1    1    0   
$EndComp
Wire Wire Line
	3850 2450 3850 2150
Wire Wire Line
	3850 2150 4000 2150
$EndSCHEMATC
