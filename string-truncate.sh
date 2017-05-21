#!/bin/bash

# Bash has effectively two methods very similar to Java's String.substring() method.
# In Java their signatures would be similar to:
#
#  /** start at beginIndex and return the remaining characters **/
#  public String substring(int beginIndex)
#
#  /** start at beginIndex and return the next N characters **/
#  public String substring(int beginIndex, int length)
#
# In bash this looks like
# 
#   ${string:beginIndex}
#   ${string:beginIndex:length}
#
# If beginIndex is a negative number, Bash will count from the end of the string.
# length, however, cannot be negative to signify "previous N characters"
#
string=abcdefghijklmnopqrstuvwxyz

echo $string
# abcdefghijklmnopqrstuvwxyz

# print the last three characters
# string.substring(-3)
echo ${string: -3}
# xyz

# print the first three characters
# string.substring(0, 3)
echo ${string:0:3}

# start at index 12 and print the rest of the string
# string.substring(12)
echo ${string:12}
# mnopqrstuvwxyz

# start at index 12 and print one character
# string.substring(12, 1)
echo ${string:12:1}
# m

# start at index 0 and print 12 characters
# string.substring(0, 12)
echo ${string:0:12}
# abcdefghijkl

# start at index 0 (implied) and print 12 characters
# string.substring(0, 12)
echo ${string::12}
# abcdefghijkl

# start at index -12 and print remaining characters
# string.substring(-12)
echo ${string:(-12)}
#opqrstuvwxyz


#
#
filename=string-truncate.sh

echo ${filename: -3}
#.sh

echo ${filename: 0 : ${#filename}-3 }
string-truncate

#####################################
# PARSER WARNING
#####################################
# There is conflicting Bash sytnax.  ":-" means something else in Bash
# so when you use a negative number, there must be a space before it
#
echo ${filename:-3}   # if 'filename' is set, return it
#string-truncate.sh

unset filename

echo ${filename:-3}   # if 'filename' is not set, return 3
# 3

