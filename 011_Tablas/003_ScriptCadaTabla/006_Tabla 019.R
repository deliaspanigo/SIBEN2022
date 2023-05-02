# Cargamos herramientas
# source("../004_Ejecucion/004_Ejecucion General.R")


# Esta tabla es...
# num_interno_tabla


tabla_fa <- table(mini)

# # #SIBEN 2020
# Estas sentencias fueron muteadas
# if(colnames(tabla_fa)[1] == "Sin Ecografía") tabla_fa <- tabla_fa[,-1]
# tabla_fa <- tabla_fa[,c(1,3,4,5,6,2)]
#################################################################################

# # #SIBEN 2021 - 25 de Mayo 2022
dt_quitar <- colnames(tabla_fa) == "Sin Ecografía"
tabla_fa <- tabla_fa[,!dt_quitar]
#################################################################################


total_columnas <- colSums(tabla_fa)
total_filas <- rowSums(tabla_fa)
                          
tabla_p <- tabla_fa
for(llave1 in 1:nrow(tabla_p)) {
  for(llave2 in 1:ncol(tabla_p)) {
  
    cociente <- tabla_fa[llave1, llave2]/total_filas[llave1]
    cociente <- round2(cociente, 3)
    cociente <- cociente*100
    
    if(is.nan(cociente)) cociente <- 0
    cociente <- paste0(cociente, "%")
    tabla_p[llave1, llave2] <- cociente
    remove(cociente)
  } # Fin for llave1
} # Fin for llave2


tabla_fusion <- tabla_p
for(llave1 in 1:nrow(tabla_p)) {
  for(llave2 in 1:ncol(tabla_p)) {
    tabla_fusion[llave1, llave2] <- paste0(tabla_fusion[llave1, llave2], "(", tabla_fa[llave1, llave2], ")")
  }
}

############################
total_filas_fa <- rowSums(tabla_fa)
total_general <- sum(total_filas_fa)
total_filas_p <- paste0(round2(total_filas_fa/total_general, 2)*100, "%")
total_filas_fusion <- paste0(total_filas_p, "(", total_filas_fa, ")")
dim(total_filas_fusion) <- c(length(total_filas_fusion), 1)
colnames(total_filas_fusion) <- "Total"


total_columnas_fa <- colSums(tabla_fa)
total_general <- sum(total_columnas_fa)
total_columnas_p <- paste0(round2(total_columnas_fa/total_general, 2)*100, "%")
total_columnas_fusion <- paste0(total_columnas_p, "(", total_columnas_fa, ")")

total_general_fusion <- paste0("100%", "(", total_general, ")")
total_columnas_fusion <- c(total_columnas_fusion, total_general_fusion)

dim(total_columnas_fusion) <- c(1, length(total_columnas_fusion))
rownames(total_columnas_fusion) <- "Total"


tabla_fusion <- cbind(tabla_fusion, total_filas_fusion)
tabla_fusion <- rbind(tabla_fusion, total_columnas_fusion)

tabla_fusion <- as.data.frame(as.matrix(tabla_fusion))
tabla_fa <- as.data.frame(as.matrix(tabla_fa))
tabla_p <-  as.data.frame(as.matrix(tabla_p))
###############################

tabla_salida <- list(tabla_fusion)
names(tabla_salida) <- c("Tabla Combinada")
# names(tabla_salida) <- c("Tabla Combinada", "Tabla de Frecuencias Absolutas", "Tabla de Porcentajes")

