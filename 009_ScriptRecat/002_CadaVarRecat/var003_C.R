


evaluame <- '

# 1) recat_nombre_hospital (C)

# El "recat_nombre_hospital" es una copia del nombre del hospital de cada cada paciente.
# Es una copia literal. No tiene modificaciones

recat_nombre_hospital <- BASE_MOD_ORIGINAL[,let2num("FI")]

# Le damos dimension de columna
dim(recat_nombre_hospital) <- c(length(recat_nombre_hospital), 1)

# Le damos un nombre
colnames(recat_nombre_hospital) <- "recat_nombre_hospital"

# Salida
data_salida <- recat_nombre_hospital

'
#######################################################################################
