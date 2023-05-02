


evaluame <- '

# 1) recat_id_pac (A)

# El "recat_id_pac" es una copia del id de cada paciente.
# Es una copia literal. No tiene modificaciones

recat_id_pac <- BASE_MOD_ORIGINAL[,let2num("A")]

# Le damos dimension de columna
dim(recat_id_pac) <- c(length(recat_id_pac), 1)

# Le damos un nombre
colnames(recat_id_pac) <- "recat_id_pac"

# Salida
data_salida <- recat_id_pac

'
#######################################################################################
