# -*- coding: utf-8 -*-
"""
Created on Wed Aug 25 16:03:42 2021

@author: Eduardo
"""

seconds = int(input("Por favor, entre com o número de segundos que deseja converter:"))

days = seconds//86400
segundos_res = seconds%86400
hours = segundos_res//3600
leftover_sec = seconds%3600
minutes = leftover_sec//60
leftover = leftover_sec%60

print(days,"dias", hours,"horas", minutes, "minutos",leftover,"segundos.")