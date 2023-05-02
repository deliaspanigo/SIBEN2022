# Cargamos herramientas
# source("../004_Ejecucion/004_Ejecucion General.R")


# Esta tabla es...
# num_interno_tabla


# Partes a juntar
for (k in 1:ncol(mini)) {
  arm_tabla[[num_interno_tabla]][[k]] <- DF01(mini[k])[[1]]
}

tabla_intermedia <- matrix(NA, ncol(mini), 2 )
rownames(tabla_intermedia) <- colnames(mini)
colnames(tabla_intermedia) <- c("No", "Si")

for (k in 1:nrow(tabla_intermedia)) {

  armado_no <- paste0(arm_tabla[[num_interno_tabla]][[k]][1,6], "(", arm_tabla[[num_interno_tabla]][[k]][1,2], ")")
  armado_si <- paste0(arm_tabla[[num_interno_tabla]][[k]][2,6], "(", arm_tabla[[num_interno_tabla]][[k]][2,2], ")")

    

  tabla_intermedia[k, 1] <- armado_no
  tabla_intermedia[k, 2] <- armado_si
  

}

arm_tabla[[num_interno_tabla]][[k + 1]] <- tabla_intermedia

tabla_salida <- arm_tabla[[num_interno_tabla]][[k + 1]]

tabla_salida <- list(tabla_salida)
names(tabla_salida) <- " "

remove(tabla_intermedia)

