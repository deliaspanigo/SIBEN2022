

evaluame <- '


# La Edad Gestacional Inicial
edad_gestacional_inicial <- BASE_MOD_ORIGINAL[,let2num("C")]


# Dias de internacion
dias_internacion <- BASE_MOD_ORIGINAL[,let2num("FC")]

# Los dias de internacion los pasamos a semanas...
semanas_internacion <-  dias_internacion%/%7

# La Edad Gestacional Final
recat_eg_final <- edad_gestacional_inicial + semanas_internacion

dim(recat_eg_final) <- c(length(recat_eg_final), 1)


colnames(recat_eg_final) <- "recat_eg_final"


# Salida
data_salida <- recat_eg_final













'



