;
; LEDandBUTTON.asm
;
; Created: 11/01/2025 11:47:29 a.m.
; Author : LSL
;

.org 0

		LDI R17, (1 << DDC5)	;Se pone en alto el pin 5 del puerto C
		OUT DDRC, R17			;Se configura como salida el pin 5 del puerto C
		LDI R18, (0 << DDB0)	;Se configura en bajo el pin 0 del puerto B
		OUT DDRB, R18			;Se configura como entrada el pin 5 del puerto C

LOOP:
		
		;LDI R16, (1 << 0x05)    ;Se pone en 1 el registro R16 en la posición 5
		;OUT PORTC, R16          ;Se asigna un 1 en el puerto C pin 5
		
		IN R19, PINB			;Un 0 o 1 en la posicion de PINB
		
		CPI R19, 1
		BREQ true
		RJMP LOOP

		true:
		LDI R16, (1 << 0x05)    ;Se pone en 1 el registro R16 en la posición 5
		OUT PORTC, R16          ;Se asigna un 1 en el puerto C pin 5

