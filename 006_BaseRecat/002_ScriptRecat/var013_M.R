

evaluame <- '


columnas <- c("AR")

# Pasamos a letras
estas_columnas <- let2num(columnas)


# Minibase
mini <- BASE_MOD_ORIGINAL[,estas_columnas]
mini7 <- mini
dt_guiones <- mini7 == "--"
mini7[dt_guiones] <- NA
mini7 <- as.numeric(as.character(mini7))
mini8 <- mini7 

cortes7 <- as.data.frame(matrix(NA, 7, 3))
cortes7[1,] <- c(0, 21, "21%")
cortes7[2,] <- c(22, 30, "22% a 30%")
cortes7[3,] <- c(31, 39, "31% a 39%")
cortes7[4,] <- c(40, 59, "40% a 59%")
cortes7[5,] <- c(60, 89, "60% a 89%")
cortes7[6,] <- c(90, 99, "90% a 99%")
cortes7[7,] <- c(100, 10000, "100%")

for (k in 1:length(mini7)) {

este_dato <- mini7[k]

if (!is.na(este_dato)) {
este_dato <- as.numeric(as.character(este_dato))

dt1 <- este_dato >= as.numeric(as.character(cortes7[,1]))
dt2 <- este_dato <= as.numeric(as.character(cortes7[,2]))
dt3 <- (as.numeric(dt1) +  as.numeric(dt2)) == 2

este_dato2 <- cortes7[dt3, 3]

mini8[k] <- este_dato2

}
}

dim(mini8) <- c(length(mini8), 1)

recat_fiO2 <- mini8
colnames(recat_fiO2) <- "recat_fiO2"


# Salida
data_salida <- recat_fiO2



'



