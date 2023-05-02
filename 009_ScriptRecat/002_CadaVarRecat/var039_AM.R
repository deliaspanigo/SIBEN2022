






evaluame <- 
'

# Columna FD - Vivo_Fallecido
# Columna AY - Fallece.al.nacer


# Se toma la columna del estado "Vivo/Muerto" del paciente.
# Y para los que han fallecido al nacer, se cambia el estado de "Fallecido" por "Fallece Nacer".



cambio <- BASE_MOD_ORIGINAL[let2num(c("FD", "AY"))]

criterio_seleccion7 <- as.character(cambio[,1])

referencia <- c("Fallecido", "Si")

for (k in 1:nrow(cambio)) {

este_cambio <- as.character(as.vector(as.matrix(cambio[k, ])))

if(sum(is.na(este_cambio)) == 0) {

if (identical(este_cambio, referencia)) criterio_seleccion7[k] <- "Fallece Nacer"

} # Fin if

if (este_cambio[2] == "Si") criterio_seleccion7[k] <- "Fallece Nacer"

} # Fin for k



recat_criterio_seleccion7 <- criterio_seleccion7

dim(recat_criterio_seleccion7) <- c(length(recat_criterio_seleccion7), 1)
colnames(recat_criterio_seleccion7) <- "recat_criterio_seleccion7"

# Salida
data_salida <- recat_criterio_seleccion7



'

