# -*- coding: utf-8 -*-
"""
Created on Sun Sep  5 22:24:06 2021
NIM
@author: Eduardo
"""
def computador_escolhe_jogada(n,m):
    if n <= m:
        return n
    else:
        if n % (m+1) > 0:
            return n % (m+1)
    return m
        
            
def usuario_escolhe_jogada(n, m):
    valor = int(input("\nQuantas peças você vai tirar? "))
    while valor > m or valor <= 0 or valor > n:    
        print("Jogada inválida! Tente de novo.")
        valor = int(input("\nQuantas peças você vai tirar? "))
        
    return valor
    

def partida():
    n = int(input("Quantidade de paças:"))
    m = int(input("Limite de peças por jogada:"))
    while m < 1:
        print("A quantidade de peças deve ser menor ou igual a quantidade de peças totais!")
        m = int(input("Limite de peças por jogada:"))
    jogada = 0
    valor = 0
    if n % (m+1) == 0:
        print("\nVocê começa!")
        jogada = 1 # Usuário

        while n > 0:
            if jogada == 1:
                valor = usuario_escolhe_jogada(n,m)
                print("\n Você tirou", valor,"peças" if valor>1 else "peça")
                n -= valor
                print("\n Agora restam apenas" if n > 1 else "\n Agora resta apenas", n, 
                  "peças no tabuleiro" if n > 1 else "peça no tabuleiro")
                jogada = 2
            else:
                valor = computador_escolhe_jogada(n,m)
                print("\n Computador tirou", valor,"peças" if valor>1 else "peça")
                n -= valor
                print("\n Agora restam apenas" if n > 1 else "\n Agora resta apenas", n, 
                  "peças no tabuleiro" if n > 1 else "peça no tabuleiro")
                jogada = 1
        if jogada == 1:
            print("Fim do jogo! O computador ganhou!\n")
            return 2
        else:
            print("Fim do jogo! Você ganhou!\n")
            return 1
    else:
        print("\nComputador começa!")
        jogada = 2 # Computador
        
        while n > 0:
            if jogada == 2:
                valor = computador_escolhe_jogada(n,m)
                print("\n Computador tirou", valor,"peças" if valor>1 else "peça")
                n -= valor
                print("\n Agora restam apenas" if n > 1 else "\n Agora resta apenas", n, 
                  "peças no tabuleiro" if n > 1 else "peça no tabuleiro")
                jogada = 1
            else:
                valor = usuario_escolhe_jogada(n,m)
                print("\n Você tirou", valor,"peças" if valor>1 else "peça")
                n -= valor
                print("\n Agora restam apenas" if n > 1 else "\n Agora resta apenas", n, 
                  "peças no tabuleiro" if n > 1 else "peça no tabuleiro")
                jogada = 2
        if jogada == 1:
            print("Fim do jogo! O computador ganhou!\n")
            return 2
        else:
            print("Fim do jogo! Você ganhou!\n")
            return 1
def campeonato():
    numero_partida = 1
    placar_usuario = placar_computador = 0
    while numero_partida < 4:
        print("****Rodada",numero_partida,"****\n")
        if partida() == 1:
            placar_usurario += 1
        else:
            placar_computador += 1
        numero_partida += 1
    print("****Fim do campeonato****")
    print("Placar:Você", placar_usuario,"X",placar_computador,"Computador")
        
def main():
    print("Bem vindo ao jogo do NIM!")
    print("1 - para jogar uma partida isolada")
    print("2 - para jogar um campeonato")
    escolha = int(input("Escolha: "))
    while escolha != 1 and escolha != 2:
        print("Escolha uma opção válida: 1 ou 2.")
        escolha = int(input("Escolha: "))
    if escolha == 1:
        print("\nVocê escolheu uma partida isolada\n")
        partida()
    elif escolha == 2:
        print("\nVocê escolheu jogar um campeonato\n")
        campeonato()
main()
