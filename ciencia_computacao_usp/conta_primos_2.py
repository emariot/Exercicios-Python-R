# -*- coding: utf-8 -*-
"""
Created on Sun Sep 12 16:01:47 2021
Conta primos 2
@author: Eduardo
"""

def primo(n):
    i = n - 1
    while i > 0:
        if i == 1:
            return True
            break
        elif (n%i == 0):
            return False
            break
        else:
            i -= 1
def n_primos(n):
    c = 0
    while n > 0:
        if (primo(n)):
            c += 1
        n-= 1
    return c