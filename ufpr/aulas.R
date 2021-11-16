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

# Aula 05 - Manipulação de dados
# Importando dados de bancos abertos com pacotes específicos
# BACEN     : Banco Central do Brasil
# WDI       : World Developement from world Bank: Painel por país, com 60 anos e 2440 variáveis
# pwt10     : Penn World Tables v.10.0 - Dados sobre crescimento econômico mundial, por país
# Ipeadata  : Base de dados sobre economia brasileira IPEA

install.packages("car")
library(tidyr)
library(WDI)
library(car)

# dfWDI = WDIbulk(timeout = 600) ## Carrega todo o banco de dados
vars = WDIsearch("Individuals with primary education")
df_educ = WDI(country = "all", indicator = vars, start = 1980, end = 2020)

vars = WDIsearch("GDP per capita, PPP")
df_PDC = WDI(country = "all", indicator = vars, start = 1980, end = 2020)

# Banco Central do Brasil - Via API
v1 = read.csv("http://api.bcb.gov.br/dados/serie/bcdata.sgs.28763/dados?formato=csv", sep=";", dec=",")
v2 = read.csv("http://api.bcb.gov.br/dados/serie/bcdata.sgs.28764/dados?formato=csv", sep=";", dec=",")
v3 = read.csv("http://api.bcb.gov.br/dados/serie/bcdata.sgs.28770/dados?formato=csv", sep=";", dec=",")

df = cbind(v1,v2,v3)
df = df[,-c(3,5)]

plot(v1$valor, type="l", col="blue")
plot(v2$valor, type="l", col="red")
plot(v3$valor, type="l", col="darkgreen")

# Dados inflação
ipca12 = read.csv("http://api.bcb.gov.br/dados/serie/bcdata.sgs.13522/dados?formato=csv", sep=";", dec=",")
ipca12[,1] = as.Date(ipca12$data, "%d/%m/%Y")
ipca12_ = ipca12[ipca12$data>=as.Date("1999/12/31"),]

plot(ipca12_$data, ipca12_$valor, type="l", col="blue")
abline(h=10,lty=2)

# Penn world Table (Macroeconomia do Crescimento Econômico): 183 países, 52 variáveis
install.packages("pwt10")
library(pwt10)

#pwt = data('pwt10.0')
pwt = force(pwt10.0)

scatterplot(hc~year|country, data=pwt, boxplot=FALSE, smooth=FALSE,
            reg.line=FALSE, legend=FALSE, lwd=2, pch=1)

pwt$gdppc = pwt$rgdpe/pwt$pop
scatterplot(gdppc~year|country, data=pwt, boxplot=FALSE, smooth=FALSE,
            regLine=FALSE, legend=FALSE, lwd=2)
#IPEA Data

install.packages("ipeadatar")
library(ipeadatar)

countries = available_countries()
terr = available_territories()
series = available_series()
series2 = series[series$status=="Active",]
meta = metadata(code = "PRECOS12_IPCA12")
ipca = ipeadata(code = "BM12_IPCAEXP1212", language = "br")
plot(ipca$value, type="l", color="tomato", lwd=2)

# Aula 06 - ORGANIZANDO E MANIPULANDO DADOS 

x = sample(1:100, 30)
y = 3*x + round(rnorm(30,40,60),0)
z = -2*x + round(rnorm(30,40,60),0)
n = cbind(x,y,z)
hist(z)

# Data Frame
df = as.data.frame(n)
rm(x,y,z)
plot(df$x,df$y, pch=16)
plot(df$x,df$z, pch=16)
plot(df$y,df$z, pch=16)

# Transformar em Séries temporais
dt = ts(df,start=1991, end=2020, frequency = 1)
plot(dt[,1],type='b',pch=16)

#XTS manipula matrizes
library(xts)
date = seq(as.Date("1991-01-01"), by='month', length.out=nrow(n))
date
dt2 = xts(n,order.by=date)

plot(dt2[,"x"],type='b',pch=16,main='Time Series: x_t')

# Dados categóricos organizados como Fator
library(dplyr)
df$Type = sample(c("A","B","C"),30,replace=TRUE)
df$Type = as.factor(df$Type)
plot(df$x,df$y, pch=16, col=df$Type)

# Sumários estatísticos
df = group_by(df,Type)
summarise(df,n=n(),soma=sum(x),media=mean(x),dp=sd(x), cv=(sd(x)/mean(x)))


# PANEL DATA
# três dimensões:
# dimensão cross section = type
# Dimensão tempo = Data
# Dimensão dados = x,y,z

df$Type = rep(LETTERS[1:3],times=10) 
summarise(df, n=n())

df = df[order(df$Type),]

df$date = rep(2011:2020,times=3)

install.packages('psych')
library(plm)
library(psych)  


pdf = pdata.frame(df,index=c('Type','date'))

summary(pdf)
describe(pdf)

# Reorganizando dataframe
# formatos Wide e long
library(reshape2)

