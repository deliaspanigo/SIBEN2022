


evaluame <- 
'

# 
# columnas <- c("CU", "CS")

# Pasamos a letras
# estas_columnas <- let2num(columnas)


# Minibase
# mini <- BASE_ORIGINAL[estas_columnas]

mini <- nuevas_columnas[[30]]   # Columna AD - recat_dias_int_fallec


recat_criterio_inclusion12 <- rep(NA, nrow(mini))

for (k in 1:length(recat_criterio_inclusion12)) {
  
  if (!is.na(mini[k,1])) {

    
    if (mini[k,1] == "Grupo 1") recat_criterio_inclusion12[k] <-   "No"
    if (mini[k,1] == "Grupo 2") recat_criterio_inclusion12[k] <-  "No"
    if (mini[k,1] == "Grupo 3") recat_criterio_inclusion12[k] <-  "Si"
    if (mini[k,1] == "Grupo 4") recat_criterio_inclusion12[k] <-  "Si"


  } # Fin if
} # Fin for k




dim(recat_criterio_inclusion12) <- c(length(recat_criterio_inclusion12), 1)
colnames(recat_criterio_inclusion12) <- "recat_criterio_inclusion12"


# salida 
data_salida <- recat_criterio_inclusion12


'
