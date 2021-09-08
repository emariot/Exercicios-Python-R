# -*- coding: utf-8 -*-
"""
Created on Tue Sep  7 23:23:50 2021

@author: Eduardo
"""
n = int(input("Digite um número inteiro: "))
while n > 0:  
    fatorial = 1
    while n > 1:
        fatorial = fatorial * n
        n = n - 1 
    print(fatorial)
    n = int(input("Digite um número inteiro: "))