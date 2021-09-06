# -*- coding: utf-8 -*-
"""
Created on Sun Sep  5 22:24:06 2021

@author: Eduardo
"""

def partida():
    n = int(input("Quantas peças?"))
    m = int(input("Limite de peças por jogada?"))
    x = n%(m+1)
    primeiro_usuario = False
    primeiro_pc = False
    if x != 0:
        pcJoga = True
        inicio_pc = True
    elif x == 0:
        pcJoga = False
        inicio_usuario = True
    while n > 0:
        if pcJoga: # Verifica se o computador ''''''começa
            if primeiro_pc:
                print("\nComputador começa!\n")
            primeiro_pc = False
            jogada = computador_escolhe_jogada(n,m)
            pcJoga = False
            if jogada == 1:
                print("Computador tirou uma peça")
            else:
                print("O computador tirou", jogada, "peças.")
        else:
            if primeiro_usuario:
                print("\nVoce começa!\n")
                primeiro_usuario = False
                jogada = usuario_escolhe_jogada(n,m)
                pcJoga = True
            if jogada == 1:
                print("Você tirou uma peça")
            else:
                print("Você tirou", jogada, "peças.")
        n = n - jogada
        if n > 0:
            print("Agora restam", n, "peças no tabuleiro.\n")
    if pcJoga:
        print("Fim do jogo! Você ganhou!\n")
        return 1
    else:
        print("Fim do jogo! O computador ganhou!\n")
        return 0 

def usuario_escolhe_jogada(n,m):
    jogada = 0
    while jogada ==0:
        jogada = int(input("Quantas peças você vai tirar?"))
        if jogada > n or jogada > m or jogada < 1:
            print("\nJogada inválida! Tente de novo.\n")
            jogada = 0
    return jogada
def computador_escolhe_jogada(n,m):
    if n <= m:
        return n
    else:
        sobra = n%(m+1)
        if sobra > 0:
            return sobra
        return m
    
def campeonato():
    computador = 0
    usuario = 0
    i = 1
    for _ in range(3):
        print("**** Rodada",i,"****")
        print("")
        id_ganhou = partida()
        i = i + 1
        if id_ganhou == 1:
            usuario += 1
        else:
            computador += 1
    print("**** Final de campeonato! ****")
    print("Placar: Você", usuario, "X", computador, "Computador")
    
escolha = 0
while escolha == 0:
    print("")
    print("Bem-vindo ao jogo do NIM! Escolha:")
    print("")
    print("1 - para jogar uma partida isolada")
    print("2 - para jogar um campeonato")
    escolha = int(input())
    if escolha == 1:
        partida()
        break
    elif escolha ==2:
        print("Voce escolheu um campeonato!")
        print("")
        campeonato()
        break
    else:
        print("Escolha uma opção válida!")
        print("")
        escolha = 0