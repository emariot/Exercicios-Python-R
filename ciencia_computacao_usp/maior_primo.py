# -*- coding: utf-8 -*-
"""
Created on Sat Sep  4 18:21:35 2021
Programa que mostra o maior número primo menor ou igual ao número informado
@author: Eduardo
"""
def primo(n):
    i = n-1
    while i > 0:
        if i == 1:
            return True
            break
        elif n%i==0:
            return False
            break
        else:
            i -= 1
def maior_primo(x):
    while x>0:
        if primo(x) == True:
            return x
            break
        else:
            x -= 1
    