library(readr)
library(tidyr)
vendas = read_csv("vendas_artistas_br.csv")
vendas[vendas$Artista == "Exaltasamba",]$Período = "1986-presente"
vendas[vendas$Artista == "Wando",]$`Gênero(s)` = "Brega/Romântico"
vendas[vendas$Artista == "Nelson Ned",]$`Gênero(s)` = "Brega/Romântico"
vendas[vendas$Artista == "Banda Calypso",]$`Gênero(s)` = "Calipso"
vendas[vendas$Artista == "Mara Maravilha",]$`Gênero(s)` = "Infantil"
vendas[vendas$Artista == "Roberto Carlos",]$`Gênero(s)` = "Jovem Guarda"
vendas[vendas$Artista == "Nelson Gonçalves",]$`Gênero(s)` = "Samba-canção"
vendas[grepl("Pagode", vendas$`Gênero(s)`),]$`Gênero(s)` = "Pagode"
vendas[grepl("Pop", vendas$`Gênero(s)`),]$`Gênero(s)` = "Pop"
vendas[grepl("omântico", vendas$`Gênero(s)`),]$`Gênero(s)` = "Brega/Romântico"
vendas[grepl("católica", vendas$`Gênero(s)`),]$`Gênero(s)` = "Música cristã contemporânea"
vendas = separate(data = vendas, col = `Período`, into = c("de", "até"), sep = ",|-")
vendas[grepl("tualmente|resente", vendas$`até`),]$`até` = 2016

write_csv(vendas, "vendas_artistas_br_editado.csv")
