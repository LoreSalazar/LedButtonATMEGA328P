;
; LEDandBUTTON.asm
;
; Created: 11/01/2025 11:47:29 a.m.
; Author : LSL
;


.org 0x00

		LDI R16, 0b0010_0000	;Se pone en alto el pin 5 del puerto C
		OUT DDRC, R16			;Se configura como salida el pin 5 del puerto C
		LDI R16, 0b0000_0000	;Se configura en bajo el pin 0 del puerto B
		OUT DDRB, R16			;Se configura como entrada el pin 0 del puerto B

LOOP:		
		IN R16, PINB			;Se lee el estado del PINB
		LDI R17, 0b0000_0001	;Iguala a 1 el registro 17
		CP R16, R17				;Compara si es igual el regitro 16 al registro 17
		BREQ Led_On				;Si es igual va a la etiqueta de led on
		BRNE Led_Off			;Si no es igual se va a la etiqueta de led off

Led_On:
		LDI R16, 0b0010_0000
		OUT PORTC, R16
		RJMP LOOP
Led_Off:
		LDI R16, 0b0000_0000
		OUT PORTC, R16
		RJMP LOOP

