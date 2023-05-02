

# En esta variable lo que se realiza es...
# Tomar la Edad Gestacional Inicial y Categorizarla

evaluame <- '



columnas <- c("C")

# Pasamos a letras
estas_columnas <- let2num(columnas)


# Minibase
mini <- BASE_MOD_ORIGINAL[estas_columnas]
mini7 <- mini

cortes7 <- as.data.frame(matrix(NA, 7, 3))
cortes7[1,] <- c(22, 24, "22 a 24 sem")
cortes7[2,] <- c(25, 27, "25 a 27 sem")
cortes7[3,] <- c(28, 30, "28 a 30 sem")
cortes7[4,] <- c(31, 33, "31 a 33 sem")
cortes7[5,] <- c(34, 36, "34 a 36 sem")
cortes7[6,] <- c(37, 38, "37 a 38 sem")
cortes7[7,] <- c(39, 43, "39 a 43 sem")


  for (k in 1:nrow(mini7)) {
    
    este_dato <- as.numeric(as.character(mini[k,]))
    
    # Si el dato no es vacio...
    if (!is.na(este_dato)) {

    # Si el dato es mayor o igual al valor mas chico de la tabla
    if (este_dato >= as.numeric(cortes7[1,1])) {

    # Si este dato es mas chico o igual al valor mas grande de la tabla
    if (este_dato <= as.numeric(cortes7[nrow(cortes7),2])) {

    dt1 <- este_dato >= as.numeric(as.character(cortes7[,1]))
    dt2 <- este_dato <= as.numeric(as.character(cortes7[,2]))
    dt3 <- (as.numeric(dt1) +  as.numeric(dt2)) == 2
    
    este_dato2 <- cortes7[dt3, 3]
    
    mini7[k,] <- este_dato2
    
    } else mini7[k,] <- NA   # Fin if
    } else mini7[k,] <- NA   # Fin if

  } else mini7[k,] <- NA     # Fin if
  }


recat_rangos_eg_inicial <- mini7

colnames(recat_rangos_eg_inicial) <- "recat_rangos_eg_inicial"


# salida 
data_salida <- recat_rangos_eg_inicial


'
