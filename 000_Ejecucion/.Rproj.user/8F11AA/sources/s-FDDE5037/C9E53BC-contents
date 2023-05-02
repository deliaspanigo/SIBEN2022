
# Cargamos herramientas
# source("../004_Ejecucion/004_Ejecucion General.R")


d1 <- BASE_RECAT[let2num("AW")]
d2 <- BASE_MOD_RECAT[let2num("AW")]



dim(d2)
dim(d2)

# n <- 1
colnames(BASE_MOD_RECAT)[let2num("AW")]

mirame <- cbind(BASE_MOD_ORIGINAL[let2num("CL")], BASE_MOD_RECAT[let2num("AW")])
table(mirame)

mirame2 <- na.omit(mirame)
table(mirame2)

dt_si <- mirame2[,2] == "Si"
mirame3 <- mirame2[dt_si, ]
table(mirame3[,1])
#####################################################################
# n <- 1
# colnames(BASE_RECAT)[let2num("AW")]

# mirame <- cbind(BASE_ORIGINAL[let2num("CL")], BASE_RECAT[let2num("AW")])
# table(mirame)

# mirame2 <- na.omit(mirame)
# table(mirame2)

# dt_si <- mirame2[,2] == "Si"
# mirame3 <- mirame2[dt_si, ]
# table(mirame3[,1])

#####################################################################
input_tabla <- DF01(mini)[[1]]
input_armado <- armado.graf.tortas(input_tabla)
input_detalle <- 4
input_referencia <- 1
input_colores <- c("blue", "orange", "red", "green", "yellow")
input_main <- titulo_grafico

tabla_salida <- list(input_tabla)
names(tabla_salida) <- "Tabla de Distrución de Frecuencias"

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
