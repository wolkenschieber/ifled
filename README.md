# InterfaceLED

[![Build](https://github.com/wolkenschieber/ifled/actions/workflows/build.yml/badge.svg)](https://github.com/wolkenschieber/ifled/actions/workflows/build.yml)
[![CodeQL](https://github.com/wolkenschieber/ifled/actions/workflows/codeql-analysis.yml/badge.svg)](https://github.com/wolkenschieber/ifled/actions/workflows/codeql-analysis.yml)

## What is it?

_InterfaceLED_ is a program that uses the keyboard LEDs to indicated various
things about a specified interface. For example if a network card is sending
or receiving data.


## How do i install it?

Put it into `/usr/bin`, `/usr/sbin` or some other directory.


## How do i use it?

Just run `ifled [tty here] [interface here]` to use the default settings.
Use `console` as tty to use the current tty, as interface use the interface you
would like to monitor eg: `eth0`, `ppp0`. To run the `ifled` in background add `-f` to
the command line.

Example command:
```bash
ifled console eth0 -f 
```

You will probably need to run ifled as `root` user.


## How do i config the LEDs? / How do i get ifled not to touch my num-lock etc?

Look in the list of options from the help (start `ifled` with no arguments).
For example `-c crt` will make num-lock indicate collisions, caps-lock indicate
receiving of data and scroll-lock indicate transmitting of data.

A popular LED config is `-c nna` this will make num-lock and caps-lock work as
normal (hopefully) and scroll-lock indicate activity (the interface is
receiving or transmitting data)

*Note*: You can't use arguments like `-ic nna`, use `-i -c nna` instead. 


## How do i get the none option to work in console?

If you can't use your (num,caps,scroll)-lock as normal when you use the none
option on them, try the `-a` option it may work.


## How do i get the none option to work in X?

Run `ifled` before you start X with the same terminal and same user that you will
start X with, this seams to work. Any other solution, open a discussion.


## The keyboard is weird, keys get stuck etc

Try to increase the LED update delay by use the `-d` parameter. 100ms should
solve the problem, if not try to increase even more. Note that the LEDs will
flash slower at higher LED update delays.


## How to i monitor more then one interface?

Use the `n` option with the `-c` parameter for example:

```bash
./ifled console eth0 -c nna -f  # Scroll-lock will flash on activity on eth0
./ifled console eth1 -c nan -f  # Caps-lock will flash on activity on eth1
./ifled console eth2 -c ann -f  # Num-lock will flash on activity on eth2
```

## The LEDs does not work on some terminals

A user in most cases can't change the LED status on a terminal owned by another
user even if you run `ifled` as root user, and I don't know why.

Do you know more about this? Open a discussion.


## The terminal LEDs gets fu*ked up after i have run ifled

Try to type `reset`, this will do a terminal initialization.


Have fun!, and remember to look away every half hour.
