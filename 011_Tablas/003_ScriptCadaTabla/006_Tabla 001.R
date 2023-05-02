
# Cargamos herramientas
# source("../004_Ejecucion/004_Ejecucion General.R")

# Esta tabla la hace ARN



tabla_armada <- as.data.frame(matrix(NA, 1, 4))
colnames(tabla_armada) <- c("2016", "2017", "2018", "2019")

tabla_armada[1, ] <- c(610, 933, 1328, 6832)


tabla_salida <- list(tabla_armada)
names(tabla_salida) <- " "
