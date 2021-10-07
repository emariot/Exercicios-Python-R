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

# frame 1:05
