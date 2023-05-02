


evaluame <- '

# 6) recat_grupo (F)

# El "recat_grupo" es la categorizacion de los pesos de los pacientes
pesos <- BASE_MOD_ORIGINAL[,let2num("B")]
recat_grupo <- rep(NA, length(pesos))
dt_1 <- pesos <= 1500
recat_grupo[dt_1] <- "G1"
recat_grupo[!dt_1] <- "G2"

# Le damos dimension de columna
dim(recat_grupo) <- c(length(recat_grupo), 1)

# Le damos un nombre
colnames(recat_grupo) <- "recat_grupo"

# Salida
data_salida <- recat_grupo

'
#######################################################################################
