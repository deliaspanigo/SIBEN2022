


evaluame <- '


# Llevara un “Si” para los “Vivos” de (FD) Y Fallecidos igual o mayor a dos días de (FC).
# Llevara un “No” para los Fallecidos de (FD) igual o menor a 1 día (FC).



criterio_seleccion <- rep(NA, nrow(BASE_MOD_ORIGINAL))
cambio <- BASE_MOD_ORIGINAL[,let2num(c("FD", "FC"))]

for (k in 1:nrow(cambio)) {

este_cambio <- as.vector(as.matrix(cambio[k, ]))

if(length(este_cambio) == length(na.omit(este_cambio))) {

if (este_cambio[1] == "Vivo") criterio_seleccion[k] <- "Si" 
if (este_cambio[1] == "Fallecido" && as.numeric(este_cambio[2]) >= 2) criterio_seleccion[k] <- "Si"
if (este_cambio[1] == "Fallecido" && as.numeric(este_cambio[2]) <= 1) criterio_seleccion[k] <- "No"

} # Fin if
} # Fin for k


recat_criterio_seleccion1 <- criterio_seleccion

dim(recat_criterio_seleccion1) <- c(length(recat_criterio_seleccion1), 1)
colnames(recat_criterio_seleccion1) <- "recat_criterio_seleccion1"

# Salida
data_salida <- recat_criterio_seleccion1





'





