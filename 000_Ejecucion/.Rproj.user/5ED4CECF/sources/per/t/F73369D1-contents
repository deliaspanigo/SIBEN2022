# Cargamos herramientas
# source("../004_Ejecucion/004_Ejecucion General.R")


# Esta tabla es...
# num_interno_tabla




# Al total
arm_tabla[[num_interno_tabla]][[1]] <- DF01(mini[1])[[1]]
tabla_fa <- arm_tabla[[num_interno_tabla]][[1]][2]
tabla_p <- arm_tabla[[num_interno_tabla]][[1]][6]
#colnames(tabla_p)  <- paste0(colnames(tabla_p), " (%)", sep="")


# Por filas
arm_tabla[[num_interno_tabla]][[2]] <- DF02(mini[c(1,2)])[[3]][[1]]
arm_tabla[[num_interno_tabla]][[3]] <- DF02(mini[c(1,2)], input_decimales = 2)[[3]][[4]]

tabla_fa2 <- arm_tabla[[num_interno_tabla]][[2]]
tabla_p2 <- arm_tabla[[num_interno_tabla]][[3]]
#colnames(tabla_p2)  <- paste0(colnames(tabla_p2), " (%)", sep="")

# Al total
tabla_fa3 <- as.vector(as.matrix(DF01(mini[2])[[1]][2]))
tabla_p3 <- as.vector(as.matrix(DF01(mini[2])[[1]][6]))


parte0 <- rownames(tabla_fa2)
parte1 <- as.character(as.matrix(tabla_FAP(tabla_p3, tabla_fa3)))
parte2 <- tabla_FAP(tabla_p2, tabla_fa2)
parte3 <- paste0("100%", "(", sum(tabla_fa), ")")

fila_agregada <- c(parte1, parte3)

tabla_intermedia <- rbind(as.matrix(parte2), fila_agregada)


rownames(tabla_intermedia)[nrow(tabla_intermedia)] <- "Total"

tabla_intermedia <- as.matrix(tabla_intermedia)



tabla_intermedia <- as.data.frame(tabla_intermedia)
arm_tabla[[num_interno_tabla]][[4]] <- tabla_intermedia

tabla_salida <- arm_tabla[[num_interno_tabla]][[4]]


dt_notratado <- colnames(tabla_salida) == "No tratado"
orden_col <- c(1:ncol(tabla_salida))[dt_notratado]

# SIBEN 2021 - 17 de Junio 2022
# Quite este esta linea!!!
# if (length(orden_col) == 1) tabla_salida <- cbind(tabla_salida[orden_col], tabla_salida[,-orden_col])
tabla_salida <- tabla_salida[orden_col]
#########################################################################################################


tabla_salida <- list(tabla_salida)
names(tabla_salida) <- " "


