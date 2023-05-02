
# Cargamos herramientas
# source("../004_Ejecucion/004_Ejecucion General.R")

# n <- 1

input_tabla <- DF01(mini)[[1]]
input_armado <- armado.graf.tortas(input_tabla)
input_detalle <- 4
input_referencia <- 1
input_colores <- c("blue", "orange", "red", "green", "yellow")
input_main <- titulo_grafico

rownames(input_tabla) <- NULL

tabla_salida <- list()
tabla_salida[[1]] <- input_tabla
names(tabla_salida)[1] <- c("Tabla de Distribucion de Frecuencias")



frecuencias <- input_tabla[,2]
names(frecuencias) <- input_armado[[input_detalle]]

mi_grafico <- '
 pie(frecuencias, border="white", clockwise=TRUE, col = input_colores, main= input_main, cex=1.5)
   
  legend("bottom", input_tabla[,1], cex = 0.8, 
         fill = input_colores, 
         legend = input_armado[[input_referencia]], horiz = T)
'

# eval(parse(text= mi_grafico))

# cat("  Fin Gráfico ",  num_interno_grafico, "\n", sep="")