


# Cargamos herramientas
# source("../001_Carga_Herramientas/001_Carga_Herramientas.R")


BASE_MOD2 <- BASE_MOD

# Cargamos la base con los niveles
direccion_carga <- "../../002_BASE"
archivo_carga <- "BASE Niveles - ORIGINALES.xlsx"
esta_carga <- paste0(direccion_carga, "/", archivo_carga)

# BASE con niveles
BASE_NIVELES <- carga_xls(esta_carga)[[2]]
nombre_base_niveles <- carga_xls(esta_carga)[[1]] 


# Tenemos ya detectadas cuales son las variables a las que vamos a realizar cambios.
dt_categoricas <- as.vector(BASE_NIVELES[1,])


# Realizamos el cambio de orden de los niveles de los factores
for (n in 1:length(dt_categoricas)) {
  
  
  if (dt_categoricas[n] == "SI") {
    
    mi_factor <- as.factor(as.character(BASE_MOD[,n]))
    
    estas_filas <- c(3:nrow(BASE_NIVELES))
    niveles_nuevos <- na.omit(BASE_NIVELES[estas_filas, n])

    niveles_actuales <- levels(mi_factor)    
    
    
    if ( identical(sort(niveles_actuales), sort(niveles_nuevos)) ) {
      orden <- c(1:length(niveles_actuales))
      
      dt_orden <- rep(NA, length(orden))
      
      
      for (k in 1:length(dt_orden))  dt_orden[k] <- orden[niveles_nuevos[k] == niveles_actuales]
      
      mi_factor_mod <- factor( mi_factor, levels = levels( mi_factor )[ dt_orden ] )
      
      BASE_MOD[,n] <- mi_factor_mod
      
    } else cat("**** DANGER!!!! - Niveles Diferentes!!!", "(", num2let(n), ") - ", colnames(BASE_MOD)[n], "\n\n")
    
    
    
    
    
    
    
  } # Fin if
} # Fin for n


# Vemos el cambio
esta_columna <- let2num("FL")

table(BASE_MOD[,esta_columna])


table(BASE_MOD2[,esta_columna])


