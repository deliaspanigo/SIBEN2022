


# Cargamos herramientas
# source("../004_Ejecucion/004_Ejecucion General.R")

cambio <- mini

colnames(cambio)
cambio[,1] <- paste0(cambio[,1], "- Nac")
cambio[,2] <- paste0(cambio[,2], "- Alta")

tabla1 <- table(cambio[,1])
tabla2 <- table(cambio)

orden_nombres <- rep(NA, 8)
orden_nombres[c(1,3,5,7)] <- rownames(tabla2)
orden_nombres[c(2,4,6,8)] <- colnames(tabla2)

tabla3 <- matrix(0,8,8)
colnames(tabla3) <- orden_nombres
rownames(tabla3) <- orden_nombres

tabla3[1,1] <- tabla1[1]
tabla3[3,3] <- tabla1[2]
tabla3[5,5] <- tabla1[3]
tabla3[7,7] <- tabla1[4]

tabla3[c(2,4,6,8), 2] <- tabla2[1,]
tabla3[c(2,4,6,8), 4] <- tabla2[2,]
tabla3[c(2,4,6,8), 6] <- tabla2[3,]
tabla3[c(2,4,6,8), 8] <- tabla2[4,]
maximo <- max(tabla3) + 200

tabla4 <- round2(tabla3/2, 0)
tabla5 <- tabla3
tabla6 <- tabla3
for (j in 1:ncol(tabla6)) tabla6[,j] <- cumsum(tabla6[,j])

tabla7 <- tabla6
for (j in 1:nrow(tabla7)) for (k in 1:ncol(tabla7)) {
  
  if (tabla4[j,k] == 0) tabla7[j,k] <- 0
}


tabla8 <- tabla6
estas_columnas1 <- c(1,3,5,7)
tabla8[, estas_columnas1] <- tabla4[, estas_columnas1]

estas_columnas2 <- c(2,4,6,8)

for (k in 1:length(estas_columnas2)) {
  
  columna_elegida <- as.vector(as.matrix(tabla8[, estas_columnas2[k]]))
  cambiaso <- rep(0, length(columna_elegida))
  
  for (j in 1:(length(columna_elegida)-1)) {
   
    dato1 <-  columna_elegida[j]
    dato2 <-  columna_elegida[j+1]
    
    if (dato1 == dato2) cambiaso[j+1] <- 0 else cambiaso[j+1] <- round2((columna_elegida[j] + columna_elegida[j+1])/2, 0) 
  }
   
  tabla8[,estas_columnas2[k]] <- cambiaso
   
  }
  
inscriptos <- tabla3
total_columnas <- colSums(tabla3)
for(llave1 in 1:ncol(inscriptos)) inscriptos[,llave1] <-  paste0(round2(tabla3[,llave1]/total_columnas[llave1], 2)*100, "%", "(", tabla3[,llave1], ")")

#                   OK       OK      OK         OK       OK    OK      OK       OK
input_colores <- c("blue", "blue", "orange", "orange", "red", "red", "green", "green")

mi_grafico <- '
valores_x <- barplot(tabla3, las=2, col = input_colores, ylim=c(-250, 600), 
                      main = titulo_grafico, axes=F, names.arg = rep("", ncol(tabla3)))

axis(2, las=2)


text(valores_x, -10.7, srt = 60, adj= 1, xpd = TRUE, labels = colnames(tabla3) , cex=1.2)

legend("topright", 
       legend = names(table(cambio[,1])), 
       fill = input_colores[c(1,3,5,7)])


for (j in 1:nrow(tabla8)) for (k in 1:ncol(tabla8)) {

if (tabla8[j,k] != 0) {
text(valores_x[k], tabla8[j,k], inscriptos[j,k], col="black")
}
}
'

tabla_salida <- list(tabla3)
names(tabla_salida) <- c("Tabla de Frecuencias Absolutas")


# eval(parse(text= mi_grafico))


