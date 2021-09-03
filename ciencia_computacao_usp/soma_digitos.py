# -*- coding: utf-8 -*-
"""
Created on Thu Sep  2 15:13:16 2021
Soma dos algarítimos de um número.
@author: Eduardo
"""

print("Digite um número inteiro:")

x = int(input("Digite a número desejado:"))
soma = 0

while x != 0:
    soma += x % 10
    x = x // 10
print(soma)