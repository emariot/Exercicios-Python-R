# -*- coding: utf-8 -*-
"""
Created on Thu Sep  9 23:47:04 2021
Retângulo cheio
@author: Eduardo
"""

l = int(input("Digite a largura:"))
a = int(input("Digite a altura:"))

linha = 0
coluna = 0

while coluna < a:
    while linha < l:
        print("#", end='')
        linha += 1
    print()
    coluna += 1
    linha = 0
       