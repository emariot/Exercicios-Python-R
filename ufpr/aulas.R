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

# Aula 8 - Gráficos_2

x = -20:20
y = x^2
plot(y, type = 'l', col='blue')
plot(x, y, type = 'l', col='blue', lwd="")

curve(x^3-5*x, from=-4,to=4,col='red',lwd=2,ylab='')
par(new=TRUE)
curve(x^3-3*x, from=-4,to=4,col='blue',lwd=2,ylab='', yaxt='n')

legend(-4,50,legend=c("x^3+5x","x^3+3x"), 
                      col=c("red","blue"),
                      lwd=3)

funclog = function(x){
  1/(1+exp(-x+10))
}

curve(funclog(x), from = 0, to = 20)
curve(1-funclog(x), add = TRUE, col='red')

# Elementos gráficos
x = seq(-4,4,0.1)
y = x^2
z = x^4

df = as.data.frame(cbind(x,y,z))
graphics.off()

plot(x,y,type='l',main='Scatter Plot')
lines(x,z,type='l', col='blue')

# Alterando limite vertical
plot(x,z,type='l',main='Scatter Plot')
lines(x,y,type='l', col='blue')

# Dois eixos y
par(mar=c(3,4,2,4), mpg=c(1.5,0.5,0),bg="white")
plot(x,y,type='l',main='Scatter Plot', col='red', 
     col.axis='red',
     col.lab='red4')
axis(1, col='green4', col.axis='green4')
axis(2, col='red4', col.axis='red4')
par(new=TRUE)
plot(x,z,type='l',col='blue', axes=FALSE, bty='n',xlab="",ylab="")
axis(4, col='blue', col.axis='blue')
mtext("z", side=4, line=2, las=3,col="blue")
legend(0,250,legend=c("y","z"), col=c("red","blue"), lwd=2)

library(ggplot2)
df = as.data.frame(cbind(x,y,z))
ggplot(df,aes(x=x))+
  geom_line(aes(y=y), size=0.5, color='blue')+
  geom_line(aes(y=z), size=0.5, color='red')+
  scale_y_continuous(limits = c(0,20),sec.axis = sec_axis(~.*10,name='z'))+
  theme(
    panel.background = element_rect(fill = "transparent", color = "black"),
    panel.border = element_blank(),
    axis.line = element_line(),
    axis.ticks = element_line(color='black'),
    axis.title.y = element_text(color='blue', size=13),
    axis.title.y.left = element_text(color='blue', size=13),
    axis.line.y.left = element_line(color='blue'),
    axis.title.y.right = element_text(color='red', size=13),
    axis.line.y.right = element_line(color='red')
    )+
  ggtitle("ggplot - dois eixos")

# Gráficos com áreas polígonos
graphics.off()
par(mar=c(3,4,2,4), mpg=c(1.5,0.5,0),bg="white")
plot(1:10, 1:10, type = 'n', xlab = "x", ylab = "y") # Desenha um plot vazio

polygon(c(2,3,4), c(2,6,2), col='red')
points(c(2,3,4), c(2,6,2), col='coral4', pch=19)
text(1.5,1.5, "(2,2)")
text(3,6.5,"(3,6)")
text(4.5,1.5,"(4,2)")

polygon(c(7,6,8), c(7,10,10), col="cyan", density=20, angle=45)
polygon(c(6,6,9,9), c(2,6,6,2), col='tomato')

# Polígono entre curvas
x = seq(-5,5,0.1)
y = 2*x^2
z = x^3-10*x
plot(x,y,type='l', xlab="x", ylab = "y", col='red', ylim = c(-40,60))
lines(x,z, type='l', xlab="x", ylab = "y", col='blue', ylim = c(-40,60))


plot(x,y,type='l', xlab="x", ylab = "y,z", col='red', ylim = c(-40,60))
polygon(c(x, rev(x)), c(z, rev(y)), col='grey')
lines(x,y,type='l', xlab="x",ylab="y,z",col='red', ylim = c(-40,60), lwd=2)
lines(x,z,type='l',col='blue', lwd=2)
legend(0,50,legend=c("y=x^2", "z=x^3-10x"), col=c("red","blue"),pch=19,bty="n")


x = seq(-5,5,0.1)
y = cumsum(rnorm(x))
z = cumsum(rnorm(x))
plot(x,y,type="l", xlab="x", ylab = "y", col="red")
lines(x,z, type="l", xlab="x", ylab = "y", col="blue")

plot(x,y,type="l", xlab="x", ylab = "y", col="red")
polygon(c(x, rev(x)), c(z, rev(y)), col="gray")
lines(x,y, type="l", xlab="x", ylab = "y", col="blue", ylim=c(-60,40), lwd = 2)
lines(x,z, type="l", xlab="x", ylab = "y", col="red",lwd = 2)

# Aula 09 Gráficos_3
# Gráficos 3D com Scaterplot
install.packages("scatterplot3d")
library(scatterplot3d)
df = iris
scatterplot3d(df[,1:3])
scatterplot3d(df[,1:3], angle=60, pch=16, color="steelblue")

shape = c(15, 16, 17)
shapesv = shape[as.numeric(df$Species)]
df$shape = shapesv
scatterplot3d(df[,1:3], pch = shapesv)

