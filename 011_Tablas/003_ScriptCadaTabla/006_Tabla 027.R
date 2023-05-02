# # Cargamos herramientas
# # source("../004_Ejecucion/004_Ejecucion General.R")
# 
# 
# # Esta tabla es...
# # num_interno_tabla
# 
# 
# 
# 
# Al total
arm_tabla[[num_interno_tabla]][[1]] <- DF01(mini[1])[[1]]
tabla_fa <- arm_tabla[[num_interno_tabla]][[1]][2]
tabla_p <- arm_tabla[[num_interno_tabla]][[1]][6]
colnames(tabla_p)  <- paste0(colnames(tabla_p), " (%)", sep="")


tabla_intermedia <- tabla_FAP(tabla_p, tabla_fa)
tabla_intermedia <- cbind(rownames(tabla_intermedia), tabla_intermedia)
colnames(tabla_intermedia)[1] <- c("Causas de Muerte")
rownames(tabla_intermedia) <- c(1:nrow(tabla_intermedia))
arm_tabla[[num_interno_tabla]][[2]] <- tabla_intermedia

tabla_salida <- arm_tabla[[num_interno_tabla]][[2]]

###########################################################
# Siben 2020
# orden_nuevo <- order(tabla_fa, decreasing=T)

# Siben 2021 - 17/05/2022
orden_nuevo <- order(tabla_fa[,1], decreasing=T)
######################################################

tabla_salida <- tabla_salida[orden_nuevo, ]




tabla_salida <- list(tabla_salida)
names(tabla_salida) <- " "
