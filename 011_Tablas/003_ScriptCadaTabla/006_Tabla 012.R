# Cargamos herramientas
# source("../004_Ejecucion/004_Ejecucion General.R")


# Esta tabla es...
# num_interno_tabla

mini2 <- mini

mini <- mini[,c(ncol(mini), 1:((ncol(mini)-1)))]
# Partes a juntar
for (k in 2:ncol(mini)) arm_tabla[[num_interno_tabla]][[k-1]] <- DF02(mini[c(k,1)], input_aviso = FALSE)[[2]]



tabla_intermedia <- as.data.frame(matrix(NA, (ncol(mini)-1), (ncol(arm_tabla[[num_interno_tabla]][[1]][[1]])+1)))
tabla_intermedia[,1] <- colnames(mini)[-1]

colnames(tabla_intermedia) <- c("Variable",  colnames(arm_tabla[[num_interno_tabla]][[1]][[1]]))

for (k in 1:nrow(tabla_intermedia)) {
  
  porcentaje <- as.vector(as.character(as.matrix(arm_tabla[[num_interno_tabla]][[k]][[4]][2,])))
  fa <-  as.vector(as.character(as.matrix(arm_tabla[[num_interno_tabla]][[k]][[1]][2,])))
  armado <-  paste0(porcentaje, "(", fa, ")", sep="")
  
  tabla_intermedia[k,c(2:(ncol(tabla_intermedia)))] <-  armado
  # tabla7[n,3] <-    as.character(partes[[esta_tabla]][[n]][2,6])
  
}



tabla_salida <- list(tabla_intermedia)
names(tabla_salida) <- " "



