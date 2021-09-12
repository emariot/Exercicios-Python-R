# -*- coding: utf-8 -*-
"""
Created on Sun Sep 12 14:51:30 2021
Conta Primos
@author: Eduardo
"""
def n_primos(n):
    c = 2
    l = []
    l_ = []
    while n > 0:
        while c <= n:
            if n%c==0 and n!=c:
                l.append(n)
            l_.append(c)
            c += 1
        c = 2
        n -= 1
    return len(set(l_)-set(l))
