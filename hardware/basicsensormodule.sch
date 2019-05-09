EESchema Schematic File Version 4
LIBS:basicsensormodule-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 6050 4000 1350 1250
U 5AABFC1B
F0 "CANBUS" 60
F1 "canbus.sch" 60
F2 "SI" I L 6050 4300 60 
F3 "SO" O L 6050 4200 60 
F4 "CS" I L 6050 4400 60 
F5 "SCK" I L 6050 4100 60 
F6 "INT" O L 6050 4500 60 
F7 "GND" O R 7400 4150 60 
F8 "VCC" I R 7400 4050 60 
F9 "CAN_H" B R 7400 4250 60 
F10 "CAN_L" B R 7400 4350 60 
$EndSheet
$Sheet
S 4350 3600 1150 1150
U 5AACA401
F0 "MCU" 60
F1 "atmega328p.sch" 60
F2 "SPI_MISO" I R 5500 4200 60 
F3 "SPI_MOSI" O R 5500 4300 60 
F4 "MCP_INT" I R 5500 4500 60 
F5 "VCC" I L 4350 3900 60 
F6 "GND" O L 4350 4100 60 
F7 "SPI_SCK" O R 5500 4100 50 
F8 "MCP_SS" O R 5500 4400 50 
F9 "SCL" I L 4350 4350 50 
F10 "SDA" I L 4350 4475 50 
F11 "VOUT" I R 5500 4600 50 
$EndSheet
$Sheet
S 7750 2950 1050 500 
U 5AACFFEF
F0 "POWER SUPPLY" 60
F1 "supplies.sch" 60
F2 "GND" O R 8800 3250 60 
F3 "+5V_OUT" O L 7750 3250 60 
F4 "+18V_IN" I R 8800 3150 60 
F5 "+18V_OUT" I L 7750 3150 60 
$EndSheet
$Sheet
S 9400 3100 600  450 
U 5AAD16DD
F0 "CANBUS CONN" 60
F1 "canbus_connector.sch" 60
F2 "CAN_H" B L 9400 3350 60 
F3 "CAN_L" B L 9400 3450 60 
F4 "CAN_18V" O L 9400 3150 60 
F5 "CAN_GND" B L 9400 3250 60 
$EndSheet
Wire Wire Line
	6050 4500 5500 4500
Wire Wire Line
	6050 4400 5500 4400
Wire Wire Line
	6050 4200 5500 4200
Wire Wire Line
	6050 4100 5500 4100
Wire Wire Line
	5500 4300 6050 4300
Text Label 5650 4300 0    60   ~ 0
MOSI
Text Label 5650 4200 0    60   ~ 0
MISO
Text Label 5650 4100 0    60   ~ 0
SCK
Wire Wire Line
	9400 3150 8800 3150
Wire Wire Line
	8800 3250 9000 3250
Wire Wire Line
	9400 3350 9100 3350
Wire Wire Line
	9100 3350 9100 4250
Wire Wire Line
	9100 4250 7400 4250
Wire Wire Line
	7400 4350 9200 4350
Wire Wire Line
	9200 4350 9200 3450
Wire Wire Line
	9200 3450 9400 3450
Wire Wire Line
	9000 3250 9000 4150
Wire Wire Line
	9000 4150 7600 4150
Connection ~ 9000 3250
Wire Wire Line
	7750 3250 7550 3250
Wire Wire Line
	7550 3250 7550 3800
Wire Wire Line
	7550 4050 7400 4050
Wire Wire Line
	7600 4150 7600 4550
Connection ~ 7600 4150
Wire Wire Line
	7600 4150 7400 4150
Wire Wire Line
	7400 3700 7400 3800
Wire Wire Line
	7400 3800 7550 3800
Connection ~ 7550 3800
Wire Wire Line
	7550 3800 7550 4050
$Comp
L Device:C_Small C102
U 1 1 5BE67608
P 3525 3925
F 0 "C102" H 3625 4000 50  0000 L CNN
F 1 "100nF" H 3625 3925 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3525 3925 50  0001 C CNN
F 3 "~" H 3525 3925 50  0001 C CNN
	1    3525 3925
	1    0    0    -1  
$EndComp
$Comp
L basicsensormodule-rescue:MountingHole-Mechanical H104
U 1 1 5BE9AF15
P 6300 7650
F 0 "H104" H 6400 7700 50  0000 L CNN
F 1 "MountingHole" H 6400 7650 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 6300 7650 50  0001 C CNN
F 3 "~" H 6300 7650 50  0001 C CNN
	1    6300 7650
	1    0    0    -1  
$EndComp
$Comp
L basicsensormodule-rescue:MountingHole-Mechanical H103
U 1 1 5BE9BC53
P 6300 7450
F 0 "H103" H 6400 7500 50  0000 L CNN
F 1 "MountingHole" H 6400 7450 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 6300 7450 50  0001 C CNN
F 3 "~" H 6300 7450 50  0001 C CNN
	1    6300 7450
	1    0    0    -1  
$EndComp
$Comp
L basicsensormodule-rescue:MountingHole-Mechanical H102
U 1 1 5BE9BC79
P 6300 7250
F 0 "H102" H 6400 7300 50  0000 L CNN
F 1 "MountingHole" H 6400 7250 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 6300 7250 50  0001 C CNN
F 3 "~" H 6300 7250 50  0001 C CNN
	1    6300 7250
	1    0    0    -1  
