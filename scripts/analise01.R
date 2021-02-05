# Bibliotecas

library(readxl)
library(tidyverse)
library(data.table)
library(descr)
library(RColorBrewer)
library(hrbrthemes)
library(kableExtra)
library(janitor)
library(skimr)
library(knitr)
library(htmltools)

options(knitr.table.format = "html")

# ------ Lendo os dados -------

# getwd() # diretório atual

#cursos <- read_excel("data/Sistematizacao_cursos_CEMAVE_16.11.2020.xlsx",  sheet = "cursos")   

# alunos <- read_excel("data/Sistematizacao_cursos_CEMAVE_16.11.2020.xlsx", sheet = "alunos")

# instrutores <- read_excel("data/Sistematizacao_cursos_CEMAVE_16.11.2020.xlsx", sheet = "instrutores")


cursos <- read.csv("data/cursos.csv", h=T, sep=";") 

alunos <- read.csv("data/alunos.csv", h=T, sep=";")

instrutores <- read.csv("data/instrutores.csv", h=T, sep=";")


# ---------- inspecionando a estrutura do arquivo cursos.csv

str(cursos)
View(cursos)
cursos$ID <- as.character(cursos$ID)
cursos$modalidade <- as.factor(cursos$modalidade)
class(cursos$latitude)

# ---------- Excluindo o curso de R ministrado para o CEMAVE

cursos <- cursos[(-43),]

# ---------- Visualizando a estrutura dos dados

dim(cursos)
View(cursos)
glimpse(cursos)
class(cursos$latitude)
class(cursos$longitude)
cursos$latitude <- as.character(cursos$latitude)
cursos$longitude <- as.character(cursos$longitude)
# ----------- Resumo dos dados

summary(cursos)

sum(1:5, NA, na.rm = TRUE)
n_instrutores <- sum(cursos$instrutores, NA, na.rm = TRUE)
sum(cursos$duracao.dias, NA, na.rm = TRUE)
sum(cursos$carga.horaria, NA, na.rm = TRUE)
sum(cursos$participantes, NA, na.rm = TRUE)
sum(cursos$alunos, NA, na.rm = TRUE)
sum(cursos$colaboradores, NA, na.rm = TRUE)

summary(cursos$alunos)

summary(cursos$instrutores)

# ---------- Contagens

freq(cursos$foco.curso, user.missing = c("NA"))
freq(cursos$municipio, user.missing = c("NA"))
freq(cursos$UF, user.missing = c("NA"))
freq(cursos$alunos, user.missing = c("NA"))
freq(cursos$ano, user.missing = c("NA"))
freq(cursos$UF, user.missing = c("NA"))

freq(alunos$municipio, user.missing = c("NA"))
unique(alunos$municipio)
freq(alunos$UF, user.missing = c("NA"))
unique(alunos$UF)
freq(alunos$tipos.inst, user.missing = c("NA"))
unique(alunos$tipos.inst)
freq(alunos$instituicao, user.missing = c("NA"))
unique(alunos$instituicao)

freq(instrutores$participantes, user.missing = c("NA"))
freq(instrutores$genero, user.missing = c("NA"))
freq(instrutores$instituicao, user.missing = c("NA"))
freq(instrutores$tipos.inst, user.missing = c("NA"))
unique(instrutores$municipio)
freq(instrutores$UF, user.missing = c("NA"))
unique(instrutores$UF)

unique(instrutores$instituicao)
unique(instrutores$participantes)
unique(instrutores$municipio)
unique(instrutores$UF)


unique(cursos$municipio)
unique(cursos$UF)
unique(cursos$regiao)
unique(cursos$nome.curso)

# ------

?flexdashboard
