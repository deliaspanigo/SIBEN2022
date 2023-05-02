






evaluame <- '



# Criterio de inclusión (Son 957 pacientes)
# Llevara un "Si" para cuando se cumplen las siguientes condiciones...
#   1) Paciente "Vivo" - "IN-Vivo_Fallecido-FD-Vivo"
#   2) "Si" en fondo de ojo  - "IN-Fondo de Ojo-BY-Si"
#   3) "Si" en Retinopatia - "IN-Retinopatia-BZ-Si"


criterio_seleccion4 <- rep(NA, nrow(BASE_MOD_ORIGINAL))
cambio <- BASE_MOD_ORIGINAL[let2num(c("FD", "BY", "BZ"))]

for (k in 1:nrow(cambio)) {

este_cambio <- as.character(as.vector(as.matrix(cambio[k,])))

referencia_cambio <- c("Vivo", "Si", "Si")

if(sum(is.na(este_cambio)) == 0) {

if ( identical(este_cambio, referencia_cambio)) criterio_seleccion4[k] <- "Si" else criterio_seleccion4[k] <- "No"


} # Fin if
} # Fin for k



recat_criterio_seleccion4 <- criterio_seleccion4

dim(recat_criterio_seleccion4) <- c(length(recat_criterio_seleccion4), 1)
colnames(recat_criterio_seleccion4) <- "recat_criterio_seleccion4"

# Salida
data_salida <- recat_criterio_seleccion4



'

