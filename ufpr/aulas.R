# Aula 3

## Matriz

m1 = matrix(1:10,nrow=5,ncol=2,byrow=FALSE)
m2 = matrix(1:10,nrow=2,ncol=5,byrow=FALSE)

## Manipulação de matrizes e operações

dim(m1)

m1[2,1]
m1[,c(2,1)]
m1[1:3,]
sum(m1[,2])

## Criando matriz a partir de vetores

x = c(10,13,40,38,50)
y = c(13.5, 50.5, 19.1, 42.0, 10.5)
z = c(2, 5, 6, 6, 7)
w = c(6, 8, 7, 9, 7)

m3 = cbind(x,y,z,w)
m4 = rbind(x,y,z,w)

## Operações com matrizes

m5 = matrix(0, nrow=7, ncol=3)
m5[,1] = 1
m5[,2] = 2
m5[,3] = 3
m6 = matrix(1:21, nrow=7, ncol=3)
m7 = m6 - m5
m7 =100*m7
m6[,3] = m6[,2]^m6[,3]
m6 = cbind(m6,m6[,1])
m6 = cbind(m6, log(m6[,1]))

plot(m6[,1],m6[,4], lwd=2, type='b', col='tomato', main='Diagrama')
plot(m6[,1],m6[,5], lwd=2, type='b', col='tomato', main='Diagrama')
m7 = cbind(m7, log(m7[,3]))
plot(m7[,1],m7[,4], lwd=2, type='b', col='tomato', main='Diagrama2')
colnames(m6) = c("x","y","d","f","log")

# Multiplicação de matrizes 
x = c(10, 13, 26, 46, 60, 78, 99)
y = c(120, 160, 260, 133, 205, 310, 400)
z = c(2, 2, 2, 2, 2, 2, 2)
w = c(1, 3, 5, 8, 7, 12, 10)

m1 = cbind(x,y,z,w) 
m2 = rbind(x,y,z,w)
dim(m1)
dim(m2)
m1 %*% m2 # Produto interno de matrizes (dot or inner product)
t(m1) # Transposta
t(m2)
m1 * t(m2) # Produto da transposta (multiplicação simples)
m1 %o% m2 # Produto externo de uma matriz (outer product)

m3 = matrix(c(1,2,3,0,2,1,1,2,1), nrow=3,ncol=3)
det(m3) # Determinante da matriz
m3_i = solve(m3)# Inversa da matriz *determinante != 0
round(m3 %*% m3_i) # uma matriz multiplicada pela sua inversa resulta em uma matriz unitária
round(m3 * m3_i)

## Arrays: são objetos parecidos com matrizes, mas com 3 ou mais dimensões
x = 1:18 # array(linha, coluna, 3ªdimensao)
a1 = array(x,dim=c(3,2,3))
dim(a1)

# runif: distribuição aleatória uniforme
x = round(runif(200, min=0, max=99),0)
a2 = array(x, dim=c(10,4,5))
a2

dimnames(a2)[[1]] = paste0(2000:2009)
dimnames(a2)[[2]] = paste0('v',1:4)
dimnames(a2)[[3]] = paste0("Cidade ", 1:5)

a2[1,,] # Só o ano de 2000 de cada cidade
a2[,1,] # Só a variável v1 de todas as cidades
a2[,,1] # Só os dados da cidade 1

## BoxPlot da variável 1, para todos os anos, de cada cidade
boxplot(a2[,1,1:5],ylab='v1',main="Boxplot -v1 por cidade", col=2:6)
a2[,1,1:5]

# Data Frames
df = as.data.frame(a2)
df

library(reshape2)
df2 = melt(a2)
colnames(df2) = c("Ano", "Var", "Cidade", "Valor")

# Lendo data frames
df2$Ano
par(mfrow=c(1,2))
plot(df2$Valor)
plot(a2)

df2[df2$Cidade=="Cidade 1",]
df2[df2$Ano==2009 & df2$Var=='v2',4]
barplot(df2[df2$Ano==2009 & df2$Var=='v2',4],col='yellow',xlab='Cidades')

# Aula 04: Manuseios de dados 

library(dplyr)
options(scipen=999) # Notação não científica
getwd() # Diretório
setwd("Facul/Economia Computacional/scrips/datasets") # Estabelecendo novo diretório
df = read.csv("PIBAnual.csv",
              sep=";", 
              dec = ",", 
              header = TRUE, 
              skip=1, # Skip para pular linhas do cabeçalho
              na.strings ="-") # transforma marcações strings em NAs

plot(df$Ano, df$pib/1000000, main='PIB a preços de 2020', type='l', lwd=2, ylab="PIB R$ milhões")
plot(df$Ano,df$def,type="l", col="red", lwd=2) # Pib com deflator

# Leituras de dataframes de internet
file_url = 'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv'
df_2 = read.csv(file_url, head=TRUE,sep=",")
countries = unique(df_2$Country.Region)
countries

selected = c("Argentina", "Brazil", "Mexico", "South Africa")

df_3 = df_2[df_2$Country.Region %in% selected,]
df_3 = df_3[,-c(1,3,4)]
color = c('black', 'green', 'red', 'blue')

matplot(t(df_3[,2:623]), type="l", lwd=2, col=color)
legend("topleft", legend=selected,col=color, lwd=3, pch=16)

# Dados de páginas html

install.packages("htmltab")
library(htmltab)

url = "https://en.wikipedia.org/wiki/World_population"

df_4 = htmltab(url,which=8)
df_4 = as.data.frame(apply(df_4, 2, function(y) gsub("%","", y)))
df_4 = as.data.frame(apply(df_4, 2, function(y) gsub(",","", y)))

df_4[,1]= as.numeric(df_4[,1])
df_4[,2]= as.numeric(df_4[,2])
df_4[,3]= as.numeric(df_4[,3])
df_4[,4]= as.numeric(df_4[,4])
df_4[,5]= as.numeric(df_4[,5])
df_4[,6]= as.numeric(df_4[,6])
df_4[,7]= as.numeric(df_4[,7])

colnames(df_4) = c("year", "pop", "growth", "pop_var", "dens", "urban", "urban_p")

par(mfrow=c(1,2))
plot(df_4$year, df_4$pop, type='l')
plot(df_4$year, df_4$growth, type='l')

texto= "A população mundial esta aumentando, porém a taxa de crescimento esta diminuindo"

# Alula 05