
# Cargamos herramientas
# source("../004_Ejecucion/004_Ejecucion General.R")

# FK-FS-W
# grupo-unidad-W

# mini <- mix_base[[1]]


# mini <- cbind(BasesPristinas[[1]][let2num("W")], BasesPristinas[[4]][let2num(c("E", "AL"))]) 


mini2 <- mini

mini <- mini[,c(3,2,1)]


t1 <- DF01(mini[2])[[1]]

tabla_fa <-  DF02(mini[,c(2,3)])[[3]][[1]]
tabla_p <-  DF02(mini[,c(2,3)])[[3]][[4]]


tabla_intermedia <- tabla_FAP(tabla_p, tabla_fa)

tabla_armada <- cbind(t1[c(1,2)], tabla_intermedia)

tabla_salida <- tabla_armada[,-ncol(tabla_armada)]

tabla_salida <- list(tabla_salida)
names(tabla_salida) <- " "

# rownames(tabla_salida) <- c(1:nrow(tabla_salida))

# tabla_salida
