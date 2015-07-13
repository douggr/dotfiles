#!/bin/sh

for PACKAGE in $(cat packages | grep -v '#'); do
    apm install $PACKAGE
done

