# -*- coding: utf-8 -*-
"""
Created on Thu Sep 16 17:31:33 2021
Inverte elementos de uma lista
@author: Eduardo
"""

n = int(input("Digite um número:"))
l = []
while n != 0:
    if n != 0 :
        l.append(n)
    n = int(input("Digite um número:"))
for i in reversed(l):
    print(i)