# -*- coding: utf-8 -*-
"""
Created on Fri Sep 24 02:39:17 2021
Funções úteis
@author: Eduardo
"""

# Séries Uniformes Antecipadas
def pmt(pv,i,n):
    pmt = pv * (i/(1-(1 + i)**-n))/(1+i)
    return round(pmt,2)
def pv(pmt,i,n): 
    pv = pmt * ((1-(1 + i)**-n)/i)*(1+i)
    return round(pv,2)

# VPL
def vpl(custo,l,tma):
    receita = 0
    c = 1
    v = 0
    for i in l:
        v = i/(1+tma)**c
        receita += v
        c += 1
    return round(receita-custo,2)