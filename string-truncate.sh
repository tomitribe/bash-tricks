#!/bin/bash

string=abcdefghijklmnopqrstuvwxyz

echo $string
# abcdefghijklmnopqrstuvwxyz

echo ${string:12}
# mnopqrstuvwxyz

echo ${string::12}
# abcdefghijkl
