

# Creamos las BASES MODIFICADAS...
# Esto quiere decir... Las bases medicas originales se encuentran en el
# objeto "BASES_ORIGINALES".
# Alli las bases presentaran en sus variables categoricas los niveles ordenados
# de manera alfabetica. 
# Cambiamos el ordena alfabetico por el orden que nosotros queremos.
# Y hay tambien varios puntos de control, por ejemplo cuando hay en la base
# original una categoria no declarada como un nivel posible en el 
# objeto "BASES_NIVELES_ORIGINALES".


if (candado_003) {
BasesModificadas_004 <- function(){
  
  
  # # # Script: 004_BasesModificadas.R
  # # # Se colocan los niveles del factor de todas las variables categoricas
  # # # en el orden correcto segun las especificaciones de los archivos
  # # # de los niveles.
  
  
  # Base de datos original con los niveles ordenados
  cat("Generacion BASE_MOD_ORIGINAL\n")
  BASE_MOD_ORIGINAL <-  cambio_niveles(input_base = BASES_ORIGINALES[[1]], input_base_niveles = BASES_NIVELES_ORIGINALES[[1]])
  
  
  
  
  # Base de datos IPT con los niveles ordenados
  cat("Generacion BASE_MOD_IPT\n")
  BASE_MOD_IPT <-  cambio_niveles(input_base = BASES_ORIGINALES[[2]], input_base_niveles = BASES_NIVELES_ORIGINALES[[2]])
  
  
  
  # Base de datos IC con los niveles ordenados
  cat("Generacion BASE_MOD_IC\n")
  BASE_MOD_IC <-  cambio_niveles(input_base = BASES_ORIGINALES[[3]], input_base_niveles = BASES_NIVELES_ORIGINALES[[3]])
  
  
  
  BASES_MODIFICADAS <- list(BASE_MOD_ORIGINAL, BASE_MOD_IPT, BASE_MOD_IC)
  
  
  
  # La salida
  
  # De onda... El candado es TRUE, por que no hay control de nada.
  candado004 <- T
  mi_salida <- list(BASES_MODIFICADAS, candado004)
  return(mi_salida)
  
  
}


# Capturamos y separamos cada base
BASES_MODIFICADAS <- BasesModificadas_004()

# Separamos cada base
BASE_MOD_ORIGINAL <- BASES_MODIFICADAS[[1]][[1]]
BASE_MOD_IPT <- BASES_MODIFICADAS[[1]][[2]]
BASE_MOD_IC <- BASES_MODIFICADAS[[1]][[3]]

candado_004 <- BASES_MODIFICADAS[[2]]

# Borramos lo que ya no hace falta.
remove(BASES_MODIFICADAS)
}
