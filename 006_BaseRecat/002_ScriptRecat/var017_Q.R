

evaluame <- '





ref_fenton_peso  <- BASE_ref_Fenton_Peso


# Las categorias
fenton_peso_nacim <- rep(NA, nrow(BASE_MOD_ORIGINAL))

mini <- data.frame(sexo, edad_gestacional_inicial, pesos_inicial)


# Generacion del criterio fenton de peso al nacer
for (n in 1:nrow(mini)) {

esta_fila <- mini[n, ]

# Si tiene todos los datos...
if (sum(is.na(as.vector(as.matrix(esta_fila)))) == 0) {

este_sexo <- as.character(esta_fila[1,1])
esta_semana <- esta_fila[1,2]
este_peso <- esta_fila[1,3]

# La semana de gestación puede estar fuera del rango de referencia.
# El rango de referencia puede ser diferente para cada sexo...
# A si que el control está en cada sexo.

# Control para fuera de rango
fuera_de_rango <- FALSE

if(este_sexo == "Femenino" | este_sexo == "Masculino") {

dt_sexo <- este_sexo == ref_fenton_peso$Sexo 
dt_semana <- esta_semana == ref_fenton_peso$`Edad gestacional`

dt_fila <- (as.numeric(dt_sexo) + as.numeric(dt_semana)) == 2   

este_orden <- c(1:nrow(ref_fenton_peso))[dt_fila]

if (length(este_orden) == 1) { 
p3  <- ref_fenton_peso$p3[este_orden]
p10 <- ref_fenton_peso$p10[este_orden]
p90 <- ref_fenton_peso$p90[este_orden]

} else fuera_de_rango <- TRUE



if (fuera_de_rango == FALSE) {
if (este_peso < p3) fenton_peso_nacim[n] <- "PEG SEVERO" else 
if (este_peso >= p3 && este_peso < p10) fenton_peso_nacim[n] <- "PEG" else 
if (este_peso >= p10 && este_peso <= p90) fenton_peso_nacim[n] <- "AEG" else 
if (este_peso > p90) fenton_peso_nacim[n] <- "GEG"

}  # Fin if == FALSE    


remove(esta_fila, este_sexo, esta_semana, este_peso)

} # Fin if |
} # Fin if

} # Fin for n


recat_fenton_peso_nacim <- fenton_peso_nacim

dim(recat_fenton_peso_nacim) <- c(length(recat_fenton_peso_nacim), 1)
colnames(recat_fenton_peso_nacim) <- "recat_fenton_peso_nacim"



# Salida
data_salida <- recat_fenton_peso_nacim


'
