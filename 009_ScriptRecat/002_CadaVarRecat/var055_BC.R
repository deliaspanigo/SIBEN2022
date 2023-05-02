


evaluame <- '

  # Aislamos la varaible a trabajar
  mi_variable <- BASE_MOD_ORIGINAL[,let2num("FQ")]

  recat_variable <- rep(NA, length(mi_variable))


    
    for (n in 1:length(recat_variable)) {

    este_dato <- mi_variable[n]
        
      # Si no esta vacio el dato...
      if (!is.na(este_dato)) {

        if(este_dato <= 2) recat_variable[n] <- "Si" else
          if(este_dato >=3) recat_variable[n] <- "No"
          
 
    } else  recat_variable[n] <- "" #!is.na
    
} # For n

# Le damos dimension de columna
dim(recat_variable) <- c(length(recat_variable), 1)

# Le damos un nombre
colnames(recat_variable) <- "recat_criterio_inclusion13"

# Salida
data_salida <-  recat_variable


'