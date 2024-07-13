#!/bin/sh
cd lib/avr-can-lib/src/ &&
make clean &&
make lib &&
cd ../../../ &&
curl https://raw.githubusercontent.com/ZeniteSolar/CAN_IDS/master/can_ids.h -o src/can_ids.h
