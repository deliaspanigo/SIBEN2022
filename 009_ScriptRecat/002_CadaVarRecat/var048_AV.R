


evaluame <- 
'

# 
# columnas <- c("CU", "CS")

# Pasamos a letras
# estas_columnas <- let2num(columnas)


# Minibase
# mini <- BASE_ORIGINAL[estas_columnas]

mini <- nuevas_columnas[[14]]   # recat_eco2


recat_fusion_grado_hemo <- rep(NA, nrow(mini))

for (k in 1:length(recat_fusion_grado_hemo)) {
  
  if (!is.na(mini[k,1])) {

    
    if (mini[k,1] == "HIV GI") recat_fusion_grado_hemo[k] <-   "HIC GI y GII"
    if (mini[k,1] == "HIV GII") recat_fusion_grado_hemo[k] <-  "HIC GI y GII"
    if (mini[k,1] == "HIV GIII") recat_fusion_grado_hemo[k] <- "HIC GIII, GIV y LMPV"
    if (mini[k,1] == "HIV GIV") recat_fusion_grado_hemo[k] <-  "HIC GIII, GIV y LMPV"
    if (mini[k,1] == "LMPV") recat_fusion_grado_hemo[k] <-     "HIC GIII, GIV y LMPV"
    if (mini[k,1] == "Normal") recat_fusion_grado_hemo[k] <-     "Normal"
    if (mini[k,1] == "Sin Ecografía") recat_fusion_grado_hemo[k] <-     NA



  } # Fin if
} # Fin for k




dim(recat_fusion_grado_hemo) <- c(length(recat_fusion_grado_hemo), 1)
colnames(recat_fusion_grado_hemo) <- "recat_fusion_grado_hemo"


# salida 
data_salida <- recat_fusion_grado_hemo


'
