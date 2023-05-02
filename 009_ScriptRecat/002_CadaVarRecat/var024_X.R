


evaluame <- '


ref_fenton_pc <- BASE_ref_Fenton_PC


Z_PC_egreso <- rep(NA, nrow(BASE_MOD_ORIGINAL))



mini <- data.frame(sexo, edad_gestacional_final, PC_final)




# Generacion de los valores Z de PC al alta
for (n in 1:nrow(mini)) {

esta_fila <- mini[n, ]

if (sum(is.na(as.vector(as.matrix(esta_fila)))) == 0) {

este_sexo <- esta_fila[1,1]
esta_edad <- esta_fila[1,2]
este_pc <- esta_fila[1,3]


dt1 <- este_sexo == ref_fenton_pc$Sexo
dt2 <- esta_edad == ref_fenton_pc$`Edad gestacional`
dt3 <- (as.numeric(dt1) + as.numeric(dt2)) == 2

# Si efectivamente encontro algo de referencia en la tabla
# para esa edad gestacional...

if (sum(dt3) > 0) {      
este_orden <- c(1:length(dt3))[dt3]

esta_media <- ref_fenton_pc$Media[este_orden]
este_desvio <- ref_fenton_pc$Desvio[este_orden]

calculo_z <- (este_pc - esta_media)/este_desvio
calculo_z <- round2(calculo_z, 2)


Z_PC_egreso[n] <- calculo_z

} else Z_PC_egreso[n] <- NA

remove(esta_fila, este_sexo, esta_edad, este_pc)

}

} # Fin for n




Z_PC_egreso[Z_PC_egreso > 6] <- 6
Z_PC_egreso[Z_PC_egreso < -6] <- -6


recat_Z_PC_egreso <- Z_PC_egreso

dim(recat_Z_PC_egreso) <- c(length(recat_Z_PC_egreso), 1)
colnames(recat_Z_PC_egreso) <- "recat_Z_PC_egreso"

# Salida
data_salida <- recat_Z_PC_egreso



'
