
#cppcheck  --force --std=c99 --language=c src/
make clean
rm -rf bin obj
make all
#fuser -k /dev/ttyACM0
avrdude -c arduino -P COM5 -p m328p -D -U flash:w:bin/firmware.elf
#figlet "MVC19"
