CC= arm-none-eabi-gcc

MACH= cortex-m4

CFLAGS= -c -mcpu=$(MACH) -mthumb -std=gnu11 -Wall -O0

LDFLAGS= -nostdlib -T stm_ls.ld

EMULGNU= qemu-system-gnuarmeclipse.exe

EMULFLAGS= -M STM32F4-Discovery -mcu STM32F407VG -kernel

REPOURL= https://github.com/thomasathul/Mastering_Microcontrollers.git




all:main.o led.o startup_stm.o final.elf
git:init add status push

main.o: main.c
	$(CC) $(CFLAGS) $^ -o $@

led.o:led.c
	$(CC) $(CFLAGS) $^ -o $@
	
startup_stm.o:startup_stm.c
	$(CC) $(CFLAGS) $^ -o $@

final.elf: main.o led.o startup_stm.o
	$(CC) $(LDFLAGS) $^ -o $@
	
emulate:final.elf
	$(EMULGNU) $(EMULFLAGS) $^
	
init:
	git init

add:
	git add .
	git commit -m="$m"
	
status:
	git status
	
clone:
	git clone "$c"
	
push:
	git push

pull:
	git pull
	
clean:
	rm -rf *.o *.elf