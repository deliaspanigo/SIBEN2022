
# 
# mini <- BASE_MOD[let2num(c("GG"))]
# armado <- BASE_MOD[,let2num(c("GL", "DN"))]
# armado[,1] <- as.character(armado[,1])
# armado[,2] <- as.character(armado[,2])
# 
# fusion <- paste(armado[,1], armado[,2], sep="-")
# dt_armado <- fusion == "Si-Si"
# dt_armado[is.na(fusion)] <- FALSE
# # dt_armado
# 
# original <- mini
# mini <- mini[dt_armado, ]
# 
# dim(mini) <- c(length(mini), 1)
# colnames(mini) <- colnames(original)

input_tabla <- DF01(mini)[[1]]
input_armado <- armado.graf.tortas(input_tabla)
input_detalle <- 4
input_referencia <- 1
input_colores <- c("blue", "orange", "red", "green", "yellow")
input_main <- titulo_grafico

# rownames(input_tabla) <- NULL
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

# tabla_salida <- tabla_p

at_mod <- c(0, 20, 40, 60, 80, 100)
lab_mod <- paste0(at_mod, "%")

valores_porcentajes2 <- valores_porcentajes[-1]
inscriptos2 <- inscriptos[-1]

# valores_porcentajes2 <- valores_porcentajes
# inscriptos2 <- inscriptos


mi_grafico <- '
pie(valores_porcentajes2, border="white", clockwise=TRUE, col = input_colores, main= input_main, cex=1.5)

legend("bottom", input_tabla[,1], cex = 0.8, 
       fill = input_colores, 
       legend = names(valores_porcentajes2), horiz = T)
'


if (sum(valores_porcentajes2) == 0) {

  library(graphics)
  mi_grafico <- '
plot(1:10, 1:10, col="white", axes=F, xlab="", ylab="")

text(5,5, "Sin Datos")
'
  
  
}
# eval(parse(text= mi_grafico))

