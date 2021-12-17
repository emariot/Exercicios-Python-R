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

# Equações dinâmicas

## Consumo
def consumo(v):
    c_ = C0 + c*(v-T)     # v = Renda no período t-1
    C.append(c_)
    ## Renda
def renda():
    y_ = C[t] +  I0 + G
    Y.append(y_)
## Dívida do Governo
def divida():
    d_ = D[t-1] + T - G
    D.append(d_)

'''    
Dinâmica: calculos iterados no tempo após um aumento permanente dos gastos 
do governo  G = 220    
'''
## Inicia vateores em t=0, com valores iniciais
# Renda de equilíbrio 
y_eq = (1/(1-c))*(C0+I0 + G - c*T)
Y.append(y_eq)
# Consumo de equilíbrio
c_eq = C0 + c*(y_eq - T)
C.append(c_eq)
D.append(T-G)
G = 220     # Choque de política fiscal

## Loop temporal (cria uma série temporal para cada variável endógena)
for t in range(1,time):
    consumo(Y[t-1])
    renda()
    divida()
    
list(zip(Y,C,D))   

M = pd.DataFrame(list(zip(Y,C,D)), columns = ['Y', 'C', 'D'])
M.to_csv("ModISLM-Result.csv")

## Plots
t = list(range(0, time))

plt.plot(t,Y,label="Y(t)", color='blue')
plt.plot(t,C,label="C(t)", color='red')
plt.legend(loc="upper left")
plt.show();


fig, axs = plt.subplots(2,2)
# Renda
axs[0,0].plot(Y,label="Y(t)", color='black')
axs[0,0].set_title("Y(t)")
# Consumo
axs[0,1].plot(C,label="C(t)", color='black')
axs[0,1].set_title("C(t)")
# Dívida
axs[1,1].plot(D,label="D(t)", color='black')
axs[1,1].set_title("D(t)")
plt.show();