

# Grafico 46 - Mini base creada interna

mini2 <- mini

v1 <- mini[1] # BASE_MOD[let2num(c("FD"))]
v2 <- mini[4] # BASE_MOD[let2num("GI")]
v3 <- mini[2] # BASE_MOD[let2num("CD")]
v4 <- mini[3] # BASE_MOD[let2num("CF")]


mini <- cbind(v1, v2, v3, v4)

# table(v1, v2)

dt_v1 <- v1 == "Vivo"
dt_v1[is.na(dt_v1)] <- FALSE

dt_v2 <- !(v2 == "Grupo 1")
dt_v2[is.na(dt_v2)] <- FALSE

dt_general <- dt_v1
dt_general[dt_v2] <- TRUE


mini <- mini[dt_general, ]



mini <- data.frame(mini)

mini <- mini[,c(3,4)]

modificado <- rep(NA, nrow(mini))
for (k in 1:length(modificado)) {
  
  if (!is.na(mini[k,1]) && !is.na(mini[k,2])) {
    
    if(mini[k,1] == "No" && mini[k,2] == "No") modificado[k] <- "Sin Catéter"
    if(mini[k,1] == "Si" && mini[k,2] == "No") modificado[k] <- "Arteria"
    if(mini[k,1] == "No" && mini[k,2] == "No") modificado[k] <- "Vena"
    if(mini[k,1] == "Si" && mini[k,2] == "Si") modificado[k] <- "Arteria + Vena"
    
  }
}

dim(modificado) <- c(length(modificado), 1)
colnames(modificado) <- "Catéter"
mini <- modificado
    




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

# tabla_salida <- tabla_p

at_mod <- c(0, 25, 50, 75, 100)
lab_mod <- paste0(at_mod, "%")



mi_grafico <- '
valores_x <- barplot(valores_porcentajes, col="red", 
                     ylim=c(-20,max(at_mod)), ylab="Porcentaje",
                     main = input_main, 
                     names.arg="", las=2, axes = F)

axis(2, las = 2, at = at_mod, labels = lab_mod, "%")

text(valores_x, -3.7, srt = 60, adj= 1, xpd = TRUE, labels = names(valores_porcentajes) , cex=1.2)


text(valores_x, valores_porcentajes + 5, inscriptos)
'




# eval(parse(text= mi_grafico))



