# -*- coding: utf-8 -*-
"""
Created on Thu Sep 16 17:18:12 2021
Maior Elemento de uma Lista
@author: Eduardo
"""
def maior_elemento(l):
    max_ = l[0]
    for i in l:
        if i > max_:
            max_ = i
    return max_
        