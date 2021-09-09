# -*- coding: utf-8 -*-
"""
Created on Wed Sep  8 14:00:03 2021
Fatores Primos
@author: Eduardo
"""

n = int(input("Digite um número inteiro maior que 1: "))

fator = 2
mult = 0

while n > 1:
    while n % fator == 0:
        mult += 1
        n = n / fator
    if mult > 0:
        print("fator ", fator, "multiplicidade = ", mult)
    fator += 1
    mult = 0
        