# Cargamos herramientas
# source("../004_Ejecucion/004_Ejecucion General.R")


# Esta tabla es...
# num_interno_tabla

mini <- na.omit(mini)

# Sobrevida por unidad
tabla_fa <- DF02(mini[, c(2,3)])[[3]][[1]]
tabla_p <-  DF02(mini[, c(2,3)])[[3]][[4]]

# Triple tabla
aver <- table(mini)

# Tabla Doble entrada
# Frecuencias absolutas
aver1 <- aver[,,"Vivo"] # Solo vivos
aver1 <- t(aver1)

aver2 <- table(mini[,c(2,1)])
###################################################

nuevo_aver <- aver1
for (interino1 in 1:nrow(aver1)) {
  for (interino2 in 1:ncol(aver1)) {
    nuevo_aver[interino1, interino2] <- as.numeric(aver1[interino1, interino2])/as.numeric(aver2[interino1, interino2])
    if(is.nan( nuevo_aver[interino1, interino2]))  nuevo_aver[interino1, interino2] <- 0
    
    nuevo_aver[interino1, interino2] <- round2(nuevo_aver[interino1, interino2], 4)
    nuevo_aver[interino1, interino2] <-  nuevo_aver[interino1, interino2]*100
  }
}


for (interino1 in 1:nrow(aver1)) {
  for (interino2 in 1:ncol(aver1)) {
    
    nuevo_aver[interino1, interino2] <- paste0( nuevo_aver[interino1, interino2], "%")
  }
}


for (interino1 in 1:nrow(aver1)) {
  for (interino2 in 1:ncol(aver1)) {
    
    nuevo_aver[interino1, interino2] <- paste0(nuevo_aver[interino1, interino2], "(", aver1[interino1, interino2], "/", aver2[interino1, interino2], ")")
    
  }
}
######################################################################3


# Porcentajes por fila... #vivos/total de pacientes
aver3 <- aver1
for (k in 1:nrow(aver3)) {
  cociente <- as.numeric(as.character(aver3[k, ]))/tabla_fa[k,4]
  cociente[cociente == "NaN"] <- 0
  
  aver3[k, ] <- paste0(round2(cociente, 2)*100, "%", sep="")
  
} 

aver4 <- aver3
for (interino1 in 1:nrow(aver3)) {
  for (interino2 in 1:ncol(aver3)) {
  aver4[interino1, interino2] <- paste0(aver4[interino1, interino2], "(", aver1[interino1, interino2], ")") 
  
  }
}

vector_sobrevida <- paste0(round2(tabla_fa[,3]/tabla_fa[,4], 2)*100, "%", "(", tabla_fa[,3], ")")
dim(vector_sobrevida) <- c(length(vector_sobrevida), 1)
colnames(vector_sobrevida) <- "Sobrevida por Unidad"

vector1 <- tabla_fa[,3]
dim(vector1) <- c(length(vector1), 1)
colnames(vector1) <- c("Pacientes Vivos")

vector2 <- tabla_fa[,4]
dim(vector2) <- c(length(vector2), 1)
colnames(vector2) <- c("Total de Pacientes")


aver5 <- cbind(nuevo_aver, vector_sobrevida, vector1, vector2)




tabla_salida <- aver5

tabla_salida <- list(as.data.frame(tabla_salida))
names(tabla_salida) <- " "
