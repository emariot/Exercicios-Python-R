# -*- coding: utf-8 -*-
"""
Created on Tue Oct 12 03:17:21 2021
Function Payback
@author: Eduardo
"""

def payback(n,taxa,fluxo):
    def desc(n,taxa,fluxo):
        desc = []
        for i in range(0, n+1):
            if i > 0:
                f = fluxo[i]*((1+taxa)**-i)
                desc.append(f)
        return desc
    desc = desc(n,taxa,fluxo)
    acumulado = fluxo[0]
    c = 0
    for i in desc:
        acumulado = acumulado + i
        c += 1
        if acumulado > 0:   
            pb = (acumulado - (desc[c-1]*c))/desc[c-1]
            break
    return pb     