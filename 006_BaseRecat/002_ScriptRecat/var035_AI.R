


evaluame <- '



# Criterio de inclusión (Son 957 pacientes)
# Llevara un "Si" para cuando se cumplen las siguientes condiciones...
#   a. Paciente con la Columna FC mayor o igual a 15



criterio_seleccion3 <- rep(NA, nrow(BASE_MOD_ORIGINAL))
cambio <- BASE_MOD_ORIGINAL[let2num(c("FC"))]

for (k in 1:nrow(cambio)) {

este_cambio <- as.vector(as.matrix(cambio[k,]))

if(!is.na(este_cambio)) {

if (as.numeric(as.character(este_cambio[1])) >= 15) criterio_seleccion3[k] <- "Si" else criterio_seleccion3[k] <- "No"

} # Fin if
} # Fin for k



recat_criterio_seleccion3 <- criterio_seleccion3

dim(recat_criterio_seleccion3) <- c(length(recat_criterio_seleccion3), 1)
colnames(recat_criterio_seleccion3) <- "recat_criterio_seleccion3"

# Salida
data_salida <- recat_criterio_seleccion3



'

