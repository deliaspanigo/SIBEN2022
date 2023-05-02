
# Cargamos herramientas
# source("../004_Ejecucion/004_Ejecucion General.R")



# mini <- cbind(BasesPristinas[[1]][let2num(c("B", "AT"))], BasesPristinas[[4]][let2num(c("G", "Q"))]) 



mini2 <- mini

# mini <- mini[,c(3,1,2,4)]

mini <- na.omit(mini)



# table(mini[,3])


# Esta tabla es...
# num_interno_tabla

input_base <- mini[,c(2,1)]

# Partes a juntar
arm_tabla[[num_interno_tabla]][[1]] <- DF01(mini[3])[[1]]
arm_tabla[[num_interno_tabla]][[2]] <- MPP(input_base = mini[,c(1,3)], input_general = F)[3]
arm_tabla[[num_interno_tabla]][[3]] <- MDP(mini[,c(1,3)])[3]
arm_tabla[[num_interno_tabla]][[4]] <- DF02(mini[c(3,2)])[[3]][[4]]
arm_tabla[[num_interno_tabla]][[5]] <- DF02(mini[c(3,4)])[[3]][[4]]

tabla01_original <- list2tabla(arm_tabla[[num_interno_tabla]])

# sub_seleccion <- c(1,2,6,7,8,10,11,16,15,14,13)
# tabla01 <- tabla01_original[,sub_seleccion]
tabla01 <- tabla01_original
rownames(tabla01) <- c(1:nrow(tabla01))

tabla_salida <- list(tabla01)
names(tabla_salida) <- " "




# tabla_salida
