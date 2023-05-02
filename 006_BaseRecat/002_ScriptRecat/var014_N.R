

evaluame <- '


# Fusion de informacion de ecografia cerebral
# Ecografia Cerebral (CS)
# Hemorragia Craneana (CT)
# Grado de Hemorragia (CU)

columnas <- c("CS", "CT", "CU")
estas_columnas <- let2num(columnas)

mini_armado <- BASE_MOD_ORIGINAL[,estas_columnas]
eco2 <- rep(NA, nrow(mini_armado))

for (n in 1:nrow(mini_armado)) {

esta_fila <- mini_armado[n, ]

# Si no le hicieron la ecografia... "Sin Ecografia"
if(!is.na(esta_fila[1]) && esta_fila[1] == "No") eco2[n] <- "Sin Ecografía"

# Si le hiceron la ecografia...
if(!is.na(esta_fila[1]) && esta_fila[1] == "Si") {

# Si no tuvo hemorragia... es "Normal"
if(!is.na(esta_fila[2]) && esta_fila[2] == "No") eco2[n] <- "Normal"

# Si tuvo hemorragia, detallamos el grado
if(!is.na(esta_fila[2]) && esta_fila[2] == "Si") eco2[n] <- as.vector(as.matrix(esta_fila[3]))
}

}

eco2_mod <- eco2

# # # Cambiamos "HIV" por "HIC".

for (k in 1:length(eco2_mod)) {

este <- eco2[k]

if (!is.na(este)) {

metralla <- strsplit(este, "")[[1]]
if(metralla[3] == "V") metralla[3] <- "C"

armado <- paste0(metralla, collapse="")

eco2_mod[k] <- armado
}

} # Fin for n


# # # # # # # # # # # # # # # # # # 

dim(eco2_mod) <- c(length(eco2_mod), 1)

recat_eco2 <- eco2_mod
colnames(recat_eco2) <- "recat_eco2"


# Salida
data_salida <- recat_eco2













'



