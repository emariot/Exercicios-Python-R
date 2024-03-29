'''-----------1� Prova---------------- 
     Universidade Federal do Paran�
         Economia Computacional
       Nome: Eduardo Mariot Araujo'''
      

## 1. Combinando valores para obter uma matriz 11x3
X = 20:30
Y = c(2,13,19,28,33,49,88,64,101,400, 0.1)
Z = seq(80,100,2)

M = cbind(X,Y,Z)

## 2. Criando um vetor com valores de 1 at� 25 em intervalos 0.1:

x = seq(1,25,0.1)

# A. Soma dos elementos:
soma = sum(x)
# B. M�dia dos elementos:
mean = mean(x)
# C. Desvio Padr�o dos elementos:
sd = sd(x)
# D. Vari�ncia dos elementos:
var = var(x)

## 3. Matriz de 1 a 5 e matriz identidade
rep(1,5)
m1 = matrix(sample(1:5,25,replace = TRUE), ncol=5)
m2 = diag(1,nrow = 5)

# A. multiplica de M1 por M2 elemento a elemento
mult = m1 * m2
# B. Produto interno entre as matrizes
prod_int = m1 %*% m2
# C. Determinate de M1
det = det(m1)
# D. A matriz inversa de m1 e m2
inversa_m1 = solve(m1)
inversa_m2 = solve(m2)

## 4. Plot de vari�veis
x = c(2,5,9,20,26,30,54)
y = 1:10
par(mfrow=c(1,2))
plot(x, main='Plot 1', 
     xlab='eixo_x', 
     ylab = 'eixo_y',
     type = 'l',
     col='blue')
plot(y, main='Plot 2', 
     xlab='eixo_x', 
     ylab = 'eixo_y',
     type = 'b',
     col = 'red')

## 5. Temperaturas m�dias
cidades = c("Beijing", 
            "Lagos", 
            "Paris",
            "Rio de Janeiro",
            "San Juan",
            "Toronto")
temperaturas = c(35,88,42,84,81,30)
df = data.frame(cidades, temperaturas)

## 6. Homic�dios em 51 Estados americanos
install.packages('dslabs')
library(dslabs)
data("murders")

# A. Qual o n�mero total de homiicidios considerando todos os estados?
df = murders
total = sum(df$total)
cat("Total de homic�dios igual a:", total) # Total de homic�dios igual a: 9403

# B. Qual o n�mero m�ximo de homic�dios?
max = max(df$total)
estado = df[df$total==max,1]
cat("O n�mero m�ximo de homic�dios foi", max, "na", estado) # O n�mero m�ximo de homic�dios foi 1257 na California

## 7. Taxa de homic�dios por 100 mil habitantes
total_populacao = sum(df$population)
df$tx_homicidios = (df$total/total_populacao)*100.000

## 8. Plot da taxa de homic�dios 

# A. Plot dos homic�dios em fun��o da popula��o
plot(log10(df$population),
     log10(df$total),
     main='Homic�dios em fun��o da popula��o', 
     xlab='Homic�dios', 
     ylab = 'Popula��o',)
# B. C�lculo da correla��o
cor(df$total,df$population) # Forte correla��o entre o numero de popula��o e os homic�dios

## 9. Plot dos homic�dios em fun��o da popula��o com ggplot
library(ggplot2)
ggplot(df, aes(x=region,y=total, fill=region))+
  geom_col()+
  ggtitle("Homic�dios em fun��o da popula��o por regi�o")+
  xlab("Regi�o")+
  ylab("Total de homic�dios")

## 10. Importa��o e tratamento de dados
setwd("Facul/Economia Computacional/scrips/datasets") 
# A. importa��o dos dados
df = read.csv("schooling.csv",
              sep=",", 
              header = TRUE, 
              skip=6,
              na.strings = "-")
# B. retirando colunas apenas com NAs
df = df[colSums(!is.na(df)) > 0]

## 11. Histograma

df = airquality
hist(df$Temp,
     main = "Temperatura",
     xlab="Temperatura em F",
     col="blue")
## 12. BoxPlot por m�s
boxplot(Temp ~ Month, data = df) ## O mes mais quente do ano � o 8

## 13. Vari�vel no intervalo 
x = -15:15
# A. plot da fun��o
y = x^4+2*x
plot(x,y, col='red')

# B. Sobreposi��o 
z = x^4-5*x
lines(x,z, col='blue')
legend('top',legend=c("y","z"), col=c("red","blue"), lwd=2)

## 14. Equa��es
x = seq(-4,4,0.5)
y = 3*x^2
z = x^2-5*x
# A. gr�fico de linhas
barplot(x,y,z)
