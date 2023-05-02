


# Cargamos herramientas
# source("../004_Ejecucion/004_Ejecucion General.R")






# Columnas implicadas de IPT
###########################################################################################
# SIBEN 2020
# col_ipt1 <-c("Y", "AJ", "AU", "BF", "BQ", "CB", "CM", "CX", "DI", "DT") # SIBEN 2020

# SIBEN 2021 - 17/05/2022
col_ipt1 <-c("Y", "AJ", "AU", "BF", "BQ", "CB", "CM", "CX", "DI")
############################################################################################
col_ipt3 <- "E"


# Base de COnfirmaciones
v1 <- BASE_MOD_IPT[let2num(col_ipt1)]
unidad <- BASE_MOD_RECAT[let2num(col_ipt3)]



for(k in 1:ncol(v1)) v1[,k] <- as.character(v1[,k])
for (k in 1:nrow(v1)) {
  for (y in 1:ncol(v1)) {
    
    if (is.na(v1[k, y])) v1[k, y] <- 0 else v1[k, y] <- 1
    
  }
}
for(k in 1:ncol(v1)) v1[,k] <- as.numeric(as.character(v1[,k]))

# # # # # # # 
# Cantidad de confirmaciones por paciente
total_infecciones_paciente <- rowSums(v1)



# Creamos minibase
mini <- as.data.frame(cbind(unidad, total_infecciones_paciente))



# Por cada Unidad habra una suma
estas_unidades <- names(table(mini[,1]))
total_infecciones_unidad <- rep(NA, length(estas_unidades))

# SIBEN 2020
# for (k in 1:length(estas_unidades)) {
#   
#   dt_filtro <- mini$recat_codigo_unidad == estas_unidades[k]
#   
#   mini2 <- mini[dt_filtro, ]
#   
#   estos_numeros <- as.numeric(as.character(as.vector(as.matrix(mini2$total_infecciones_paciente))))  
#   suma <- sum(na.omit(estos_numeros)) # Suma de Infecciones
#   
#   
#   total_infecciones_unidad[k] <- suma
#   
#   
# }
# names(total_infecciones_unidad) <- estas_unidades
###############################################################################################################


# SIBEN 2021 - 30 de Mayo 2022
total_infecciones_unidad <- tapply(mini[,2], mini[,1], sum)  
##########################################################################


nuevo_orden <- order(total_infecciones_unidad, decreasing = T)
total_infecciones_unidad <- total_infecciones_unidad[nuevo_orden]


score_unidad2 <- total_infecciones_unidad
dim(score_unidad2) <- c(length(score_unidad2), 1)
rownames(score_unidad2) <- estas_unidades[nuevo_orden]


tabla_salida <- list(score_unidad2)
names(tabla_salida) <- "Tabla de Índice"



mi_grafico <- '
valores_x <- barplot(total_infecciones_unidad, col="red", las=2,
                    ylim=c(0, 100), 
                    main=titulo_grafico,
                     xlab="Código Unidades", ylab="Total de Infecciones")

text(valores_x, total_infecciones_unidad + 5, total_infecciones_unidad)
'

# eval(parse(text= mi_grafico))

