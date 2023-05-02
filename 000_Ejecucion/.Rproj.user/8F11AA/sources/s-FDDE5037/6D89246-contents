# Cargamos herramientas
# source("../004_Ejecucion/004_Ejecucion General.R")


# Esta tabla es...
# num_interno_tabla


mini2 <- mini[,c(2,1)]

# Partes a juntar
arm_tabla[[num_interno_tabla]][[1]] <- DF02(mini2)[[3]][[4]]
arm_tabla[[num_interno_tabla]][[2]] <- DF02(mini2)[[3]][[1]]


# Armamos la tabla y la asignamos

tabla_fa <- arm_tabla[[num_interno_tabla]][[1]]
tabla_p <- arm_tabla[[num_interno_tabla]][[2]]


tabla_intermedia <- tabla_FAP(tabla_fa, tabla_p)


tabla_intermedia <- cbind(rownames(tabla_intermedia), tabla_intermedia)
colnames(tabla_intermedia)[1] <- "Edad Gestacional"

tabla_intermedia <- tabla_intermedia[,-ncol(tabla_intermedia)]


tabla2 <- table(mini2[1])
tabla2 <- paste0("100%(", tabla2, ")")
dim(tabla2) <- c(length(tabla2), 1)
colnames(tabla2) <- "Total por Fila"

tabla_intermedia <- cbind(as.matrix(tabla_intermedia), tabla2)

tabla_intermedia <- as.data.frame(tabla_intermedia)
rownames(tabla_intermedia) <- c(1:nrow(tabla_intermedia))

# tabla_intermedia <- tabla_intermedia[,c(1,5,4,3,2)]

tabla_salida <- list(tabla_intermedia)
names(tabla_salida) <- " "

