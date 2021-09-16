# -*- coding: utf-8 -*-
"""
Created on Sat Sep  4 22:51:47 2021

@author: Eduardo
"""
def fizzbuzz(n):
    if n%3==0 and n%5!=0:
        return'Fizz'
    elif n%5==0 and n%3!=0:
        return'Buzz'
    elif n%3==0 and n%5==0:
        return'FizzBuzz'
    elif n%3!=0 and n%5!=0:
        return n