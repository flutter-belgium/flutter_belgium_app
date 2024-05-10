#!/bin/bash

fvm dart run locale_gen:format
fvm dart run locale_gen

./tools/format.sh