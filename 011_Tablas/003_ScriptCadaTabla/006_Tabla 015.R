# Cargamos herramientas
# source("../004_Ejecucion/004_Ejecucion General.R")


# Esta tabla es...
# num_interno_tabla



# Al total
arm_tabla[[num_interno_tabla]][[1]] <- DF01(mini[1])[[1]]
tabla_fa <- arm_tabla[[num_interno_tabla]][[1]][2]
tabla_p <- arm_tabla[[num_interno_tabla]][[1]][6]
#colnames(tabla_p)  <- paste0(colnames(tabla_p), " (%)", sep="")


# Por columnas
arm_tabla[[num_interno_tabla]][[2]] <- DF02(mini[c(1,2)])[[4]][[1]]
arm_tabla[[num_interno_tabla]][[3]] <- DF02(mini[c(1,2)], input_decimales = 2)[[4]][[4]]

tabla_fa2 <- arm_tabla[[num_interno_tabla]][[2]]
tabla_p2 <- arm_tabla[[num_interno_tabla]][[3]]
#colnames(tabla_p2)  <- paste0(colnames(tabla_p2), " (%)", sep="")

parte0 <- rownames(tabla_fa2)
parte1 <- as.character(as.matrix(tabla_FAP(tabla_p, tabla_fa)))
parte2 <- tabla_FAP(tabla_p2, tabla_fa2)
parte3 <- paste0("100%", "(", sum(tabla_fa), ")")

tabla_intermedia <- cbind(parte2, c(parte1, parte3))
colnames(tabla_intermedia)[ncol(tabla_intermedia)] <- "Total"
rownames(tabla_intermedia)[nrow(tabla_intermedia)] <- "Total"


arm_tabla[[num_interno_tabla]][[4]] <- tabla_intermedia

tabla_salida <- arm_tabla[[num_interno_tabla]][[4]]




tabla_salida <- list(tabla_salida)
names(tabla_salida) <- " "
