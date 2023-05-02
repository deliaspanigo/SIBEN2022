
  
  
  
  # Grafico 46 - Mini base creada interna
  
  parte1 <- BASE_MOD_RECAT[, let2num("G")]
  guardo_niveles1 <- levels(parte1)
  
  
  
  #######################################################################################
  # Siben 2020
  # mis_columnas_ipt <- c("W", "AH", "AS", "BD", "BO", "BZ", "CK", "CV", "DG", "DR")
  
  # Siben 2021 - 17/05/2022
  mis_columnas_ipt <- c("W", "AH", "AS", "BD", "BO", "BZ", "CK", "CV", "DG")
  #######################################################################################

  
  parte2 <- BASE_MOD_IPT[let2num(mis_columnas_ipt)]
  guardo_niveles2 <- levels(parte2[,1])
  
  mini <- cbind(parte1, parte2)
  
  aislado1 <- rep(as.vector(as.matrix(parte1)), ncol(parte2))
  aislado1 <- factor(aislado1, levels = guardo_niveles1)
  
  for (k in 1:ncol(parte2)) {
    if (k == 1) aislado2 <- as.vector(as.matrix(parte2[k])) else aislado2 <- c(aislado2, as.vector(as.matrix(parte2[k])))
  }
  
  aislado2 <- factor(aislado2, levels = guardo_niveles2)
  
  dim(aislado1) <- c(length(aislado1), 1)
  dim(aislado2) <- c(length(aislado2), 1)
  
  mini <- as.data.frame(matrix(NA, nrow(aislado1)), 2)
  mini[1] <- aislado1
  mini[2] <- aislado2
  #mini <- cbind(aislado1, aislado2)
  
  
  
  
  
  
  


if (nrow(na.omit(mini)) > 0 ){


# input_tabla <- table(mini)
  input_tabla <- table(mini[,c(2,1)])
#   input_tabla <- input_tabla[,guardo_niveles]
  # input_tabla <- input_tabla_original[2,]
  # dim(input_tabla) <- c(1, length(input_tabla))
  # rownames(input_tabla) <- rownames(input_tabla_original)[2]

  tabla_intermedia <- matrix(NA, nrow(input_tabla), ncol(input_tabla))
  for (k in 1:ncol(input_tabla)) for(j in 1:nrow(input_tabla)) tabla_intermedia[j,k] <- input_tabla[j,k] 
  colnames(tabla_intermedia) <- colnames(input_tabla)
  rownames(tabla_intermedia) <- rownames(input_tabla)
  
tabla_fa <- tabla_intermedia
input_tabla <- tabla_fa

total_col <- colSums(input_tabla)
for(k in 1:ncol(input_tabla)) {
  input_tabla[,k] <- input_tabla[,k]/total_col[k]
  input_tabla[,k] <- round2(input_tabla[,k], 2)
  input_tabla[,k] <- input_tabla[,k]*100
}

for (k in 1:ncol(input_tabla)) for(j in 1:nrow(input_tabla)) if (is.nan(input_tabla[j,k])) input_tabla[j,k] <- 0 
tabla_p <- input_tabla

for (k in 1:ncol(tabla_p)) for(j in 1:nrow(tabla_p)) tabla_p[j,k] <- paste0(tabla_p[j,k], "%")

tabla_armada <- tabla_FAP(tabla_p, tabla_fa)

# input_tabla <- input_tabla[c(3,1,2), ]
###########################################################################################

tabla3 <- input_tabla


tabla4 <- round2(tabla3/2, 0)

tabla5 <- tabla3
for (j in 1:ncol(tabla5)) tabla5[,j] <- cumsum(tabla5[,j])

tabla6 <- tabla5 - tabla4

tabla_texto <- tabla3
tabla_texto <- as.matrix(tabla_texto)
for (k in 1:ncol(tabla_texto)) for(j in 1:nrow(tabla_texto)) if (as.character(tabla_texto[j,k]) == "0") tabla_texto[j,k] <- "" 



##########################################################################################
input_colores <- c("red", "blue", "orange")
at_mod <- c(0, 20, 40, 60, 80, 100)
lab_mod <- paste0(at_mod, "%")
maximo <- max(at_mod)

tabla_salida <- list(tabla_fa, tabla_p, tabla_armada)
names(tabla_salida) <- c("Tabla de Frecuencias Absolutas", "Tabla de Porcentajes por Columnas", "Tabla Combinada")
tabla3 <- as.matrix(tabla3)


# tabla4 <- tabla3[3,]
tabla4 <- tabla3


mi_grafico <- '
valores_x <- barplot(tabla4, col = input_colores, ylim=c(-20, maximo),
#xlim=c(0,50),
main = titulo_grafico, axes=F, names.arg = rep("", ncol(tabla4)), 
ylab="Porcentaje", beside = T)


axis(2, las = 2, at = at_mod, labels = lab_mod)

text(valores_x[2,], -3.7, srt = 60, adj= 1, xpd = TRUE, labels = colnames(tabla3) , cex=1.2)



if (1 == 2) {
for (j in 1:nrow(tabla_texto)) for (k in 1:ncol(tabla_texto)) {

if (!is.nan(tabla6[j,k]))  if (tabla6[j,k] != 0) {
text(valores_x[k], tabla6[j,k], tabla_texto[j,k], col="black")
}
}

}
#legend("topright", legend = rownames(tabla3), fill = input_colores)


'

} else {
  
  mi_grafico <- grafico_sin_datos
  tabla_salida <- tabla_ayuda
}


# eval(parse(text= mi_grafico))





mi_grafico2 <- '

plot(c(0,0), col = "white", xlim = dimensiones_x, ylim=dimensiones_y, axes=F,
xlab="", ylab="", main=titulo_grafico)
legend("topright", legend = rownames(tabla3), fill = input_colores)

'

