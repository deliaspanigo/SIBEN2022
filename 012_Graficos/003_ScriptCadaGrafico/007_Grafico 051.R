# Grafico 46 - Mini base creada interna

mini2 <- mini


# Nota
# Siben 2021 - 17/05/2022
# La minibase de datos debe contener 4 columnas con datos, pero algunas selecciones
# de paises y hospitales no lo logran.
# Por eso agrego un condicional. Si no lo cumple, otorga un grafico de aviso y una tabla
# de aviso

# Si la minibase tiene 4 columnas, todo OK!
if(ncol(mini) == 4) {
  
v1 <- mini[1] # BASE_MOD[let2num(c("FD"))] (FD) Original
v2 <- mini[3] # BASE_MOD[let2num("GI")]    (AD) Recategoiraza
v3 <- mini[2] # BASE_MOD[let2num("CE")]    (CE) Original
v4 <- mini[4] # BASE_MOD[let2num("FS")]    (E) Recategorizada


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

VR <- mini[,1]
FACTOR <- as.factor(mini[,2])


#################################################################################################
estas_si <- c(3, 6, 7, 8, 9, 10, 11, 12, 13, 14, 16, 17, 18, 19, 20, 21, 23, 24, 26, 
              27, 28, 29, 30, 31, 33, 35)



dt_estas_unidades <- rep(F, length(FACTOR))


for (k in 1:length(estas_si)) {
  
  dt_si <- estas_si[k] == FACTOR
  dt_estas_unidades[dt_si] <- T
  remove(dt_si)
}


VR2 <- VR[dt_estas_unidades]
FACTOR2 <- FACTOR[dt_estas_unidades]
mi.factor <- as.factor(as.character(FACTOR2))
mis_niveles <- levels( mi.factor )
mod1 <- as.numeric(mis_niveles)
mi.factor <- factor( mi.factor, levels = sort( mod1 ) )
# levels( mi.factor ) 
FACTOR2 <- mi.factor
##################################################################################################

mini3 <- as.data.frame(cbind(VR2, as.character(FACTOR2)))
mini4 <- na.omit(mini3)

VR4 <- as.numeric(as.character(mini4[,1]))
FACTOR4 <- mini4[, 2]

mi.factor <- as.factor(as.character(FACTOR4))
mis_niveles <- levels( mi.factor )
mod1 <- as.numeric(mis_niveles)
mi.factor <- factor( mi.factor, levels = sort( mod1 ) )
# levels( mi.factor ) 
FACTOR4 <- mi.factor

#############################################################
minimos <- tapply(VR4, FACTOR4, min)
medianas <- tapply(VR4, FACTOR4, median)
maximos <- tapply(VR4, FACTOR4, max)
cantidad <- tapply(VR4, FACTOR4, length)
tabla_armada <- rbind(minimos, medianas, maximos, cantidad)
rownames(tabla_armada) <- c("Mínimo", "Mediana", "Máximo", "Cantidad de Datos")
tabla_armada <- as.data.frame(tabla_armada)

mi_nombre <- t(as.data.frame(colnames(tabla_armada)))

remove(mi_nombre)

mi_grafico <- '
boxplot(VR4 ~ FACTOR4, las=2, ylab="Días", xlab="Código Unidades",
        range = 0, col = "red", main = titulo_grafico, ylim=c(0,25))
'

tabla_salida <- list(tabla_armada)
names(tabla_salida) <- "Tabla de Medidas Resumen"

}


# Si la minibase no tiene 4 columnas, damos aviso
if(ncol(mini) != 4) {
mi_grafico <- '
      plot(c(0,10), c(0,10), col="white", xlab="", ylab="", axes = F, main=titulo_grafico)
      text(5, 5, "Sin Datos en el subconjunto seleccionado")
      '

tabla_salida <- as.matrix("Para este subconjunto, las cuatro columnas no poseen \n
                          información para realizar el gráfico.", 4, 4)
}
# eval(parse(text= mi_grafico))

