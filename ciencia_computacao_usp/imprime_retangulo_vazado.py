# -*- coding: utf-8 -*-
"""
Created on Fri Sep 10 15:15:37 2021
Retângulo vazado
@author: Eduardo
"""

l = int(input("Digite a largura:"))
c = int(input("Digite a altura:"))

linha = 0
coluna = 0

while coluna < c:
        while linha < l:
            if coluna == 0:
                print('#', end='')    
            elif coluna >0 and coluna < c - 1:
                print("#" if linha == 0 or linha >= l - 1 else " ", end='')
            else:
                print('#', end='')
            linha += 1
        print()
        linha = 0
        coluna += 1
