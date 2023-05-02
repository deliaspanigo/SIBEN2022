


evaluame <- '



ref_fenton_peso  <- BASE_ref_Fenton_Peso

mini <- data.frame(sexo, edad_gestacional_inicial, pesos_inicial)

Z_peso_nacim <- rep(NA, nrow(mini))

# Generacion de los valores Z de peso al nacimiento
for (n in 1:nrow(mini)) {

esta_fila <- mini[n, ]

if (sum(is.na(as.vector(as.matrix(esta_fila)))) == 0) {

este_sexo <- esta_fila[1,1]
esta_edad <- esta_fila[1,2]
este_peso <- esta_fila[1,3]


dt1 <- este_sexo == ref_fenton_peso$Sexo
dt2 <- esta_edad == ref_fenton_peso$`Edad gestacional`
dt3 <- (as.numeric(dt1) + as.numeric(dt2)) == 2

# Si efectivamente encontro algo de referencia en la tabla
# para esa edad gestacional...

if (sum(dt3) > 0) {      
este_orden <- c(1:length(dt3))[dt3]

esta_media <- ref_fenton_peso$Media[este_orden]
este_desvio <- ref_fenton_peso$Desvio[este_orden]

calculo_z <- (este_peso - esta_media)/este_desvio
calculo_z <- round2(calculo_z, 2)


Z_peso_nacim[n] <- calculo_z

} else Z_peso_nacim[n] <- NA

remove(esta_fila, este_sexo, esta_edad, este_peso)

}

} # Fin for n

Z_peso_nacim[Z_peso_nacim > 6] <- 6
Z_peso_nacim[Z_peso_nacim < -6] <- -6

recat_Z_peso_nacim <- Z_peso_nacim

dim(recat_Z_peso_nacim) <- c(length(recat_Z_peso_nacim), 1)
colnames(recat_Z_peso_nacim) <- "recat_Z_peso_nacim"

# Salida
data_salida <- recat_Z_peso_nacim







'






