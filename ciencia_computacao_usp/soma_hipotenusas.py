# -*- coding: utf-8 -*-
"""
Created on Mon Sep 13 18:54:30 2021
Soma hipotenusas
@author: Eduardo
"""

def eh_hipotenusa(a,b):
    h = (a**2) + (b**2)
    return h
def soma_hipotenusas(n):
    c = 1
    soma = 0
    while c <= n:
        c_ = (c**2)
        a = 1
        b = 1
        while a < n:
            while b < n:
                if c_ == eh_hipotenusa(a,b):
                    soma = soma+c
                    a = n
                b += 1
            a += 1
            b = a
        c += 1
    return soma

