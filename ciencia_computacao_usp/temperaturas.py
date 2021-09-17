# -*- coding: utf-8 -*-
"""
Created on Fri Sep 17 17:15:16 2021
Temperaturas
@author: Eduardo
"""
def temps(t):
    print("A menor temperatura no mes foi: ", minima(t), "C.")
    print("A maior temperatura no mes foi: ", maxima(t), "C.")

def minima(t):
    min_ = t[0] 
    i = 1
    
    while i < len(t):
        if t[i] < min_:
            min_ = t[i]
        i +=1
    return min_


def maxima(t):
    max_ = t[0]
    i = 1
    
    while i < len(t):
        if t[i] > max_:
            max_ = t[i]
        i +=1
    return max_

def test_pont(temp, valor_esperado):
    valor_calculado = minima(temp)
    if valor_calculado != valor_esperado:
        print("Valor errado para array ", temp)
        print("Valor esperado: ",  valor_esperado, ". Valor calculado: ", valor_calculado)
def test_pont_(temp, valor_esperado):
    valor_calculado = maxima(temp)
    if valor_calculado != valor_esperado:
        print("Valor errado para array ", temp)
        print("Valor esperado: ",  valor_esperado, ". Valor calculado: ", valor_calculado)
    
def test_min():
    print("Iniciando os testes")
    test_pont([0], 0)
    test_pont([0, 0, 0, 0], 0)
    test_pont([0, 1, 2, 3, 4, 5, 6, 7, 8, 8, 9, 10], 0)
    test_pont([30, 18, 27, 26, 32, 34, 30, 29, 24, 26, 30, 24, 25, 24], 18)
    test_pont([-15, -12, 0, 20, 30], -15)      
    print("Fim dos testes")

def test_max():
    print("Iniciando os testes")
    test_pont_([0], 0)
    test_pont_([0, 0, 0, 0], 0)
    test_pont_([0, 1, 2, 3, 4, 5, 6, 7, 8, 8, 9, 10], 10)
    test_pont_([30, 18, 27, 26, 32, 34, 30, 29, 24, 26, 30, 24, 25, 24, 48], 48)
    test_pont_([-15, -12, 0, 20, 30], 30)      
    print("Fim dos testes")
    
test_max()

