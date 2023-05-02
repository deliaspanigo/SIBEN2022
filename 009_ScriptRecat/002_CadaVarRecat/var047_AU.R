

# En esta variable lo que se realiza es...
# Un criterio de inclusion que se aplica sobre la edad gestacional Inicial (Columna C - Variable 3 - Base Original)
# Si el paciente tiene entre 22 y 33 semanas el paciente llevara un "Si".
# Si esta por abajo o por arriba de ese rango, recibira un "No".




evaluame <- '


# 
columnas <- c("C")

# Pasamos a letras
estas_columnas <- let2num(columnas)


# Minibase
mini <- BASE_MOD_ORIGINAL[estas_columnas]
mini7 <- mini

valores_referencia <- c(22, 33)





  for (k in 1:nrow(mini7)) {
    
    este_dato <- as.numeric(as.character(mini[k,]))
    
    # Si el dato no es vacio...
    if (!is.na(este_dato)) {

    # Si el dato es mayor o igual al valor de referencia 1
    if (este_dato >= valores_referencia[1]) {

    # Si el dato es menor o igual al valor de referencia 2
    if (este_dato <= valores_referencia[2]) {


    este_dato2 <- "Si"
    
    mini7[k,] <- este_dato2
    
    } else mini7[k,] <- "No"   # Fin if
    } else mini7[k,] <- "No"   # Fin if

  } else mini7[k,] <- NA     # Fin if
  }


recat_criterio_inclusion10 <- mini7

colnames(recat_criterio_inclusion10) <- "recat_criterio_inclusion10"


# salida 
data_salida <- recat_criterio_inclusion10


'
