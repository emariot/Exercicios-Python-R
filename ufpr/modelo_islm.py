# -*- coding: utf-8 -*-
"""
Created on Thu Dec 16 16:45:54 2021
Modelo ISML
@author: Eduardo
"""
import numpy as np
import math as ma
import pandas as pd
import matplotlib.pyplot as plt

'''
Modelo IS - Este modelo conta com a curva IS, sendo a taxa de juros uma variável exógena

Curva IS:
    Y(t) = C(t) + I(t) + G(t)                       #
    C(t) = C0 + c[Y(t-1) - T(t)]                    # Consumo
    I(t) = I0                                       #+ dY(t-1) - fi(t) Investimento constante
    G(t) = G                                        # Gasto
    T(t) = T                                        # 
    D(t) = D(t-1) + T(t) - G(t)                     # Dívida

Curva LM
    M = kY(t) - hi(t)
    
    
Endógenas: são recalculadas dinâmicamente
Y(t), C(t), I(t), D(t)

Exógenas
G, T (políticas fiscais) 
Mo (política monetária)

Parâmetros das equaçãoes => não mudam no curto prazo
C0 e c, I0, d, f, D0

'''
# Declaração das variáveis exógenas e parâmetros

C0 = 100  # Consumo autônomo
c = 0.8   # propensão marginal a consumir
I0 = 300  # Investimento - fixo ou constante
G = 200   # Gasto do governo - fixo ou constante 
T = 200   # tributos - fixos ou constante
Y = []    # Lista para armazenar os valores de Y(t) no tempo
C = []    # Lista para armazenar os valores de C(t) no tempo 
D = []    # Lista para armazenar a dívida do governo no tempo
time = 20

# Equações

## Consumo
def consumo(v):
    c_ = C0 + c*(v-T)
    C.append(c_)
    
    
## Renda 
## Dívida do Governo

## Frame 31:36