


tabla <- table(mini[,1])
categorias <- names(tabla)

tabla_fa <- table(mini)
# estas_filas <- rowSums(tabla_fa) >= 5
# 
# tabla_fa <- tabla_fa[estas_filas, ]

suma_filas <- rowSums(tabla_fa)
suma_columnas <- colSums(tabla_fa)
total <- sum(suma_columnas)


tabla_p <- (tabla_fa/total)*100
tabla_p <- round2(tabla_p, 2)


for (k in 1:nrow(tabla_p)) tabla_p[k, ] <- paste0(tabla_p[k, ], "%")

tabla_p <- as.matrix(tabla_p)
tabla_fa <- as.matrix(tabla_fa)
parte0 <- tabla_p

for (k in 1:nrow(parte0)) parte0[k, ] <- paste0(parte0[k,], "(", tabla_fa[k,], ")")



parte1 <- paste0(round2((suma_filas/total)*100, 2), "%", "(", suma_filas, ")")
parte2 <- paste0(round2((suma_columnas/total)*100, 2), "%", "(", suma_columnas, ")")
parte3 <- paste0("100%", "(", total, ")")

tabla_armada <- rbind(cbind(parte0, parte1), c(parte2, parte3))

tabla_armada <- as.data.frame(tabla_armada)

colnames(tabla_armada)[ncol(tabla_armada)] <- "Por filas al total General"
rownames(tabla_armada)[nrow(tabla_armada)] <- "Por columnas al total General"

tabla_salida <- tabla_armada





tabla_salida <- list(tabla_salida)
names(tabla_salida) <- " "