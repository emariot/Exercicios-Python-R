# -*- coding: utf-8 -*-
"""
Created on Tue Aug 17 23:08:09 2021

@author: Eduardo
"""

from tkinter import *
from tkinter import ttk

values = ''

def set_text(n):
    global values    
    values = values + str(n) 
    string_text.set(str(values))
    
string_text = StringVar()

def calcular():
    global values

    resultado = str(eval(values))
    string_text.set(str(resultado))
    values = ''

def clear():
    global values
    values = ""
    string_text.set("")

cor_1 = "#252a3d"
cor_2 = "#3458eb"
cor_3 = "#c7cad4"
cor_4 = "#bcd67e"


window = Tk()
window.title("Calculadora")
window.geometry("235x310")
window.config(bg=cor_2)


frame_display = Frame(window, width=235, height=50, bg=cor_1)
frame_display.grid(row=0, column=0)


app_label = Label(frame_display, textvariable=string_text, width=16, height=2,
                  padx=7, relief=FLAT, anchor="e", justify=RIGHT, font=('Ivy 18'),
                  bg=cor_1, fg=cor_3)
app_label.place(x=0, y=0)


frame_keyboard = Frame(window, width=235, height=318-50)
frame_keyboard.grid(row=1, column=0)

b_1 = Button(frame_keyboard, text="C", width=11, height=2, bg=cor_3,
             font=('Ivy 13 bold'), relief=RAISED, overrelief=RIDGE,
             command=clear())
b_1.place(x=0,y=0)
b_2 = Button(frame_keyboard, text="%", width=5, height=2, bg=cor_3,
             font=('Ivy 13 bold'), relief=RAISED, overrelief=RIDGE,
             command=lambda:set_text('%'))
b_2.place(x=118,y=0)
b_3 = Button(frame_keyboard, text="/", width=5, height=2, bg=cor_4, fg=cor_2,
             font=('Ivy 13 bold'), relief=RAISED, overrelief=RIDGE,
             command=lambda:set_text('/'))
b_3.place(x=177,y=0)
##
b_4 = Button(frame_keyboard, text="7", width=5, height=2, bg=cor_3,
             font=('Ivy 13 bold'), relief=RAISED, overrelief=RIDGE,
             command=lambda:set_text('7'))
b_4.place(x=0,y=52)
b_5 = Button(frame_keyboard, text="8", width=5, height=2, bg=cor_3,
             font=('Ivy 13 bold'), relief=RAISED, overrelief=RIDGE,
             command=lambda:set_text('8'))
b_5.place(x=59,y=52)
b_6 = Button(frame_keyboard, text="9", width=5, height=2, bg=cor_3,
             font=('Ivy 13 bold'), relief=RAISED, overrelief=RIDGE,
             command=lambda:set_text('9'))
b_6.place(x=118,y=52)
b_7 = Button(frame_keyboard, text="*", width=5, height=2, bg=cor_4, fg=cor_2,
             font=('Ivy 13 bold'), relief=RAISED, overrelief=RIDGE,
             command=lambda:set_text('*'))
b_7.place(x=177,y=52)
##
b_8 = Button(frame_keyboard, text="4", width=5, height=2, bg=cor_3,
             font=('Ivy 13 bold'), relief=RAISED, overrelief=RIDGE,
             command=lambda:set_text('4'))
b_8.place(x=0,y=104)
b_9 = Button(frame_keyboard, text="5", width=5, height=2, bg=cor_3,
             font=('Ivy 13 bold'), relief=RAISED, overrelief=RIDGE,
             command=lambda:set_text('5'))
b_9.place(x=59,y=104)
b_10 = Button(frame_keyboard, text="6", width=5, height=2, bg=cor_3,
             font=('Ivy 13 bold'), relief=RAISED, overrelief=RIDGE,
             command=lambda:set_text('6'))
b_10.place(x=118,y=104)
b_11 = Button(frame_keyboard, text="-", width=5, height=2, bg=cor_4, fg=cor_2,
             font=('Ivy 13 bold'), relief=RAISED, overrelief=RIDGE,
             command=lambda:set_text('-'))
b_11.place(x=177,y=104)
##
b_12 = Button(frame_keyboard, text="1", width=5, height=2, bg=cor_3,
             font=('Ivy 13 bold'), relief=RAISED, overrelief=RIDGE,
             command=lambda:set_text('1'))
b_12.place(x=0,y=156)
b_13 = Button(frame_keyboard, text="2", width=5, height=2, bg=cor_3,
             font=('Ivy 13 bold'), relief=RAISED, overrelief=RIDGE,
             command=lambda:set_text('2'))
b_13.place(x=59,y=156)
b_14 = Button(frame_keyboard, text="3", width=5, height=2, bg=cor_3,
             font=('Ivy 13 bold'), relief=RAISED, overrelief=RIDGE,
             command=lambda:set_text('3'))
b_14.place(x=118,y=156)
b_15 = Button(frame_keyboard, text="+", width=5, height=2, bg=cor_4, fg=cor_2,
             font=('Ivy 13 bold'), relief=RAISED, overrelief=RIDGE,
             command=lambda:set_text('+'))
b_15.place(x=177,y=156)
##
b_16 = Button(frame_keyboard, text="0", width=11, height=2, bg=cor_3,
             font=('Ivy 13 bold'), relief=RAISED, overrelief=RIDGE,
             command=lambda:set_text('0'))
b_16.place(x=0,y=208)
b_17 = Button(frame_keyboard, text=".", width=5, height=2, bg=cor_3,
             font=('Ivy 13 bold'), relief=RAISED, overrelief=RIDGE,
             command=lambda:set_text('.'))
b_17.place(x=118,y=208)
b_18 = Button(frame_keyboard, text="=", width=5, height=2, bg=cor_4, fg=cor_2,
             font=('Ivy 13 bold'), relief=RAISED, overrelief=RIDGE, 
             command=calcular())
b_18.place(x=177,y=208)


window.mainloop()