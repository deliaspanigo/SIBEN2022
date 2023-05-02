# Cargamos herramientas
# source("../004_Ejecucion/004_Ejecucion General.R")


# Esta tabla es...
# num_interno_tabla


# 
# 
# # Unidades (FS) *****
# # eco2 (FT) *****
# # Grados (CU)
# # Categorizacion de grados (GH)
# 
# unidades <- BASE_MOD[, let2num("FS")]
# 
# estas_columnas <- c("FS", "FT", "CU", "GH")
# base <- BASE_MOD[, let2num(estas_columnas)]
# 
# 
# # Relacion entre los grados y cat_grados
# base1 <- base[,c(1,2)]
# nrow(na.omit(base1))
# table(base1)
# 
# base2 <- base[,c(1,4)]
# table(base2)
# nrow(na.omit(base2))
# table(base2)




# Al total
arm_tabla[[num_interno_tabla]][[1]] <- DF01(mini[1])[[1]]
tabla_fa <- arm_tabla[[num_interno_tabla]][[1]][2]
tabla_p <- arm_tabla[[num_interno_tabla]][[1]][6]
#colnames(tabla_p)  <- paste0(colnames(tabla_p), " (%)", sep="")


# Por columnas
arm_tabla[[num_interno_tabla]][[2]] <- DF02(mini[c(1,2)])[[3]][[1]]
arm_tabla[[num_interno_tabla]][[3]] <- DF02(mini[c(1,2)], input_decimales = 2)[[3]][[4]]

tabla_fa2 <- arm_tabla[[num_interno_tabla]][[2]]
tabla_p2 <- arm_tabla[[num_interno_tabla]][[3]]
#colnames(tabla_p2)  <- paste0(colnames(tabla_p2), " (%)", sep="")

parte0 <- rownames(tabla_fa2)
parte1 <- as.character(as.matrix(tabla_FAP(tabla_p, tabla_fa)))
parte2 <- tabla_FAP(tabla_p2, tabla_fa2)

# parte3 <- paste0("100%", "(", sum(tabla_fa), ")")

#tabla_intermedia <- cbind(parte2, c(parte1, parte3))
#colnames(tabla_intermedia)[ncol(tabla_intermedia)] <- "Total"

tabla_intermedia <- parte2

arm_tabla[[num_interno_tabla]][[4]] <- tabla_intermedia

tabla_salida <- arm_tabla[[num_interno_tabla]][[4]]


tabla_salida <- list(tabla_salida)
names(tabla_salida) <- " "

