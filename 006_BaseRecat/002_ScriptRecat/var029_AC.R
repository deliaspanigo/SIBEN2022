

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




fusion_HIC <- eco2_mod




# Recategorizacion
for (k in 1:length(eco2_mod)) {

if (!is.na(eco2_mod[k])) {

if (eco2_mod[k] == "Sin Ecografía") fusion_HIC[k] <- NA else if ((eco2_mod[k] == "HIC GIII" | eco2_mod[k] == "HIC GIV") | eco2_mod[k] == "LMPV") fusion_HIC[k] <- "Si" else fusion_HIC[k] <- "No"
}

} # Fin for k




recat_eco3 <- fusion_HIC

dim(recat_eco3) <- c(length(recat_eco3), 1)
colnames(recat_eco3) <- "recat_eco3"

# Salida
data_salida <- recat_eco3







'






