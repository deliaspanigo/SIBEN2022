



evaluame <- '


columnas <- c("AH")

# Pasamos a letras
estas_columnas <- let2num(columnas)

# Minibase
mini <- BASE_MOD_ORIGINAL[estas_columnas]
mini2 <- mini

cortes2 <- matrix(NA, 3, 2)
cortes2[1,] <- c(0, 3)
cortes2[2,] <- c(4, 6)
cortes2[3,] <- c(7, 10)

for (n in 1:ncol(mini2)) {
for (k in 1:nrow(mini2)) {

este_dato <- as.numeric(as.character(mini[k,n]))

if (!is.na(este_dato)) {
dt1 <- este_dato >= cortes2[,1]
dt2 <- este_dato <= cortes2[,2]
dt3 <- (as.numeric(dt1) +  as.numeric(dt2)) == 2

este_dato2 <- paste0(cortes2[dt3, ][1], " a ", cortes2[dt3, ][2])

mini2[k,n] <- este_dato2
}
}
}


recat_apgar5 <- mini2
colnames(recat_apgar5) <- "recat_apgar5"


# Salida
data_salida <- recat_apgar5



'





