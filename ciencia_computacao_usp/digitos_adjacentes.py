# -*- coding: utf-8 -*-
"""
Created on Thu Sep  2 19:33:17 2021

@author: Eduardo
"""

n = int(input("Digite um número inteiro:"))
anterior = n%10
n = n//10
iguais = False
while n>0 and not iguais:
    atual = n % 10
    if atual == anterior:
        iguais = True
    else:
        anterior = atual
        n = n//10
if iguais:
    print("sim")
else:
    print("não")
       