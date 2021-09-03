# -*- coding: utf-8 -*-
"""
Created on Thu Aug 26 23:49:17 2021
Equaçõa de segundo grau
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

if delta < 0:
    print("esta equação não possui raízes reais")
elif delta == 0:
    x = (-b + sqrt(delta))/(2*a) or (-b - sqrt(delta))/(2*a)
    print("a raiz desta equação é", x)
else:
    x1 = (-b + sqrt(delta))/(2*a) 
    x2 = (-b - sqrt(delta))/(2*a)
    if x1<x2:
        print("as raízes da equação são", x1, "e", x2)
    else:
        print("as raízes da equação são", x2, "e", x1)

