


evaluame <- '

# 1) recat_anio (B)

# El "recat_anio" es una copia del anio de ingreso de cada cada paciente.
# Es una copia literal. No tiene modificaciones

recat_anio <- BASE_MOD_ORIGINAL[,let2num("FH")]

# Le damos dimension de columna
dim(recat_anio) <- c(length(recat_anio), 1)

# Le damos un nombre
colnames(recat_anio) <- "recat_anio"

# Salida
data_salida <- recat_anio

'
#######################################################################################