$EndComp
$Comp
L basicsensormodule-rescue:MountingHole-Mechanical H101
U 1 1 5BE9BC9F
P 6300 7050
F 0 "H101" H 6400 7100 50  0000 L CNN
F 1 "MountingHole" H 6400 7050 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 6300 7050 50  0001 C CNN
F 3 "~" H 6300 7050 50  0001 C CNN
	1    6300 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 3250 9400 3250
$Comp
L power:GND #PWR0103
U 1 1 5BE8F87F
P 7600 4550
F 0 "#PWR0103" H 7600 4300 50  0001 C CNN
F 1 "GND" H 7650 4350 50  0000 C CNN
F 2 "" H 7600 4550 50  0001 C CNN
F 3 "" H 7600 4550 50  0001 C CNN
	1    7600 4550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0104
U 1 1 5BE8FC8C
P 3525 3650
F 0 "#PWR0104" H 3525 3500 50  0001 C CNN
F 1 "+5V" H 3575 3850 50  0000 C CNN
F 2 "" H 3525 3650 50  0001 C CNN
F 3 "" H 3525 3650 50  0001 C CNN
	1    3525 3650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0105
U 1 1 5BE8FCAE
P 7400 3700
F 0 "#PWR0105" H 7400 3550 50  0001 C CNN
F 1 "+5V" H 7450 3900 50  0000 C CNN
F 2 "" H 7400 3700 50  0001 C CNN
F 3 "" H 7400 3700 50  0001 C CNN
	1    7400 3700
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J1
U 1 1 5CB1A26C
P 3000 4125
F 0 "J1" H 3080 4117 50  0000 L CNN
F 1 "Conn_01x04" H 3080 4026 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 3000 4125 50  0001 C CNN
F 3 "~" H 3000 4125 50  0001 C CNN
	1    3000 4125
	-1   0    0    1   
$EndComp
Wire Wire Line
	3525 3775 3525 3825
Wire Wire Line
	3525 3650 3525 3775
Connection ~ 3525 3775
$Comp
L power:GND #PWR0101
U 1 1 5BE8F6F0
P 3525 4225
F 0 "#PWR0101" H 3525 3975 50  0001 C CNN
F 1 "GND" H 3625 4100 50  0000 C CNN
F 2 "" H 3525 4225 50  0001 C CNN
F 3 "" H 3525 4225 50  0001 C CNN
	1    3525 4225
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 4025 3525 4025
Wire Wire Line
	3200 3775 3200 3925
Wire Wire Line
	3200 3775 3525 3775
Wire Wire Line
	3200 4125 4150 4125
Wire Wire Line
	4150 4125 4150 4350
Wire Wire Line
	4150 4350 4350 4350
Wire Wire Line
	3275 4475 3275 4225
Wire Wire Line
	3275 4225 3200 4225
Wire Wire Line
	3275 4475 4350 4475
Wire Wire Line
	3525 4225 3525 4025
Connection ~ 3525 4025
$Comp
L power:+5V #PWR0102
U 1 1 5CB14A9F
P 4175 3875
F 0 "#PWR0102" H 4175 3725 50  0001 C CNN
F 1 "+5V" H 4225 4075 50  0000 C CNN
F 2 "" H 4175 3875 50  0001 C CNN
F 3 "" H 4175 3875 50  0001 C CNN
	1    4175 3875
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5CB14AC2
P 4225 4100
F 0 "#PWR0106" H 4225 3850 50  0001 C CNN
F 1 "GND" H 4275 3950 50  0000 C CNN
F 2 "" H 4225 4100 50  0001 C CNN
F 3 "" H 4225 4100 50  0001 C CNN
	1    4225 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4225 4100 4350 4100
Wire Wire Line
	4350 3900 4175 3900
Wire Wire Line
	4175 3900 4175 3875
$Sheet
S 4400 5400 1050 700 
U 5CD559BA
F0 "MT19" 50
F1 "hall_effect_sensor.sch" 50
F2 "VCC" I L 4400 5500 50 
F3 "GND" O L 4400 5600 50 
F4 "VOUT" O R 5450 5500 50 
$EndSheet
$Comp
L power:GND #PWR0108
U 1 1 5CD759B4
P 4200 5700
F 0 "#PWR0108" H 4200 5450 50  0001 C CNN
F 1 "GND" H 4205 5527 50  0000 C CNN
F 2 "" H 4200 5700 50  0001 C CNN
F 3 "" H 4200 5700 50  0001 C CNN
	1    4200 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 5600 4200 5600
Wire Wire Line
	4200 5600 4200 5700
$Comp
L power:+5V #PWR0109
U 1 1 5CD76A38
P 4200 5450
F 0 "#PWR0109" H 4200 5300 50  0001 C CNN
F 1 "+5V" H 4215 5623 50  0000 C CNN
F 2 "" H 4200 5450 50  0001 C CNN
F 3 "" H 4200 5450 50  0001 C CNN
	1    4200 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 5500 4200 5500
Wire Wire Line
	4200 5500 4200 5450
Wire Wire Line
	5500 4600 5750 4600
Wire Wire Line
	5750 4600 5750 5500
Wire Wire Line
	5750 5500 5450 5500
$EndSCHEMATC
