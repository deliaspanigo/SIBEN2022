

evaluame <- '

recat_fusion_retino3 <- rep(NA, nrow(BASE_MOD_ORIGINAL))

# "GC" es una columna de la base modificada.
# Pero todavia no la armamos... la estamos armando...
# Entonces... llamo a la columna por el pedazo que es...


#v1 <- as.character(BASE_MOD[,let2num("GC")])
v1 <- as.character(as.vector(as.matrix(nuevas_columnas[[25]])))

v2 <- rep(NA, length(v1))

for (k in 1:length(v1)) {
  
  este <- v1[k]
  
  if(!is.na(este)) {
    
    if (este == "No") v2[k] <- "Sin ROP" else
      if (este == "Grado I") v2[k] <- "Grado I o II" else
        if (este == "Grado II") v2[k] <- "Grado I o II" else
          if (este == "Grado III") v2[k] <- "Grado III o IV" else
            if (este == "Grado IV") v2[k] <- "Grado III o IV" 
            
            
  } # Fin if
} # Fin for k

recat_fusion_retino3 <- v2

dim(recat_fusion_retino3) <- c(length(recat_fusion_retino3), 1)
colnames(recat_fusion_retino3) <- "recat_fusion_retino3"

# Salida
data_salida <- recat_fusion_retino3





'
