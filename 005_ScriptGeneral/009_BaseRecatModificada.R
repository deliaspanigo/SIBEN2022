

# Creamos las BASES MODIFICADAS...
# Esto quiere decir... La base con las variables recategorizadas se encuentran
# en el objeto "BASE_RECAT".
# Alli la bases presentara en sus variables categoricas los niveles ordenados
# de manera alfabetica. 
# Cambiamos el ordena alfabetico por el orden que nosotros queremos.
# Y hay tambien varios puntos de control, por ejemplo cuando hay en la base
# original una categoria no declarada como un nivel posible en el 
# objeto "BASES_NIVELES_ORIGINALES".

if (candado_008) {
BaseRecatModificada_009 <- function(){
  
  
  # # # Script: 009_BaseRecatModificada.R
  # # # Se colocan los niveles del factor de todas las variables categoricas
  # # # en el orden correcto segun las especificaciones de los archivos
  # # # de los niveles para la base Recategorizada
  
  
  # Base de datos original con los niveles ordenados
  cat("Generacion BASE_MOD_RECAT\n")
  BASE_MOD_RECAT <-  cambio_niveles(input_base = BASE_RECAT, input_base_niveles = BASE_NIVELES_RECAT )
  

  #   # De onda... El candado es TRUE, por que no hay control de nada.
  candado009 <- T
  mi_salida <- list(BASE_MOD_RECAT, candado009)
  return(mi_salida)
  
  
 
  
  
}


guardado_intermedio <- BaseRecatModificada_009()

# Capturamos y separamos cada base
BASE_MOD_RECAT <- guardado_intermedio[[1]]

# Agregamos BASE_MOD_RECAT a las bases modificadas
#BASES_MODIFICADAS[[4]] <- BASE_MOD_RECAT



candado_009 <- guardado_intermedio[[2]]

# Borramos lo que ya no hace falta.
remove(guardado_intermedio)

# Captur

}