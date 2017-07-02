#!/usr/bin/env python
# encoding: utf-8

import RPi.GPIO
import time

# ���嵥������ܸ���led��Ӧ��GPIO��
LED_A = 26
LED_B = 19
LED_C = 13
LED_D = 6
LED_E = 5
LED_F = 11
LED_G = 9
LED_DP = 10

# ����1��4�������������Ӧ��GPIO��
DIGIT1 = 12
DIGIT2 = 16
DIGIT3 = 20
DIGIT4 = 21

# ���尴ť�����GPIO��
btn = 27

RPi.GPIO.setmode(RPi.GPIO.BCM)

RPi.GPIO.setup(LED_A, RPi.GPIO.OUT)
RPi.GPIO.setup(LED_B, RPi.GPIO.OUT)
RPi.GPIO.setup(LED_C, RPi.GPIO.OUT)
RPi.GPIO.setup(LED_D, RPi.GPIO.OUT)
RPi.GPIO.setup(LED_E, RPi.GPIO.OUT)
RPi.GPIO.setup(LED_F, RPi.GPIO.OUT)
RPi.GPIO.setup(LED_G, RPi.GPIO.OUT)
RPi.GPIO.setup(LED_DP, RPi.GPIO.OUT)
RPi.GPIO.setup(DIGIT1, RPi.GPIO.OUT)
RPi.GPIO.setup(DIGIT2, RPi.GPIO.OUT)
RPi.GPIO.setup(DIGIT3, RPi.GPIO.OUT)
RPi.GPIO.setup(DIGIT4, RPi.GPIO.OUT)

RPi.GPIO.output(DIGIT1, True)
RPi.GPIO.output(DIGIT2, True)
RPi.GPIO.output(DIGIT3, True)
RPi.GPIO.output(DIGIT4, True)

RPi.GPIO.setup(btn, RPi.GPIO.IN, pull_up_down=RPi.GPIO.PUD_UP)