# Alterando as cores
col = c("orange", "red4","deepskyblue4")
colorv = col[as.numeric(df$Species)]
scatterplot3d(df[,1:3],pch=shapesv, color=colorv,
              grid=FALSE, box = TRUE)
legend("right", legend = levels(df$Species), col=col, pch=shape)

# Pacote rgl
install.packages("rgl")
library(rgl)

# plot3d()
x = rnorm(20)
y = rnorm(20)
z = rnorm(20)

plot3d(x,y,z, col="blue")

# persp()
x = seq(-10, 10, length = 21)
y = x
z = 2*x+1*y
plot3d(x,y,z)
persp(x,y,z) # Erro porque z não é uma matriz

# plano
plano = function(x,y){
  z = 2*x + y
}
z = outer(x,y,plano)
persp(x,y,z, theta=0, phi=0, expand=1, col="cyan")

# parabola
parab = function(x,y){
  z = x^2 + y
}
z = outer(x,y,parab)
persp(x,y,z, theta=0, phi=0, expand=1, col="cyan", shade=0.5)

# Cone
# plano
cone = function(x,y){
  z = x^2 + y^2
}
z = outer(x,y,cone)
persp(x,y,z, theta=0, phi=0, expand=1, col="cyan", shade=0.5)

# quações ondulatórias (seno,cosseno)
f = function(x,y){
  f = sin(y)
}
z = outer(x,y,f)
persp(x,y,z, theta=45, phi=30, expand=1, col="green", border="black", shade=0.5)

# Criar uma função para gerar cores entre duas cores selecionadas
func_col = colorRampPalette(c("cyan", "red"))
col = func_col(41)
persp(x,y,z, theta=45, phi=30, col=col, border="black", shade=0.5)


# SUrface 3D
surface3d(x,y,z,col="green")
axes3d(c("x","y","z"),edges="bbox",labels=TRUE)

open3d()
persp3d(x,y,z, theta=45, phi=30, col=col, border="black", shade=0.5)

# plotly
install.packages("gapminder")
library(ggplot2)
library(plotly)
library(gapminder)

x = 1:100
y = 1:100
m =matrix(x*rnorm(1000,20,40), nrow = 100, ncol = 100)

fig = plot_ly(z=~m)
fig = fig %>% add_surface
fig

# Heat Map,
install.packages("hrbrthemes")
library(hrbrthemes)

df = as.matrix(mtcars)
heatmap(df, scale = "column", Colv = NA, Rowv = NA)

# HeatMap com ggplot2
library(ggplot2)
x = LETTERS[1:20]
y = paste0("var", seq(1,20))
data = expand.grid(X = x, Y = y)
data$z = runif(400,0,5)
ggplot(data, aes(X,Y,fill=z))+
  geom_tile()                     #HeatMap

# Aula 10 - Programação
# https://iqss.github.io/dss-workshops/R/Rintro/base-r-cheat-sheet.pdf

# Condição While
i = 0
while (i <= 10){
  print(paste("atep =",i))
  i = i+1
}


cond = TRUE
i = 0
while(cond){
  if(i>=10){
    cond = FALSE
  }
  print(paste("Condição=", cond, "step=", i))
  i = i+1
}

# Procurando uma letra 
l = letters
i = 1
procurar = "a"
achou = FALSE

while (!achou){
  if(l[i]==procurar){
    achou = TRUE
    print(paste("A letra", procurar, "esta na posição", i))
  }
  i = i+1
}

## Condição For
l = letters
for (i in 1:15){
  print(paste("Letra", l[i]))
}

## Loops alinhados

m = matrix(0, nrow = 10, ncol = 10)

for (i in 1:10){
  for (j in 1:10){
    m[i,j] = i+j
  }
}

# If else
{
  age = readline(prompt = "idade: ")
  if(age < 18){
    print("Você é jovem")
  }
  else{
    print("Você não é jovem")
  }
}

# Programa: Idade
age_ = FALSE
while(!age_){
  age = as.numeric(readline(prompt = "idade: "))
  if(age < 12){
    print("Você é criança")
  }
  else if(age >= 12 & age < 18){
    print("Você é jovem")
  }
  else if(age >= 18 & age < 100){
    print("Você é adulto")
  }
  else{
    print("Você não existe")
    age_ = TRUE
  }
}

# Programa: Estude economia
{
universidade <- readline(prompt = "Qual a universidade: ")
curso <- readline(prompt = "Qual o curso: ")
disciplina <- readline(prompt = "Qual a disciplina: ")

if(universidade == "UFPR"){
  if(curso == "Economia"){
    if(disciplina == "Economia Computacional"){
      print("ok")
    }
    else{
      print("Faça Economia Computacional")
    }
  }
  else{
    print("Omelhor curso é Economia")
  }
}
else{
  print("Voce deveria estudar na UFPR")
}
}

# Criando Funções

soma = function(x,y){return(x+y)}
prod = function(x,y){return(x*y)}
power = function(x,y){return(x^y)}

soma(2,2)
prod(2,3)
power(2,2)


create_matrix = function(formula, lin, col){
  m_temp = matrix(0, nrow = lin, ncol = col)
  for (i in 1:lin)
    for (j in 1:col)
      m_temp[i,j] = eval(parse(text=formula))
  return(m_temp)
}

create_matrix("j+i",10,10)