rm(list=ls())
x = sample(1:100, 30)
y = 3*x + round(rnorm(30,50,30),0)
z = -2*x + round(rnorm(30,50,30),0)
df = as.data.frame(cbind(x,y,z))
df$Type = rep(LETTERS[1:3],times=10) 
df = df[order(df$Type),]
date = rep(2011:2020,3)
df = cbind(date,df)
df # Além de dataframe este formato é chamado wide (variáveis distribuidas ao longo das colunas)

df2 = t(df) # Transpõe, mas transforma em caracter 
df2 # Formarto long

df3 = melt(df, id=c("Type", 'date')) # Estrutura de dados em formato longo (variáveis distribuidas ao longo das linhas)

df4 = acast(df3,Type-date-variable) # transforma objetos em formato long em array

df5 = dcast(df3, date-variable,mean,margins=c("date","variable")) # formato long em dataframe

# Reshate wide to long
df
dWide = reshape(df,
                varying = c("x","y","z"),
                v.names = "valor",
                timevar = "variavel",
                times= c("x","y","z"),
                direction = "long")
# Reshape long to wide
dLong = reshape(dWide,
                timevar = "variavel",
                idvar = c('id', 'date', 'Type'),
                direction = "wide")

# Aula - 7 Gráficos

df = mtcars
plot(df$wt, df$mpg)
abline(lm(df$mpg~df$wt), col="blue", lwd=2)

cor(df$wt, df$mpg) # Correlação cor(x,y)

# Com ggplot 2
library(ggplot2)
ggplot(df, aes(x = wt, y = mpg)) +
  geom_point()+
  geom_smooth(method = "lm")


df_2 = iris
df_2$obs = row(df_2)

install.packages("tidyverse")
library(tidyverse)

plot(df_2$Sepal.Width, df_2$Sepal.Length, pch=16)
plot(df_2$Sepal.Width, df_2$Sepal.Length, pch=16, col=df_2$Species)

colors = c("red", "orange", "blue")

ggplot(df_2, aes(x=Sepal.Length, y=Sepal.Width, color=Species))+
  geom_point() + 
  scale_alpha_manual(values = colors) +
  theme_bw()

df_2 = group_by(df_2, Species)

stats = summarise(df_2, n=n(),Sepal.Length=mean(Sepal.Length),
        Sepal.Width = mean(Sepal.Width))

ggplot(df_2, aes(x=Sepal.Length, y=Sepal.Width, color=Species))+
  geom_point() + 
  geom_point(data=stats, size=5, pch=15) +
  scale_alpha_manual(values = colors) 


# Gráficos de Linha
df_3 = pressure
par(mfrow=c(1,2))
plot(df_3$temperature, type = "l")
plot(df_3$pressure, type = "l")
plot(df_3$temperature, df_3$pressure, type = "l")

# Pontos e linhas
plot(df_3$temperature, df_3$pressure, type = "l")
points(df_3$temperature, df_3$pressure)
points(df_3$temperature, df_3$pressure/2, col='red')
lines(df_3$temperature, df_3$pressure/2, col='red')

ggplot(df_3, aes(x = temperature, y = pressure))+
  geom_line()+
  geom_point()

# Bar plot 
df_5 = BOD
df_5$local = letters[3:8]

barplot(df_5$demand, names.arg = df_5$local, col="cyan")

tb = table(df$cyl)
tb

barplot(tb, col='yellow') # Distribuição de frequência

ggplot(df_5, aes(x=factor(Time), y=demand)) +
  geom_col()

ggplot(df, aes(x=factor(cyl))) +
  geom_bar()

# Histogramas

df$models = rownames(df)
hist(df$mpg, breaks=5, freq = FALSE)


ggplot(df, aes(x=mpg)) +
  geom_histogram(binwidth = 5)


# Boxplot
df_6 = ToothGrowth
boxplot(len ~ supp, data = df_6)
boxplot(len ~ supp + dose, data = df_6)

# Indice de bem estar urbano - municípios
install.packages("readxl")
library(readxl)
install.packages('Rcpp')
library(Rcpp)
setwd("Facul/Economia Computacional/scrips/datasets") 
df = read_excel("Municipios.xlsx")

boxplot(df$IBEU~df$Nom_RM)
stripchart(df$IBEU~df$Nom_RM, 
           vertical=TRUE,
           method="jitter",
           pch=16,
           cex=0.8,
           add=TRUE,
           col="red")
par(mar=c(6,4,1,1), cex.axis=0.7)
my_colors = (2:(length(unique(df$Nom_RM)))+1)
boxplot(df$IBEU~df$Nom_RM,
        col = my_colors,
        outline = FALSE,
        horizontal = FALSE,
        las = 2,
        xlab = "")
stripchart(df$IBEU~df$Nom_RM, 
           vertical=TRUE,
           method="jitter",
           pch=16,
           cex=0.8,
           add=TRUE,
           col="red")

medians = reorder(df$Nom_RM,df$IBEU,median)
boxplot(df$IBEU~medians,
        col = my_colors,
        outline = FALSE,
        horizontal = FALSE,
        las = 2,
        xlab = "")
stripchart(df$IBEU~medians, 
           vertical=TRUE,
           method="jitter",
           pch=16,
           cex=0.8,
           add=TRUE,
           col="red")

# Aula 8 