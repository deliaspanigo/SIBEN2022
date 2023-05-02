

# Grafico 44 - Mini base creada interna

mini2 <- mini

# Cambio del orden de las variables...

v1 <- mini[1] # BASE_MOD[let2num("GL")]
v2 <- mini[3] # BASE_IPT[let2num("C")]
v3 <- mini[2] # BASE_MOD[let2num("FL")]

mini <- cbind(v1, v2, v3)
mini <- na.omit(mini)

dt_v1 <- v1 == "Si"
dt_v1[is.na(dt_v1)] <- FALSE

mini <- mini[dt_v1, ]

mini <- mini[,c(2,3)]







input_tabla <- table(mini)
tabla_fa <- input_tabla 

total_col <- colSums(input_tabla)
for(k in 1:ncol(input_tabla)) {
  input_tabla[,k] <- input_tabla[,k]/total_col[k]
  input_tabla[,k] <- round2(input_tabla[,k], 2)
  input_tabla[,k] <- input_tabla[,k]*100
}

input_tabla <- input_tabla[c(3,1,2), ]
###########################################################################################

tabla3 <- input_tabla

tabla3_mod <- tabla3
for(filitas in 1:nrow(tabla3_mod)) for (columnitas in 1:ncol(tabla3_mod)){
  
  tabla3_mod[filitas, columnitas] <- paste0(tabla3_mod[filitas, columnitas], "%")
} 

tabla4 <- round2(tabla3/2, 0)

tabla5 <- tabla3
for (j in 1:ncol(tabla5)) tabla5[,j] <- cumsum(tabla5[,j])

tabla6 <- tabla5 - tabla4

tabla_texto <- tabla3
tabla_texto <- as.matrix(tabla_texto)
for (k in 1:ncol(tabla_texto)) for(j in 1:nrow(tabla_texto)) if (as.character(tabla_texto[j,k]) == "0") tabla_texto[j,k] <- ""




##########################################################################################
input_colores <- c("blue",   "orange", "red")
at_mod <- c(0, 20, 40, 60, 80, 100)
lab_mod <- paste0(at_mod, "%")
maximo <- max(at_mod)

tabla_salida <- list(tabla_fa, tabla3_mod)
names(tabla_salida) <- c("Tabla de Frecuencias Absolutas", "Tabla de Porcentajes por Columnas")

tabla3 <- as.matrix(tabla3)



mi_grafico <- '
valores_x <- barplot(tabla3, col = input_colores, ylim=c(-20, maximo),
xlim=c(0,50),
main = titulo_grafico, axes=F, names.arg = rep("", ncol(tabla3)), 
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
legend("topright", legend = rownames(tabla3), fill = input_colores)


'


# eval(parse(text= mi_grafico))

