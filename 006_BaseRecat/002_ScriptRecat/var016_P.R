

evaluame <- '


# El sexo del paciente tiene tres categorias posibles.
# 1) Hombre
# 2) Mujer
# 3) Ambiguo

# "Ambiguo" no es una categoria que pueda utilizarse.
# Entonces generamos una nueva columna, que solo deja las dos primeras.


recat_sexo <- BASE_MOD_ORIGINAL[,let2num("AT")]
recat_sexo[recat_sexo == "Ambiguo"] <- NA

dim(recat_sexo) <- c(length(recat_sexo), 1)


colnames(recat_sexo) <- "recat_sexo"


# Salida
data_salida <- recat_sexo













'



