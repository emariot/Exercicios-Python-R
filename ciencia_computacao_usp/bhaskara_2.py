# -*- coding: utf-8 -*-
"""
Created on Sat Sep  4 17:17:25 2021

@author: Eduardo
"""
from math import sqrt
print("---Quadratic equation---")
a = float(input("Enter with a: "))
b = float(input("Enter with b: "))
c = float(input("Enter with c: "))

if a==0:
    a=1
elif b==0:
    b=1
elif c==0:
    c=1
    
delta = b**2 - (4*a*c)

def raiz(a,b):
    x1 = (-b + sqrt(delta))/(2*a) 
    x2 = (-b - sqrt(delta))/(2*a)
    return x1, x2

if delta < 0:
    print("esta equação não possui raízes reais")
elif delta == 0:
    x1,x2 = raiz(a,b)
    print("a raiz desta equação é", x1)
else:
    x1,x2 = raiz(a,b)
    if x1<x2:
        print("as raízes da equação são", x1, "e", x2)
    else:
        print("as raízes da equação são", x2, "e", x1)