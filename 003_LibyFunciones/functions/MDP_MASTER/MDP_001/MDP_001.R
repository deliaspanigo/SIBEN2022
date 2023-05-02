MDP <- function(input_base=NULL, input_decimales= 2, input_impuesto="Numérica", input_general = FALSE) {
  

  VR <- input_base[1]
  FACTOR <- input_base[2]
  
  # Si no es factor... Lo hacemos factor
  if (!is.factor(FACTOR[,1])) FACTOR[,1] <- as.factor(as.character(FACTOR[,1]))
  
  # Cantidad de niveles
  cantidad_lvls <- length(levels(FACTOR[,1]))
  
  # Medidas de Posicion Particionadas
  tabla_MD_general <- MD(VR, input_decimales = input_decimales)[[1]]
  
  tabla_MDP <- as.data.frame(matrix(NA, cantidad_lvls , ncol(tabla_MD_general)))
  colnames(tabla_MDP) <- colnames(tabla_MD_general)
  colnames(tabla_MDP)[1] <- colnames(FACTOR)
  

  # Segun la cantidad de niveles
  if (cantidad_lvls > 0) {
    for(j in 1:cantidad_lvls) {
      
      dt <- NULL
      recorte <- NULL
      
      dt <- FACTOR == levels(FACTOR[,1])[j]
      recorte <- VR[dt, 1]
      dim(recorte) <- c(length(recorte), 1)
      recorte <- as.data.frame(recorte)
      colnames(recorte) <- levels(FACTOR[,1])[j]
      
      tabla_MDP[j,] <- as.character(as.vector(as.matrix(MD(recorte, input_decimales)[[1]])))
      tabla_MDP[j,1] <- levels(FACTOR[,1])[j]
      
    } # FIn for j
    
  } # Fin if cantidad > 0
  
  
  # Si debemos agregar las medidas generales
  if (input_general){
    tabla_MD_general[1,1] <- " --Medidas Generales--"
    colnames(tabla_MD_general)[1] <- colnames(FACTOR)
    tabla_MDP <- rbind(tabla_MDP, tabla_MD_general)
  } 
  
  # Colocamos los niveles como nombres de filas
  rownames(tabla_MDP) <- tabla_MDP[,1]
  
  
  return(tabla_MDP)
  
}