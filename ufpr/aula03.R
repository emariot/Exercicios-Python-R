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
