


input_tabla <- table(mini[,c(2,1)])

frec_abs <- input_tabla

total_col <- colSums(input_tabla)
for(k in 1:ncol(input_tabla)) {
  input_tabla[,k] <- input_tabla[,k]/total_col[k]
  input_tabla[,k] <- round2(input_tabla[,k], 2)
  input_tabla[,k] <- input_tabla[,k]*100
}

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
input_colores <- c("blue",   "orange", "red",    "green",  "yellow", "brown")
at_mod <- c(0, 20, 40, 60, 80, 100)
lab_mod <- paste0(at_mod, "%")
maximo <- max(at_mod)



tabla3 <- as.matrix(tabla3)



###################################


tabla_fusion <- tabla3
for (k in 1:nrow(frec_abs)) {
  
  tabla_fusion[k, ] <- paste0(tabla_fusion[k, ], "%(", frec_abs[k,], ")")
  
}

tabla_salida <- list(tabla_fusion)
names(tabla_salida) <- c("Tabla Combinada")

tabla_texto <- tabla_fusion
tabla_texto <- as.matrix(tabla_texto)
for (k in 1:ncol(tabla_texto)) for(j in 1:nrow(tabla_texto)) if (as.character(tabla_texto[j,k]) == "0") tabla_texto[j,k] <- ""


############################################



dimensiones_x <- NULL
dimensiones_y <- c(-0, maximo)

mi_grafico <- '
valores_x <- barplot(tabla3, col = input_colores, ylim = c(0, maximo),
                      xlim=dimensiones_x,
                      main = titulo_grafico, axes=F, names.arg = rep("", ncol(tabla3)), 
                      ylab="Porcentaje")


axis(2, las = 2, at = at_mod, labels = lab_mod)

text(valores_x, -3.7, srt = 60, adj= 1, xpd = TRUE, labels = colnames(tabla3) , cex=1.2)




for (j in 1:nrow(tabla_texto)) for (k in 1:ncol(tabla_texto)) {

if (!is.nan(tabla6[j,k]))  if (tabla6[j,k] != 0) {
text(valores_x[k], tabla6[j,k], tabla_texto[j,k], col="black")
}
}

# legend("topright", legend = rownames(tabla3), fill = input_colores)


'




mi_grafico2 <- '

plot(c(0,0), col = "white", xlim = dimensiones_x, ylim=dimensiones_y, axes=F,
xlab="", ylab="", main=titulo_grafico)

legend("topright", legend = rownames(tabla3), fill = input_colores)

'


# eval(parse(text= mi_grafico))

