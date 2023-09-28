#!/bin/python3

import math
import os
import random
import re
import sys



#
# Complete the 'fizzBuzz' function below.
#
# The function accepts INTEGER n as parameter.
#

def fizzBuzz(n):
    # Write your code here
    i = 0
    a = 1
    b = 1
    c = 1
    for i in range(n):
        i = i + 1
        if i / 15 == c:
            print('FizzBuzz')
            c = c + 1
            a = a + 1
            b = b + 1
        elif i / 3 == a:
            print('Fizz')
            a = a + 1
        elif i / 5 == b:
            print('Buzz')
            b = b + 1
        else:
            print(i)
    return n
        

if __name__ == '__main__':
    n = int(input().strip())

    fizzBuzz(n)
