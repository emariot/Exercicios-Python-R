# -*- coding: utf-8 -*-
"""
Created on Thu Sep  2 19:31:11 2021
Primalidade
@author: Eduardo
"""

n = int(input("Digite um número inteiro:"))
c = 2
primo = True
while c < n and primo:
    if n%c==0:
        print("não primo")
        primo = False
    c += 1
if primo:
    print("primo")
    