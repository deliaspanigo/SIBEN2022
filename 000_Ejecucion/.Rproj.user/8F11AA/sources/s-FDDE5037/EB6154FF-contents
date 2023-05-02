


# Cargamos herramientas
# source("../004_Ejecucion/004_Ejecucion General.R")


f1 <- paste0(mini[,2], "- Nac")
f2 <- paste0(mini[,4], "- Egreso")
FACTOR <- c(f1, f2)

FACTOR <- as.factor(FACTOR)

orden_nuevo <- c(4, 3, 2, 1, 8,7, 6,5)

FACTOR_MOD <- factor( FACTOR, levels = levels( FACTOR )[ orden_nuevo ] )

FACTOR <- as.factor(FACTOR_MOD)

VR <- c(mini[,1], mini[,3])


minimos <- tapply(VR, FACTOR, min)
medianas <- tapply(VR, FACTOR, median)
maximos <- tapply(VR, FACTOR, max)

tabla_armada <- rbind(minimos, medianas, maximos)
rownames(tabla_armada) <- c("Mínimo", "Mediana", "Máximo")





tabla_salida <- list(tabla_armada)
names(tabla_salida) <- c("Medidas Resumen")

mi_grafico <- '
boxplot(VR ~ FACTOR, las=2, ylab="Valores Z PC", xlab="Categorías Fenton PC", 
        range = 0, col = "red", main = titulo_grafico)
'






# eval(parse(text= mi_grafico))


