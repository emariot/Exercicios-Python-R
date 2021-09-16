# -*- coding: utf-8 -*-
"""
Created on Fri Sep 10 19:56:30 2021
Lista
@author: Eduardo
"""
l = [2, 4, 2, 2, 3, 3, 1]

def remove_repetidos(l):
    l_ = sorted(list(set(l)))
    return l_