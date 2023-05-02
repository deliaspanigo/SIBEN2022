# Cargamos herramientas
# source("../004_Ejecucion/004_Ejecucion General.R")



# mini <- BasesPristinas[[4]][let2num(c("G", "Q"))]



# Esta tabla es...
# num_interno_tabla

mini2 <- na.omit(mini)



# Partes a juntar
arm_tabla[[num_interno_tabla]][[1]] <- DF01(mini2[3])[[1]][2]
arm_tabla[[num_interno_tabla]][[2]] <- MPP(input_base = mini[,c(1,3)], input_general = F)[3]
arm_tabla[[num_interno_tabla]][[3]] <- MDP(mini[,c(1,3)])[3]
arm_tabla[[num_interno_tabla]][[4]] <- DF02(mini[c(3,2)])[[3]][[4]]["Vivo"]
arm_tabla[[num_interno_tabla]][[5]] <- DF02(mini[c(3,2)])[[3]][[1]]["Vivo"]
# arm_tabla[[num_interno_tabla]][[5]] <- DF02(mini[c(3,4)])[[3]][[4]]

tabla01_original <- list2tabla(arm_tabla[[num_interno_tabla]])

colnames(tabla01_original)[4] <- paste0(colnames(tabla01_original)[4], "(%)")
colnames(tabla01_original)[5] <- paste0(colnames(tabla01_original)[5], "(n)")




tabla_salida <- list(tabla01_original)
names(tabla_salida) <- " "

