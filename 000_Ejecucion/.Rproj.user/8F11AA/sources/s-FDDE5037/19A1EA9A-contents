# Cargamos herramientas
# source("../004_Ejecucion/004_Ejecucion General.R")


# Esta tabla es...
# num_interno_tabla


# Partes a juntar
arm_tabla[[num_interno_tabla]][[1]] <- DF01(mini[1])[[1]]
arm_tabla[[num_interno_tabla]][[2]] <- DF01(mini[2])[[1]]
arm_tabla[[num_interno_tabla]][[3]] <- DF01(mini[3])[[1]]


tabla_salida <- matrix(NA, 3, 3)
tabla_salida[,1] <- colnames(mini)
for (k in 1:length(arm_tabla[[num_interno_tabla]])) {
  
  armado <- paste0(arm_tabla[[num_interno_tabla]][[k]][,2], "(", arm_tabla[[num_interno_tabla]][[k]][,6], ")")  
  tabla_salida[k, c(2:ncol(tabla_salida))] <- armado
}

colnames(tabla_salida) <- c("Apgar", rownames(arm_tabla[[num_interno_tabla]][[1]]))
rownames(tabla_salida) <- c(1:nrow(tabla_salida))


tabla_salida <- as.data.frame(tabla_salida)

tabla_salida <- list(tabla_salida)
names(tabla_salida) <- " "