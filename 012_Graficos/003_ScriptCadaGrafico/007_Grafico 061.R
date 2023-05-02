



t1 <- table(mini[,1])
t2 <- table(mini[,2])

p1 <- round2((t1/sum(t1)), 2)*100
p2 <- round2((t2/sum(t2)), 2)*100

q1 <- paste0(p1, "%")
q2 <- paste0(p2, "%")


r1 <- paste0(q1, "(", t1, ")")
names(r1) <- names(t1)

r2 <- paste0(q2, "(", t2, ")")
names(r2) <- names(t2)


armado <- c(p1[names(p1) == "Si"], p2[1:3])
armado2 <- c(r1[names(r1) == "Si"], r2[1:3])



tabla_fa <- c(t1[2], t2[1:3])
tabla_p <- armado

valores_porcentajes <- as.character(as.vector(as.matrix(tabla_p)))

for (k in 1:length(valores_porcentajes)) valores_porcentajes[k] <- strsplit(valores_porcentajes[k], "%")[[1]]
valores_porcentajes <- as.numeric(valores_porcentajes)
names(valores_porcentajes) <- names(tabla_fa)

inscriptos <- as.vector(tabla_p)

tabla_salida <- list(as.data.frame(as.matrix(tabla_fa)), as.data.frame(as.matrix(tabla_p)))
names(tabla_salida) <- c("Tabla de Frecuencia Absoluta", "Tabla de Porcentajes")

at_mod <- c(0, 5, 10, 15)
lab_mod <- paste0(at_mod, "%")

nuevos_nombres <- c("Drenaje", "Drenaje + Lap", "Lap")

valores_porcentajes <- valores_porcentajes[c(2: length(valores_porcentajes))]
armado <- armado[c(2:length(armado))]
armado2 <- armado2[c(2:length(armado2))]

names(valores_porcentajes) <- nuevos_nombres
names(armado) <- nuevos_nombres
names(armado2) <- nuevos_nombres

mi_grafico <- '
valores_x <- barplot(valores_porcentajes, col="red", 
                     ylim=c(-2,max(at_mod)), ylab="Porcentaje",
                     main = titulo_grafico, 
                     names.arg="", las=2, axes = F)

axis(2, las = 2, at = at_mod, labels = lab_mod, "%")

text(valores_x, -0.7, srt = 60, adj= 1, xpd = TRUE, labels = names(armado) , cex=1.2)


text(valores_x, valores_porcentajes + 1, armado2)
'


# eval(parse(text= mi_grafico))
