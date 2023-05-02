


evaluame <- '

# 1) recat_pais (D)

# El "recat_pais" es una copia del pais del hospital de cada cada paciente.
# Es una copia literal. No tiene modificaciones

recat_pais <- BASE_MOD_ORIGINAL[,let2num("FJ")]

# Le damos dimension de columna
dim(recat_pais) <- c(length(recat_pais), 1)

# Le damos un nombre
colnames(recat_pais) <- "recat_pais"

# Salida
data_salida <- recat_pais

'
#######################################################################################
