



input_tabla <- DF01(mini)[[1]]
input_armado <- armado.graf.tortas(input_tabla)
input_detalle <- 4
input_referencia <- 1
input_colores <- c("blue", "orange", "red", "green", "yellow")
input_main <- titulo_grafico


tabla_salida <- list(input_tabla)
names(tabla_salida) <- "Tabla de Distribución de Frecuencias"

frecuencias <- input_tabla[,2]
names(frecuencias) <- input_armado[[input_detalle]]

tabla_fa <- input_tabla[,2]
names(tabla_fa) <- rownames(input_tabla)

tabla_fr <- input_tabla[,5]
names(tabla_fr) <- rownames(input_tabla)

tabla_p <- as.character(input_tabla[,6])
names(tabla_p) <- rownames(input_tabla)

tabla_armada <- tabla_FAP(tabla_p, tabla_fa)


valores_porcentajes <- as.character(as.vector(as.matrix(tabla_p)))

for (k in 1:length(valores_porcentajes)) valores_porcentajes[k] <- strsplit(valores_porcentajes[k], "%")[[1]]
valores_porcentajes <- as.numeric(valores_porcentajes)
names(valores_porcentajes) <- names(tabla_fa)

inscriptos <- as.vector(as.matrix(tabla_armada))



at_mod <- c(0, 20, 40, 60, 80, 100)
lab_mod <- paste0(at_mod, "%")



mi_grafico <- '
valores_x <- barplot(valores_porcentajes, col="red", 
                     ylim=c(0,max(at_mod)), ylab="Porcentaje",
                     main = input_main, 
                     names.arg="", las=2, axes = F)

axis(2, las = 2, at = at_mod, labels = lab_mod, "%")

text(valores_x, -3.7, srt = 60, adj= 1, xpd = TRUE, labels = names(valores_porcentajes) , cex=1.2)


text(valores_x, valores_porcentajes + 5, inscriptos)
'



