

# Tabla de Frecuencias
input_tabla_fa <- table(mini)

# Cantidad Maxima de filas
cantidad_filas <- 6

# Vemos el numero de pacientes en cada fila haciendo
# una suma por fila
dt_3 <- order(rowSums(input_tabla_fa), decreasing = T)

# Si supera el maximo de filas...
# Solo nos vamos a quedar con las filas que tienen mas pacientes...
if(nrow(input_tabla_fa) > cantidad_filas) {
dt_3_mod <- dt_3[c(1:cantidad_filas)]

input_tabla_fa <- input_tabla_fa[dt_3_mod, ]
}


# Siben 2021
total_col <- colSums(input_tabla_fa)


input_tabla_p <- input_tabla_fa

for(k in 1:ncol(input_tabla_p)) {
  input_tabla_p[,k] <- input_tabla_fa[,k]/total_col[k]
  input_tabla_p[,k] <- round2(input_tabla_p[,k], 2)
  input_tabla_p[,k] <- input_tabla_p[,k]*100
}

###########################################################################################

# Tabla
tabla3 <- input_tabla_p

# Los rotulos de porcentaje van a una altura que es la mitad de la frecuencia de la categoria.
tabla4 <- round2(tabla3/2, 0)

# Sumas acumuladas por columna...
tabla5 <- tabla3
for (j in 1:ncol(tabla5)) tabla5[,j] <- cumsum(tabla3[,j])

# Obtenemos la posicion en que van a ir los rotulos
tabla6 <- tabla5 - tabla4

# Cambiamos la tabla para presentarla en el Excel.
tabla_texto <- tabla3
tabla_texto <- as.matrix(tabla_texto)
# for (k in 1:ncol(tabla_texto)) for(j in 1:nrow(tabla_texto)) if (is.na(as.character(tabla_texto[j,k]))) tabla_texto[j,k] <- ""
for (k in 1:ncol(tabla_texto)) for(j in 1:nrow(tabla_texto)) if (as.character(tabla_texto[j,k]) == "0") tabla_texto[j,k] <- ""
for (k in 1:ncol(tabla_texto)) for(j in 1:nrow(tabla_texto)) if (as.character(tabla_texto[j,k]) == "0") tabla_texto[j,k] <- ""
for (k in 1:ncol(tabla_texto)) for(j in 1:nrow(tabla_texto)) if (as.character(tabla_texto[j,k]) == "NaN") tabla_texto[j,k] <- ""

###############
inscriptos <- tabla3
total_columnas <- colSums(tabla3)
for(llave1 in 1:ncol(inscriptos)) inscriptos[,llave1] <-  paste0(round2(tabla3[,llave1]/total_columnas[llave1], 2)*100, "%", "(", input_tabla_fa[,llave1], ")")


##########################################################################################
input_colores <- c("blue",   "orange", "red",    "green",  "yellow", "brown")
at_mod <- c(0, 20, 40, 60, 80, 100)
lab_mod <- paste0(at_mod, "%")
maximo <- max(at_mod)

tabla_salida <- list(input_tabla_fa, tabla3, inscriptos)
names(tabla_salida) <- c("Tabla de Frecuencias", "Tabla de Porcentajes por Columnas", "Tabla Combinada")

tabla3 <- as.matrix(tabla3)

dimensiones_x <- NULL
dimensiones_y <- c(-12, maximo)

mi_grafico <- '
valores_x <- barplot(tabla3, col = input_colores, ylim = dimensiones_y,
xlim = dimensiones_x,
main = titulo_grafico, axes=F, names.arg = rep("", ncol(tabla3)), 
ylab="Porcentaje")


axis(2, las = 2, at = at_mod, labels = lab_mod)

text(valores_x, -3.7, srt = 60, adj= 1, xpd = TRUE, labels = colnames(tabla3) , cex=1.2)




for (j in 1:nrow(tabla_texto)) for (k in 1:ncol(tabla_texto)) {

if (!is.nan(tabla6[j,k])) if (tabla6[j,k] != 0) if (inscriptos[j,k] != "NaN%(0)" && inscriptos[j,k] != "0%(0)") {
text(valores_x[k], tabla6[j,k], inscriptos[j,k], col="black")
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
# eval(parse(text= mi_grafico2))