# ָ��no(1-4)���������ʾ����num(0-9)����������������ʾ����ʾС���㣨true/false��
def showDigit(no, num, showDotPoint):
    # �Ƚ��������ͣ��ص���ʾ
	RPi.GPIO.output(DIGIT1, False)
	RPi.GPIO.output(DIGIT2, False)
	RPi.GPIO.output(DIGIT3, False)
	RPi.GPIO.output(DIGIT4, False)
	
	if (num == 0) :
		RPi.GPIO.output(LED_A, False)
		RPi.GPIO.output(LED_B, False)
		RPi.GPIO.output(LED_C, False)
		RPi.GPIO.output(LED_D, False)
		RPi.GPIO.output(LED_E, False)
		RPi.GPIO.output(LED_F, False)
		RPi.GPIO.output(LED_G, True)
		RPi.GPIO.output(LED_DP, not showDotPoint)
	elif (num == 1) :
		RPi.GPIO.output(LED_A, True)
		RPi.GPIO.output(LED_B, False)
		RPi.GPIO.output(LED_C, False)
		RPi.GPIO.output(LED_D, True)
		RPi.GPIO.output(LED_E, True)
		RPi.GPIO.output(LED_F, True)
		RPi.GPIO.output(LED_G, True)
		RPi.GPIO.output(LED_DP, not showDotPoint)
	elif (num == 2) :
		RPi.GPIO.output(LED_A, False)
		RPi.GPIO.output(LED_B, False)
		RPi.GPIO.output(LED_C, True)
		RPi.GPIO.output(LED_D, False)
		RPi.GPIO.output(LED_E, False)
		RPi.GPIO.output(LED_F, True)
		RPi.GPIO.output(LED_G, False)
		RPi.GPIO.output(LED_DP, not showDotPoint)
	elif (num == 3) :
		RPi.GPIO.output(LED_A, False)
		RPi.GPIO.output(LED_B, False)
		RPi.GPIO.output(LED_C, False)
		RPi.GPIO.output(LED_D, False)
		RPi.GPIO.output(LED_E, True)
		RPi.GPIO.output(LED_F, True)
		RPi.GPIO.output(LED_G, False)
		RPi.GPIO.output(LED_DP, not showDotPoint)
	elif (num == 4) :
		RPi.GPIO.output(LED_A, True)
		RPi.GPIO.output(LED_B, False)
		RPi.GPIO.output(LED_C, False)
		RPi.GPIO.output(LED_D, True)
		RPi.GPIO.output(LED_E, True)
		RPi.GPIO.output(LED_F, False)
		RPi.GPIO.output(LED_G, False)
		RPi.GPIO.output(LED_DP, not showDotPoint)
	elif (num == 5) :
		RPi.GPIO.output(LED_A, False)
		RPi.GPIO.output(LED_B, True)
		RPi.GPIO.output(LED_C, False)
		RPi.GPIO.output(LED_D, False)
		RPi.GPIO.output(LED_E, True)
		RPi.GPIO.output(LED_F, False)
		RPi.GPIO.output(LED_G, False)
		RPi.GPIO.output(LED_DP, not showDotPoint)
	elif (num == 6) :
		RPi.GPIO.output(LED_A, False)
		RPi.GPIO.output(LED_B, True)
		RPi.GPIO.output(LED_C, False)
		RPi.GPIO.output(LED_D, False)
		RPi.GPIO.output(LED_E, False)
		RPi.GPIO.output(LED_F, False)
		RPi.GPIO.output(LED_G, False)
		RPi.GPIO.output(LED_DP, not showDotPoint)
	elif (num == 7) :
		RPi.GPIO.output(LED_A, False)
		RPi.GPIO.output(LED_B, False)
		RPi.GPIO.output(LED_C, False)
		RPi.GPIO.output(LED_D, True)
		RPi.GPIO.output(LED_E, True)
		RPi.GPIO.output(LED_F, True)
		RPi.GPIO.output(LED_G, True)
		RPi.GPIO.output(LED_DP, not showDotPoint)
	elif (num == 8) :
		RPi.GPIO.output(LED_A, False)
		RPi.GPIO.output(LED_B, False)
		RPi.GPIO.output(LED_C, False)
		RPi.GPIO.output(LED_D, False)
		RPi.GPIO.output(LED_E, False)
		RPi.GPIO.output(LED_F, False)
		RPi.GPIO.output(LED_G, False)
		RPi.GPIO.output(LED_DP, not showDotPoint)
	elif (num == 9) :
		RPi.GPIO.output(LED_A, False)
		RPi.GPIO.output(LED_B, False)
		RPi.GPIO.output(LED_C, False)
		RPi.GPIO.output(LED_D, False)
		RPi.GPIO.output(LED_E, True)
		RPi.GPIO.output(LED_F, False)
		RPi.GPIO.output(LED_G, False)
		RPi.GPIO.output(LED_DP, not showDotPoint)
	
	if (no == 1) :
		RPi.GPIO.output(DIGIT1, True)
	elif (no == 2) :
		RPi.GPIO.output(DIGIT2, True)
	elif (no == 3) :
		RPi.GPIO.output(DIGIT3, True)
	elif (no == 4) :
		RPi.GPIO.output(DIGIT4, True)

try:
	t=0.005
	while True:
		# ��ť����ʱ��ʾ���ڣ�������ʾʱ��
		# Ϊ���������ҵ����֣��õڶ�������ܵ�С������ʾ����
		#������Ӧ����һ��ð�ţ�������������û�У�����С��������ˣ�
		if (RPi.GPIO.input(btn) == 1):
			time.sleep(t)
			showDigit(1, int(time.strftime("%H",time.localtime(time.time()))) / 10, False)
			time.sleep(t)
			showDigit(2, int(time.strftime("%H",time.localtime(time.time()))) % 10, True)
			time.sleep(t)
			showDigit(3, int(time.strftime("%M",time.localtime(time.time()))) / 10, False)
			time.sleep(t)
			showDigit(4, int(time.strftime("%M",time.localtime(time.time()))) % 10, False)
		else:
			time.sleep(t)
			showDigit(1, int(time.strftime("%m",time.localtime(time.time()))) / 10, False)
			time.sleep(t)
			showDigit(2, int(time.strftime("%m",time.localtime(time.time()))) % 10, True)
			time.sleep(t)
			showDigit(3, int(time.strftime("%d",time.localtime(time.time()))) / 10, False)
			time.sleep(t)
			showDigit(4, int(time.strftime("%d",time.localtime(time.time()))) % 10, False)
			
except KeyboardInterrupt:
	pass

# �������GPIO�ڣ�����Ҳ���ԣ�����ÿ�γ������ʱ����һ�£���ϰ�ߣ�
RPi.GPIO.cleanup()
