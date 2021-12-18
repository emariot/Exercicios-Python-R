# -*- coding: utf-8 -*-
"""
Created on Sat Dec 18 12:15:35 2021
Prova 2: Economia Computacional
Modelo ISLMBP
@author: Eduardo Mariot Araujo
"""
'''
Curva IS
Y = C + I + G + X - M

Variáveis Endógenas
Y(t), C(t), D(t), I(t), G(t), T(t), X(t), M(t), BP(t), L(t), i(t) 

'''
# Pacotes
import pandas as pd
import matplotlib.pyplot as plt

# Variáveis exógenas e parâmetros
C0 = 100
c = 0.8
I0 = 200
d = 0.05
f = 2000
T0 = 100
r = 0.05
Z = 50000
E = 5.0
X0 = 50
x1 = 0.02
x2 = 80
M0 = 50
m1 = 0.10
m2 = 50
h = 4000
k = 10
L= 84000


Y = []
C = []
D = []
I = [200]
G = 200
T = [100]
X = 0
M = [50]
Bp = [0]
i = []

time = 30

# Funções
## Renda Y(t) = C(t) + I(t) + G + X - M
def renda(i,m):
    y_ = C[t] + i + G + X - m
    Y.append(y_)    
## Consumo C(t) = C0 + c(Y(t-1)-T)
def consumo(y):
    c_ = C0 + c*(y - T[t-1])
    C.append(c_)
## Dívida D = D(t-1)+T-G
def divida():
    d_ = D[t-1] + T[t-1] - G
    D.append(d_)
## Exportações X(t) = X0 + x1Z + x2E 
X = X0 + x1*Z + x2*E 
## Importações M = M0 + m1*Y(t-1) - m2E
def imp(y):
    m_ = M0 + m1*y - m2*E
    M.append(m_)
## Balanço de Pagamento BP = X - M[]
def bp():
    bp_ = X - M[t-1]
    Bp.append(bp_)
## Tributos T = T0+rY
def tributos(y):
    t_= T0 + (r*y)
    T.append(t_)
## Taxa de Juros
def investimento():
    I_ = I0 + d*Y[t-1] - f*i[t-1]
    I.append(I_)
def juros(y):
    i_ = (k/h)*y - (1/h)*L
    i.append(i_)

# Seta A, o e p para gerar a renda de equilíbrio
A = C0 - (c*T0) + I0 + G + X0 - M0
p = (1-(c*(1-r))-d+m1)
o = 1 + ((f*k)/(p*h))

Yeq = (1/(p*o))*(A+(x1*Z)+((x2+m2)*E)+((f/h)*L))
Y.append(Yeq)

# Taxa de Juros de equilíbrio
ieq = ((k/h)*Yeq) - ((1/h)*L)
i.append(ieq)

# Consumo de equilíbrio
ceq = C0 + c*(Yeq-T0)
C.append(ceq)

# Dívida
D.append(T0-G)

# Choque de política fiscal
G = 220

# Rodando as funções do modelo
for t in range(1,time):
   tributos(Y[t-1])
   consumo(Y[t-1])
   imp(Y[t-1])
   renda(I[t-1],M[t-1])
   juros(Y[t])
   investimento()
   bp()
   divida()
   
# Data Frame com as variáveis endógenas
df = pd.DataFrame(list(zip(Y,C,D,I,i,T,M,Bp)), columns = ['Y', 
                                                        'C', 
                                                        'D', 
                                                        'I',
                                                        'i',
                                                        'T',
                                                        'M',
                                                        'BP'])


# Salvando resultado do modelo
df.to_csv("ModISLMBP-Result.csv")

# Criando os gráficos
fig, axs = plt.subplots(2,4)
# Renda
axs[0,0].plot(Y,label="Y(t)", color='black')
axs[0,0].set_title("Y(t)")
# Consumo
axs[0,1].plot(C,label="C(t)", color='black')
axs[0,1].set_title("C(t)")
# Dívida
axs[0,2].plot(D,label="D(t)", color='black')
axs[0,2].set_title("D(t)")
# Investimento
axs[0,3].plot(I,label="I(t)", color='black')
axs[0,3].set_title("I(t)")
# Taxa de Juros
axs[1,0].plot(i,label="i(t)", color='black')
axs[1,0].set_title("i(t)")
# Tributos
axs[1,1].plot(T,label="T(t)", color='black')
axs[1,1].set_title("t(t)")
# Balanço de Importações
axs[1,2].plot(Bp,label="M(t)", color='black')
axs[1,2].set_title("M(t)")
# Balanço de Pagamentos
axs[1,3].plot(Bp,label="Bp(t)", color='black')
axs[1,3].set_title("Bp(t)")

plt.show();

'''
Fim do modelo ISLMBP
'''
