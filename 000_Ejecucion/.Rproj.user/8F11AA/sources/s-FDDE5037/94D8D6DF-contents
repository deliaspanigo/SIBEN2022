# Grafico 46 - Mini base creada interna

mini2 <- mini


v1 <- mini[1] # BASE_MOD[let2num("CO")]      # (CO) Original
v2 <- mini[2] # BASE_MOD[let2num("FL")]      # (G) Recat



VR <- mini[,1]
FACTOR <- as.factor(mini[,2])

#########################################################
tabla_niveles <- table(FACTOR)
niveles_originales <- names(tabla_niveles)
dt_niveles <- tabla_niveles != 0
estos_niveles <- niveles_originales[dt_niveles]

mi.factor <- as.factor(as.character(FACTOR))

mi.factor <- factor( mi.factor, levels = estos_niveles  )

levels( mi.factor )    # a, b, c

FACTOR <- mi.factor

##########################################
minimos <- tapply(VR, FACTOR, min)
medianas <- tapply(VR, FACTOR, median)
maximos <- tapply(VR, FACTOR, max)
cantidad <- as.integer(tapply(VR, FACTOR, length))

tabla_armada <- rbind(minimos, medianas, maximos, cantidad)
rownames(tabla_armada) <- c("Mínimo", "Mediana", "Máximo", "Cantidad")
# tabla_armada <- as.data.frame(tabla_armada)
# mis_nombres <- t(as.data.frame(colnames(tabla_armada)))

maximo_grafico <- max(VR) + 10

mi_grafico <- '
boxplot(VR ~ FACTOR, las=2, ylab="Edad", xlab="Categorías de Peso",
        range = 0, col = "red", main = titulo_grafico, ylim=c(0,maximo_grafico))
'

tabla_salida <- list(tabla_armada)
names(tabla_salida) <- "Tabla de Medidas Resumen"

# eval(parse(text= mi_grafico))

