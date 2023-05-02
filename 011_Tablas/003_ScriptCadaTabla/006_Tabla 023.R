
# v1 <- BASE_MOD[,let2num("CA")]
# v2 <- BASE_MOD[,let2num("BZ")]
# v3 <- BASE_MOD[,let2num("BY")]



# v1 <- mini[,1]
# v2 <- mini[,2]
# v3 <- mini[,3]


tabla1_fa <- DF02(mini[, c(1,3)])[[3]][[1]]
tabla1_p <-  DF02(mini[, c(1,3)])[[3]][[4]]
tabla_intermedia1  <- tabla_FAP(tabla1_fa, tabla1_p)


tabla2_fa <- DF02(mini[, c(2,3)])[[3]][[1]]
tabla2_p <-  DF02(mini[, c(2,3)])[[3]][[4]]
tabla_intermedia2  <- tabla_FAP(tabla2_fa, tabla2_p)


tabla_final <- rbind(tabla_intermedia1[2,], tabla_intermedia2[2,])
rownames(tabla_final) <- colnames(mini)[c(1,2)]
rownames(tabla_final) <- paste0(rownames(tabla_final), "(Si)")

tabla_salida <- tabla_final

tabla_salida <- list(tabla_salida)
names(tabla_salida) <- " "
