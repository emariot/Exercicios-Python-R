# -*- coding: utf-8 -*-
"""
Created on Thu Sep  2 17:23:03 2021
Fatorial
@author: Eduardo
"""
n_ = int(input("Digite o valor de n: "))
n = n_
f = 1
while n > 0:
    f = f * n
    n = n-1
print(f)
