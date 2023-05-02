# Cargamos herramientas
# source("../004_Ejecucion/004_Ejecucion General.R")


# Esta tabla es...
# num_interno_tabla

mini2 <- mini
mini2[,2] <- as.character(mini2[,2])
mini2[,4] <- as.character(mini2[,4])

for ( k in 1:nrow(mini2)) {
  
  if (!is.na(mini2[k,2])) mini2[k,2] <- paste0(mini2[k,2], " Nacimiento")
  
  if (!is.na(mini2[k,4])) mini2[k,4] <- paste0(mini2[k,4], " Alta")  
} 


mini3 <- cbind(c(mini2[,2], mini2[,4]), c(mini2[,1], mini2[,3]))
colnames(mini3) <- c("Grupo", "Valores Z")



mini4 <- na.omit(mini3)
VR <- round2(as.numeric(as.character(mini4[,2])), 2)
FACTOR <- mini4[,1]

en_filas <- c("Mínimo", "Mediana", "Máximo")
en_columnas <- names(table(mini4[,1]))


tabla_intermedia <- matrix(NA, length(en_filas), length(en_columnas))
rownames(tabla_intermedia) <- en_filas
colnames(tabla_intermedia) <- en_columnas

valores_minimos <- tapply(VR, FACTOR, min)
valores_medianas <- tapply(VR, FACTOR, median)
valores_maximos <- tapply(VR, FACTOR, max)


tabla_intermedia[1, ] <- valores_minimos
tabla_intermedia[2, ] <- valores_medianas
tabla_intermedia[3, ] <- valores_maximos

# nuevo_orden <- c(2,1,4,3,6,5,8,7)
# tabla_intermedia <- tabla_intermedia[,nuevo_orden]
tabla_intermedia <- round2(tabla_intermedia, 2)
tabla_intermedia <- as.data.frame(tabla_intermedia)

# tabla_intermedia <- tabla_intermedia[, c(4,3,2,1,6,5,8,7)]

tabla_salida <- list(tabla_intermedia)
names(tabla_salida) <- " "


remove(en_filas, en_columnas, valores_minimos, valores_medianas, valores_maximos)