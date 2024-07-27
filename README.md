# Minimal avrdude example with atmega328p

## TL;DR

If you are interested in the following:

* Programming Arduino Unos
* ..Using a cheap STK500mkII AVR programmer
* ..Using avr-gcc
* ..And the avrdude toolchain 

Then this project might be interesting to you. If not, it probably won't be.

## Disclaimer

I barely know what I am doing with this, so YMMV. I take no responsibility,
etc, etc.

## Background

I am planning to build a Mutable Instruments Ambika synthesizer, which uses
Atmel CPUs. Prior to this, the only Atmel-based development that I did was
with an Arduino Uno. However, it became clear to me that to program the the
MCUs for the Ambika, the best path forward was to buy an STK500 programmer
and learn how to use avrdude.

## Setup

This repo does not (yet) document what is needed to install avrdude. However,
If you're using Linux Mint like I am, or Debian, or Ubuntu, then you can
probably just install the avrdude packages from Synaptic Package Manager.

### Disabling BRLTTY

My STK500mkII clone (ordered from Amazon) was connecting and disconnecting
right away (which I found out by tailing dmesg). After poking around on the
net, I discovered that there was some conflict with BRLTTY. This is documented
here:

https://www.reddit.com/r/pop_os/comments/uf54bi/how_to_remove_or_disable_brltty/

But the steps to disable are simple:

```bash
systemctl stop brltty-udev.service
sudo systemctl mask brltty-udev.service
systemctl stop brltty.service
systemctl disable brltty.service
```

## Building the example

The Makefile builds an empty **main()** program and generates the hex file for
it.  To flash the device, just type:

    PGMPORT=<your-programmers-tty> make flash

For example, if, like me, your programmer is attached to /dev/ttyUSB0, then:

    PGMPORT=/dev/ttyUSB0 make flash

In fact, /dev/ttyUSB0 is the default, simply because that's what it is on my
machine. If you are not sure what port you need to use, you can find out
pretty easily.  Just type:

    dmesg

And near the end you will probably see a line like this:

    [ 3283.315966] usb 1-1: ch341-uart converter now attached to ttyUSB0

Telling you that /dev/ttyUSB0 is the way to go.

## Contacting me

Tom R. Dial <dialtr at gmail dot com>

