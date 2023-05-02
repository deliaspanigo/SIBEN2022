


# Cargamos herramientas
# source("../004_Ejecucion/004_Ejecucion General.R")







# # Columnas implicadas de IPT
# col_ipt <- c("Y", "AJ")
# 
# # Base de COnfirmaciones
# v1 <- BASE_MOD_IPT[let2num(col_ipt)]

if (nrow(mini)> 0) {
  
v1 <- mini


v2 <- as.character(v1[,1])
v3 <- as.character(v1[,2])

v4 <- c(v2, v3)

v5 <- as.factor(v4)
v6 <- as.numeric(v5)
v7 <- LETTERS[v6]

tabla_fa1 <- table(v5)
tabla_fa2 <- table(v7)

tabla_fa3 <- sort(tabla_fa1, decreasing = T)
tabla_fa4 <- sort(tabla_fa2, decreasing = T)

maximo <- 10

tabla_fa5 <- tabla_fa3[1:maximo]
tabla_fa6 <- tabla_fa4[1:maximo]


names(tabla_fa6) <- LETTERS[1:length(tabla_fa6)]

tabla_ref <- cbind(names(tabla_fa6), names(tabla_fa5))
colnames(tabla_ref) <- c("Referencia", "Detalle")
tabla_ref <- as.data.frame(tabla_ref)

tabla_fa <- tabla_fa6
tabla_p <- round2(tabla_fa/sum(tabla_fa), 2)*100

tabla_rejunte <- tabla_fa
for (k in 1:length(tabla_rejunte)) tabla_rejunte[k] <- paste0(tabla_p[k], "%(", tabla_fa[k], ")")

tabla_rejunte2 <- as.data.frame(matrix(NA, 1, length(tabla_rejunte)))
for (k in 1:ncol(tabla_rejunte2)) tabla_rejunte2[,k] <- tabla_rejunte[k]

colnames(tabla_rejunte2) <- names(tabla_rejunte)


at_mod <- c(0, 10, 20 , 30 , 40, 50)
lab_mod <- paste0(at_mod, "%")

names(tabla_fa) <- names(tabla_fa6)
names(tabla_p) <- names(tabla_p)
names(tabla_rejunte2) <- names(tabla_rejunte2)

mi_grafico <- '
valores_x <- barplot(tabla_p, col="red", las=1,
                    ylim=c(0,max(at_mod)), main=titulo_grafico,
                     xlab="Agente Infeccioso", ylab="Porcentaje de Infecciones",
                    names.arg="", axes = F)

axis(2, las = 2, at = at_mod, labels = lab_mod, "%")

text(valores_x, tabla_p + 5, tabla_rejunte)

text(valores_x, -3.7, srt = 0, adj= 1, xpd = TRUE, labels = names(tabla_fa) , cex=1.2)

'
# 
# 
tabla_fa3 <- tabla_fa
tabla_p3 <- tabla_p
tabla_rejunte3 <- tabla_rejunte2

dim(tabla_fa3) <- c(1, length(tabla_fa))
dim(tabla_p3) <- c(1, length(tabla_p))
dim(tabla_rejunte3) <- c(1, length(tabla_rejunte2))
# 
names(tabla_fa3) <- names(tabla_fa6)
names(tabla_p3) <- names(tabla_p)
names(tabla_rejunte3) <- names(tabla_rejunte2)

tabla_salida <- list(tabla_ref, tabla_fa3, tabla_p3, tabla_rejunte3)
names(tabla_salida) <- c("Tabla de Referencias", "Tabla de Frecuencias Absolutas", "Tabla de Porcentajes", "Tabla Combinada")



} else {
  

  mi_grafico <- '

plot(c(1:10), (c(1:10)))
text(5, 5, "Sin Datos - Reveer")

'
  tabla_sin_datos <- as.data.frame(matrix("Sin Datos"), 5, 4)
  tabla_salida <- list(tabla_sin_datos)
  names(tabla_salida) <- " "
  
}

# eval(parse(text= mi_grafico))


