

evaluame <- '




ref_fenton_pc <- BASE_ref_Fenton_PC

# Las categorias
fenton_PC_nacim <- rep(NA, nrow(BASE_MOD_ORIGINAL))



mini <- data.frame(sexo, edad_gestacional_inicial, PC_inicial)



# Generacion de fenton para perimetro cefalico inicial
for (n in 1:nrow(mini)) {

esta_fila <- mini[n, ]

# Si tiene todos los datos...
if (sum(is.na(as.vector(as.matrix(esta_fila)))) == 0) {

este_sexo <- as.character(esta_fila[1,1])
esta_semana <- esta_fila[1,2]
este_PC <- esta_fila[1,3]

# La semana de gestación puede estar fuera del rango de referencia.
# El rango de referencia puede ser diferente para cada sexo...
# A si que el control está en cada sexo.

# Control para fuera de rango
fuera_de_rango <- FALSE

if(este_sexo == "Femenino" | este_sexo == "Masculino") {

dt_sexo <- este_sexo == ref_fenton_pc$Sexo 
dt_semana <- esta_semana == ref_fenton_pc$`Edad gestacional`

dt_fila <- (as.numeric(dt_sexo) + as.numeric(dt_semana)) == 2  

este_orden <- c(1:nrow(ref_fenton_pc))[dt_fila]

if (length(este_orden) == 1) { 
p3  <- ref_fenton_pc$p3[este_orden]
p10 <- ref_fenton_pc$p10[este_orden]
p90 <- ref_fenton_pc$p90[este_orden]

} else fuera_de_rango <- TRUE



if (fuera_de_rango == FALSE) {
if (este_PC < p3) fenton_PC_nacim[n] <- "PEG SEVERO" else 
if (este_PC >= p3 && este_PC < p10) fenton_PC_nacim[n] <- "PEG" else 
if (este_PC >= p10 && este_PC <= p90) fenton_PC_nacim[n] <- "AEG" else 
if (este_PC > p90) fenton_PC_nacim[n] <- "GEG"

}  # Fin if == FALSE    


remove(esta_fila, este_sexo, esta_semana, este_PC)

} # Fin if |
} # Fin if

} # Fin for n



recat_fenton_PC_nacim <- fenton_PC_nacim

dim(recat_fenton_PC_nacim) <- c(length(recat_fenton_PC_nacim), 1)
colnames(recat_fenton_PC_nacim) <- "recat_fenton_PC_nacim"

# Salida
data_salida <- recat_fenton_PC_nacim






'








