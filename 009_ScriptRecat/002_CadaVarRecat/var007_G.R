


evaluame <- '

  # Aislamos la varaible a trabajar
  pesos <- BASE_MOD_ORIGINAL[,let2num("B")]

  # Cat peso de referencia
  nombre_col <- c("Orden", "Min", "Max", "Categoría")
  ref_peso <- as.data.frame(matrix(NA, 10, length(nombre_col)))
  ref_peso[,2] <- as.numeric(as.character(ref_peso[,2]))
  ref_peso[,3] <- as.numeric(as.character(ref_peso[,3]))
  colnames(ref_peso) <- nombre_col
  
  ref_peso[1,] <- c(1, 0, 500, "Hasta 500")
  ref_peso[2,] <- c(2, 501, 750, "501 a 750")
  ref_peso[3,] <- c(3, 751, 1000, "751 a 1000")
  ref_peso[4,] <- c(4, 1001, 1250, "1001 a 1250")
  ref_peso[5,] <- c(5, 1251, 1500, "1251 a 1500")
  ref_peso[6,] <- c(6, 1501, 1750, "1501 a 1750")
  ref_peso[7,] <- c(7, 1751, 2000, "1751 a 2000")
  ref_peso[8,] <- c(8, 2001, 2500, "2001 a 2500")
  ref_peso[9,] <- c(9, 2501, 10000000, "Mayores a 2500")
  ref_peso <- na.omit(ref_peso)

    recat_cat_peso <- rep(NA, length(pesos))
    
    for (n in 1:length(recat_cat_peso)) {

    este_peso <- pesos[n]
        
      # Si no esta vacio el dato...
      if (!is.na(este_peso)) {

  ingreso <- FALSE
  for(k in 1:nrow(ref_peso)) {

    if (ingreso == FALSE) {
      if(este_peso >= as.numeric(as.character(ref_peso[k,2])) && este_peso <= as.numeric(as.character(ref_peso[k,3]))){

recat_cat_peso[n] <- ref_peso[k,4]
ingreso <- TRUE
} #if
} # if

} # for k
} else  recat_cat_peso[n] <- "" #!is.na
} # For n

# Le damos dimension de columna
dim(recat_cat_peso) <- c(length(recat_cat_peso), 1)

# Le damos un nombre
colnames(recat_cat_peso) <- "recat_cat_peso"

# Salida
data_salida <-  recat_cat_peso


'
