# -*- coding: utf-8 -*-
"""
Created on Tue Dec 14 19:23:32 2021
Economia Computacional
@author: Eduardo
"""

# Aula 15
import numpy as np
import statistics as sta
import pandas as pd
import string as stg
import matplotlib.pyplot as plot


text_0 = "nome"
text_1 = "aula introdutória"
text_2 = "de python"

print(text_0 + " " + text_1 + " " + text_2)

text_3 = text_0 + " " + text_1 + " " + text_2
text_3

name = input("Qual o seu nome?")
print("Olá", name, "Prazer em conhecê-lo")

# Manipulação de string
text = "textaleatorio"
text.capitalize()
text.upper()
text.find("e")
text.count("a")
text_3.split()
len(text)


v1 = pd.Series([1,3,5,11,6,8])
plot.plot(v1)

# Listas, tuplas, dicionários e sets
l =[1,4,10,12,"py","A",100,41]
l
l_ = np.sort(l)  # Quando a lista contem strings o sort transforma todos os elemntos em strings
l.append(50)
l_1 = [1,5,8,4,7,10,6]
l_ = np.sort(l_1)

del l[4:6]
l
4 in l
sum(l)
sta.mean(l)

# Dicionários