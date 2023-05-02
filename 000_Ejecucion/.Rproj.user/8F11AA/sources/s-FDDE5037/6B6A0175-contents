# Cargamos herramientas
# source("../004_Ejecucion/004_Ejecucion General.R")


# Esta tabla es...
# num_interno_tabla

# input_base <- mini[,c(3,2)]
# 
# mini2 <- mini
# mini <- mini[c(3,1,2)]

tabla_fa <- DF02(mini[c(2,3)])[[3]][[1]]
tabla_p <- DF02(mini[c(2,3)])[[3]][[4]]


# Partes a juntar
tabla1 <- DF01(mini[2])[[1]][,c(1,2)]
tabla2  <- MPP(mini[,c(1,2)])


tabla3 <- MDP(mini[,c(1,2)])
tabla4 <- tabla_FAP(tabla_p, tabla_fa)

tabla_armada1 <- cbind(tabla1, tabla2[3], tabla3[3], tabla4["Vivo"])
rownames(tabla_armada1) <- c(1:nrow(tabla_armada1))

tabla_salida <- list(tabla_armada1)
names(tabla_salida) <- " "


