# Program Arduino UNO with STK500 mkII Programmer

CC = avr-gcc
OBJCOPY = avr-objcopy
PGMPORT ?= /dev/ttyUSB0

.PHONY:
all: main.hex

.PHONY:
clean:
	-rm -f *.o *.elf *.hex

main.hex:
	$(CC) -Os -DF_CPU=8000000 -mmcu=atmega328p -c main.c
	$(CC) -DF_CPU=8000000 -mmcu=atmega328p -o main.elf main.o
	$(OBJCOPY) -O ihex main.elf main.hex
	rm main.o
	rm main.elf

.PHONY:
flash: main.hex
	avrdude -c avrisp2 -p atmega328p -P $(PGMPORT) -U flash:w:main.hex
