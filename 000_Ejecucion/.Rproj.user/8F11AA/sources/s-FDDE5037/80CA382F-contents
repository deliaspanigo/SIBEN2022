# Cargamos herramientas
# source("../004_Ejecucion/004_Ejecucion General.R")


# Esta tabla es...
# num_interno_tabla


# Partes a juntar
arm_tabla[[num_interno_tabla]][[1]] <- DF01(mini[1])[[1]]


tabla_intermedia <- matrix(NA, nrow(arm_tabla[[num_interno_tabla]][[1]]), 2)
tabla_intermedia[,1] <- as.character(arm_tabla[[num_interno_tabla]][[1]][,1])

armado <- paste0(arm_tabla[[num_interno_tabla]][[1]][,6], "(", arm_tabla[[num_interno_tabla]][[1]][,2], ")")  
tabla_intermedia[, 2] <- armado

colnames(tabla_intermedia) <- c(colnames(mini)[1], "Detalle")

tabla_salida <- list(tabla_intermedia)
names(tabla_salida) <- " "

arm_tabla[[num_interno_tabla]][[2]] <- tabla_salida