

# En los CF “si”, minimo, máximo y mediana de CG, por FS

# estas_columnas <- c("FS", "CG", "CF")


#mini <- BASE_MOD[,let2num(estas_columnas)]
#mini <- na.omit(mini)


mini2 <- mini

# mini <- mini[,c(2,1)]


mini4 <- mini



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

tabla_salida <- tabla_intermedia
tabla_salida <- list(tabla_salida)
names(tabla_salida) <- " "


remove(en_filas, en_columnas, valores_minimos, valores_medianas, valores_maximos)