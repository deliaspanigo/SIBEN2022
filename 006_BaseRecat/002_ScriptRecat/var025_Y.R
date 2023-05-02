


evaluame <- '



# 25) recat_fusion_retino (Y)

# Retinop prematuro (BZ)
# Grado_Retinop (CA)
#### Fondo de ojo (BY) (Criterio de Inclusion: "SI")

# Si tiene un "NO" en (BZ), queda el no.
# Si tiene un "SI" en (BZ)... colocamos la informacion de (CA).
# Todo esto solo para los pacientes que tienen un "SI" en (BY).


columnas <- c("BZ", "CA", "BY")
estas_columnas <- let2num(columnas)

mini_armado <- BASE_MOD_ORIGINAL[estas_columnas]
fusion_retino <- rep(NA, nrow(mini_armado))

for (n in 1:nrow(mini_armado)) {

    esta_fila <- as.matrix(mini_armado[n, ])

    cambio_esta_fila <- na.omit(as.matrix(esta_fila))



# Si le hicieron el fondo de ojo...
if (!is.na(esta_fila[3]) && esta_fila[3] == "Si") {

# Si tiene un "NO" queda un "No"
if (!is.na(esta_fila[1]) && esta_fila[1] == "No") fusion_retino[n] <- "No"

# Si tiene un "Si" queda la categoria
if (!is.na(esta_fila[1]) && esta_fila[1] == "Si") fusion_retino[n] <- esta_fila[2]

# Si no le hicieron el fondo de ojo, queda vacia la celda
} else fusion_retino[n] <- NA




} # Fin for n


recat_fusion_retino <- fusion_retino


dim(recat_fusion_retino) <- c(length(recat_fusion_retino), 1)
colnames(recat_fusion_retino) <- "recat_fusion_retino"

# Salida 
data_salida <- recat_fusion_retino



'


