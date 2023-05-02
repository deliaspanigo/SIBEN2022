


mini2 <- mini
# v1 <- BASE_MOD[let2num(c("FD"))]
# v2 <- BASE_MOD[let2num("GI")]
# v3 <- BASE_MOD[let2num("CO")]
# v4 <- BASE_MOD[let2num("FL")]

v1 <- mini[1]
v2 <- mini[4]
v3 <- mini[2]
v4 <- mini[3]

mini <- cbind(v1, v2, v3, v4)

# table(v1, v2)

dt_v1 <- v1 == "Vivo"
dt_v1[is.na(dt_v1)] <- FALSE

dt_v2 <- !(v2 == "Grupo 1")
dt_v2[is.na(dt_v2)] <- FALSE

dt_general <- dt_v1
dt_general[dt_v2] <- TRUE


mini <- mini[dt_general, ]



mini <- data.frame(mini)

mini <- mini[,c(3,4)]

mini <- na.omit(mini)

VR <- mini[,1]
FACTOR <- as.factor(mini[,2])


minimos <- tapply(VR, FACTOR, min)
medianas <- tapply(VR, FACTOR, median)
maximos <- tapply(VR, FACTOR, max)

tabla_armada <- rbind(minimos, medianas, maximos)
rownames(tabla_armada) <- c("Mínimo", "Mediana", "Máximo")

tabla_salida <- tabla_armada
tabla_salida <- list(tabla_salida)
names(tabla_salida) <- " "
