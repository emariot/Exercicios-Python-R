# -*- coding: utf-8 -*-
"""
Created on Thu Aug 26 21:09:07 2021
Distância entre dois pontos em um plano cartesiano.
@author: Eduardo
"""
from math import sqrt

x1 = float(input("Digite a primeira cordenada x:"))
y1 = float(input("Digite a primeira cordenada y:"))
x2 = float(input("Digite a segunda cordenada x:"))
y2 = float(input("Digite a segunda cordenada y:"))

d = sqrt((x1-x2)**2+(y1-y2)**2)

if d>=10:
    print("longe")
else:
    print("perto")
