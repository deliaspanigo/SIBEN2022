


evaluame <- '



# Criterio de inclusión (Son 957 pacientes)
# Llevara un "Si" para cuando se cumplen las siguientes condiciones...
#   a. Paciente con "Si" en la columna AZ (recibió alimentación enteral)
#   b. Paciente “Vivo” en la columna FD
#   c. Paciente con la Columna FC mayor que 5



criterio_seleccion2 <- rep(NA, nrow(BASE_MOD_ORIGINAL))
cambio <- BASE_MOD_ORIGINAL[,let2num(c("AZ", "FD", "FC"))]

for (k in 1:nrow(cambio)) {

este_cambio <- as.vector(as.matrix(cambio[k, ]))

if(length(este_cambio) == length(na.omit(este_cambio))) {

if (este_cambio[1] == "Si") {
if (este_cambio[2] == "Vivo") {
if (as.numeric(as.character(este_cambio[3])) > 5) {
criterio_seleccion2[k] <- "Si"
} else criterio_seleccion2[k] <- "No" 
} else criterio_seleccion2[k] <- "No" 
} else criterio_seleccion2[k] <- "No" 

} # Fin if
} # Fin for k


recat_criterio_seleccion2 <- criterio_seleccion2

dim(recat_criterio_seleccion2) <- c(length(recat_criterio_seleccion2), 1)
colnames(recat_criterio_seleccion2) <- "recat_criterio_seleccion2"

# Salida
data_salida <- recat_criterio_seleccion2



'

