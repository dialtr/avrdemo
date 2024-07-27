CC=avr-gcc
OBJCOPY=avr-objcopy

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
flash:
	avrdude -c avrisp2 -p atmega328p -P /dev/ttyUSB0 -U flash:w:main.hex
