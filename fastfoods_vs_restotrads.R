library(glue)
fastfoods = read.csv("fastfoods_siren.csv")
fastfoods$dateCreationEtablissement = as.Date(fastfoods$dateCreationEtablissement)

period = 1990:2023
result_fastfood = period
for(i in 1:length(period)){
  result_fastfood[i] = length(which(fastfoods$dateCreationEtablissement>=as.Date("1990-01-01") & fastfoods$dateCreationEtablissement<as.Date(glue("{period[i]+1}-01-01"))))
}
df = data.frame(fastfoods=result_fastfood,Date=period)
ggplot(df,aes(Date,fastfoods)) + geom_line() + theme_linedraw() + ylab("Nombre cumulé d'ouvertures de fastfoods")

resto_trad = read.csv("resto_trad_siren.csv")
resto_trad$dateCreationEtablissement = as.Date(resto_trad$dateCreationEtablissement)

period = 1990:2023
result_resto_trad = period
for(i in 1:length(period)){
  result_resto_trad[i] = length(which(resto_trad$dateCreationEtablissement>=as.Date("1990-01-01") & resto_trad$dateCreationEtablissement<as.Date(glue("{period[i]+1}-01-01"))))
}
df = data.frame(fastfoods=result_resto_trad,Date=period)
ggplot(df,aes(Date,fastfoods)) + geom_line() + theme_linedraw() + ylab("Nombre cumulé d'ouvertures de resto traditionnels")

