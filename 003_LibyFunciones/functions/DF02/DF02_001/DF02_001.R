DF02 <- function(input_base=NULL, input_decimales= 2, input_aviso = TRUE) {
  

   
    # Tomamos la columna... y le hacemos un na.omit()  
   # Variables <- colnames(input_base)
    mini <- input_base
    mini <- na.omit(mini)
    
    mentime <- FALSE
    
    # Si no hay datos, le metemos unos datos de R...
    if (length(dim(mini)) == 2 && dim(mini)[1] == 0) {
      
      mentime <- TRUE
      mini <- mtcars[, c(8,2)]
      if(!is.factor(mini[,1])) mini[,1] <- as.factor(as.character(mini[,1]))
      if(!is.factor(mini[,2])) mini[,2] <- as.factor(as.character(mini[,2]))
      colnames(mini) <- colnames(input_base)
    } 
    
  
    # mini <-mtcars[c(2,8)]
    # mini[,1] <- as.character(mini[,1])
    # mini[,2] <- as.character(mini[,2])
    # input_decimales <- 2
      
    # Detalles Iniciales y fa
    fa <- table(mini)
    n_total <- sum(fa)
    fa_interno <- fa
    m_col <- colSums(fa)
    m_row <- rowSums(fa)
    
    # fa marginal
    fa_marginal <- cbind(fa, m_row)
    fa_marginal <- rbind(fa_marginal, c(m_col, n_total))
    colnames(fa_marginal)[ncol(fa_marginal)] <- c("Total por Filas")
    rownames(fa_marginal)[nrow(fa_marginal)] <- c("Total por Columnas")
    
    # Cociente al Total con marginales
    cociente_marginal <- fa_marginal
    for(n in 1:ncol(cociente_marginal)) cociente_marginal[,n] <- paste0(cociente_marginal[,n], "/", n_total)
    
    
    # Frecuencias Relativas al Total con Marginales
    fr_marginal <- fa_marginal/n_total
    fr_marginal <- round2(fr_marginal, input_decimales)
    m_col2 <- fr_marginal[nrow(fr_marginal),-ncol(fr_marginal)]
    m_row2 <- fr_marginal[-nrow(fr_marginal),ncol(fr_marginal)]
    totales_raros <- c(sum(m_col2), sum(m_row2))
    diferencia <- abs(totales_raros - 1)
    dt_diferencia <- max(diferencia) == diferencia
    orden_diferencia <- c(1,2)[dt_diferencia]
    if (length(orden_diferencia) == 2) orden_diferencia <- orden_diferencia[1]
    

    # En "fr"... los marginales al total por filas y columnas deben sumar 1 en cada caso.
    # Por temas de redondeo... puede que uno sea igual a 1 y el otro no... o que ambos sean diferentes de 1.
    # En ese caso deberiamos avisarle que las sumas marginales no estan dando como debieran... y que
    # debe cambiar los decimales para traajar...
    
    # Deteccion de redondeo incorrecto
    fr_interno <- fr_marginal
    if (input_aviso == TRUE) if (totales_raros[orden_diferencia] != 1) fr_marginal[nrow(fr_marginal), ncol(fr_marginal)] <- paste0(fr_marginal[nrow(fr_marginal), ncol(fr_marginal)], "")  
        
    # Porcentajes al Total con marginales
    porcentaje_marginal <- fr_interno
    porcentaje_marginal <- porcentaje_marginal*100
    #dim(PORCENTAJE) <- dim(FR_interno)
    for(n in 1:ncol(porcentaje_marginal)) for (k in 1:nrow(porcentaje_marginal)) {
      porcentaje_marginal[k,n] <- paste(porcentaje_marginal[k,n], "%", sep="")
    }
    
    # Guardamos unos porcentajes internos...
    porcentaje_interno <- porcentaje_marginal
    
    # Si tuvo problemas con las "fr" dejamos constancia tambien en la tabla de porcentajes
    if (input_aviso == TRUE) if (totales_raros[orden_diferencia] != 1) porcentaje_marginal[nrow(porcentaje_marginal), ncol(porcentaje_marginal)] <- paste0(porcentaje_marginal[nrow(porcentaje_marginal), ncol(porcentaje_marginal)], "")  
    
########################################################################################
    
    ### #### TOTOD POR FILAS
    
    # FA por filas
    fa_filas <- fa
    total_filas <- rowSums(fa)
    fa_filas <- cbind(fa_filas, total_filas)
    colnames(fa_filas)[ncol(fa_filas)] <- "Total por Filas"
    
    # Cociente por filas
    cociente_filas <- fa_filas
    for (n in 1:nrow(cociente_filas)) cociente_filas[n,] <- paste0(cociente_filas[n,], "/", total_filas[n]) 
      
    # "fr" por filas
    fr_filas <- fa_filas
    for (n in 1:nrow(cociente_filas)) {
      
      fr_filas[n, ] <- fr_filas[n, ]/total_filas[n]
      fr_filas[n, ] <- round2(fr_filas[n, ], 2)
      
      if (total_filas[n] == 0) fr_filas[n, ] <- rep(0, length(fr_filas[n, ]))
      
    }
    
    fr_filas_interno <- fr_filas
    totales_fr_filas <- fr_filas[,ncol(fr_filas)]
    dt_fr_filas <- totales_fr_filas != 1
    if (input_aviso == TRUE) fr_filas[dt_fr_filas] <- paste0(fr_filas[dt_fr_filas], "")
    
    
    
    # "porcentaje" por filas
    porcentaje_filas <- fr_filas_interno*100
    for (n in 1:nrow(porcentaje_filas)) porcentaje_filas[n,] <- paste0(porcentaje_filas[n,], "%")
    porcentaje_filas[dt_fr_filas] <- paste0(porcentaje_filas[dt_fr_filas], "")
 
############################################################################################################       
    
    
    
############################################################################################################
    
    ### #### TOTOD POR COLUMNAS
    
    # FA por columnas
    fa_columnas <- fa
    total_columnas <- colSums(fa)
    fa_columnas <- rbind(fa_columnas, total_columnas)
    rownames(fa_columnas)[nrow(fa_columnas)] <- "Total por columnas"
    
    # Cociente por columnas
    cociente_columnas <- fa_columnas
    for (n in 1:ncol(cociente_columnas)) cociente_columnas[,n] <- paste0(cociente_columnas[,n], "/", total_columnas[n]) 
    
    # "fr" por columnas
    fr_columnas <- fa_columnas
    for (n in 1:ncol(cociente_columnas)) {
      
      fr_columnas[,n ] <- fr_columnas[,n ]/total_columnas[n]
      fr_columnas[,n ] <- round2(fr_columnas[,n ], 2)
      if (total_columnas[n] == 0) fr_columnas[,n ] <- rep(0, length(fr_columnas[,n ]))
    }
    
    fr_columnas_interno <- fr_columnas
    totales_fr_columnas <- fr_columnas[nrow(fr_columnas),]
    dt_fr_columnas <- totales_fr_columnas != 1
    if (input_aviso == TRUE) fr_columnas[dt_fr_columnas] <- paste0(fr_columnas[dt_fr_columnas], "")
    
    
    
    # "porcentaje" por columnas
    porcentaje_columnas <- fr_columnas_interno*100
    for (n in 1:ncol(porcentaje_columnas)) porcentaje_columnas[,n] <- paste0(porcentaje_columnas[,n], "%")
    if (input_aviso == TRUE)  porcentaje_columnas[dt_fr_columnas] <- paste0(porcentaje_columnas[dt_fr_columnas], "")
    
#################################################################################################################
    
    
    
    
##############################################################################################
    
fa_clasico <- fa_marginal[-nrow( fa_marginal), - ncol( fa_marginal)]
if(is.null(dim(fa_clasico))) {
  
dim(fa_clasico) <- c((nrow(fa_marginal)-1), (ncol(fa_marginal)-1)) 
fa_clasico <- as.data.frame(fa_clasico)
rownames(fa_clasico) <- rownames(fa_marginal)[-nrow(fa_marginal)]
colnames(fa_clasico) <- colnames(fa_marginal)[-ncol(fa_marginal)]
}    
    
cociente_clasico <- cociente_marginal[-nrow( fa_marginal), - ncol( fa_marginal)]    
if(is.null(dim(cociente_clasico))) {
  
  dim(cociente_clasico) <- c((nrow(fa_marginal)-1), (ncol(fa_marginal)-1)) 
  cociente_clasico <- as.data.frame(cociente_clasico)
  rownames(cociente_clasico) <- rownames(fa_marginal)[-nrow(fa_marginal)]
  colnames(cociente_clasico) <- colnames(fa_marginal)[-ncol(fa_marginal)]
}   
    

fr_clasico <- fr_marginal[-nrow( fa_marginal), - ncol( fa_marginal)] 
if(is.null(dim(fr_clasico))) {
  
  dim(fr_clasico) <- c((nrow(fa_marginal)-1), (ncol(fa_marginal)-1)) 
  cociente_clasico <- as.data.frame(fr_clasico)
  rownames(fr_clasico) <- rownames(fa_marginal)[-nrow(fa_marginal)]
  colnames(fr_clasico) <- colnames(fa_marginal)[-ncol(fa_marginal)]
}  

porcentaje_clasico <- porcentaje_marginal[-nrow( fa_marginal), - ncol( fa_marginal)] 
if(is.null(dim(porcentaje_clasico))) {
  
  dim(porcentaje_clasico) <- c((nrow(fa_marginal)-1), (ncol(fa_marginal)-1)) 
  cociente_clasico <- as.data.frame(porcentaje_clasico)
  rownames(porcentaje_clasico) <- rownames(fa_marginal)[-nrow(fa_marginal)]
  colnames(porcentaje_clasico) <- colnames(fa_marginal)[-ncol(fa_marginal)]
}  

#############################################################################################        
    CLASICO <- list()
    CLASICO[[1]] <- as.data.frame(fa_clasico)
    CLASICO[[2]] <- as.data.frame(cociente_clasico)
    CLASICO[[3]] <- as.data.frame(fr_clasico)
    CLASICO[[4]] <- as.data.frame(porcentaje_clasico)
    names(CLASICO) <- c("Frecuencias Absolutas", "Cociente", "Frecuencias Relativas", "Porcentaje")
 
    
    TOTAL <- list()
    TOTAL[[1]] <- as.data.frame(fa_marginal)
    TOTAL[[2]] <- as.data.frame(cociente_marginal)
    TOTAL[[3]] <- as.data.frame(fr_marginal)
    TOTAL[[4]] <- as.data.frame(porcentaje_marginal)
    names(TOTAL) <- c("Frecuencias Absolutas", "Cociente al total", "Frecuencias Relativas al total", "Porcentaje al total")
    
 
    
    FILAS <- list()
    FILAS[[1]] <- as.data.frame(fa_filas)
    FILAS[[2]] <- as.data.frame(cociente_filas)
    FILAS[[3]] <- as.data.frame(fr_filas)
    FILAS[[4]] <- as.data.frame(porcentaje_filas)
names(FILAS) <- c("Frecuencias Absolutas por filas", "Cociente por filas", "Frecuencia Relativa por filas", "Porcentajes por filas")

 
        
    COLUMNAS <- list()
    COLUMNAS[[1]] <- as.data.frame(fa_columnas)
    COLUMNAS[[2]] <- as.data.frame(cociente_columnas)
    COLUMNAS[[3]] <- as.data.frame(fr_columnas)
    COLUMNAS[[4]] <- as.data.frame(porcentaje_columnas)
    names(COLUMNAS) <- c("Frecuencias Absolutas por columnas", "Cociente por columnas", "Frecuencia Relativa por columnas", "Porcentajes por columnas")
    
    
    grupos_filas <- rownames(fa)
    grupos_columnas <- colnames(fa)
    cantidad_filas <- length(grupos_filas)*length(grupos_columnas)
    nombres_columnas <- c(colnames(input_base), "FA", "COCIENTE", "FR", "%")
    
    
    SIMPLE <- as.data.frame(matrix(NA, cantidad_filas, length(nombres_columnas)))
    colnames(SIMPLE) <- nombres_columnas
    
    contador_externo <- 0
    for (k in 1:length(grupos_filas)) {
      for (n in 1:length(grupos_columnas)) {
        contador_externo <- contador_externo + 1
        
        SIMPLE[contador_externo,1] <- grupos_filas[k]
        SIMPLE[contador_externo,2] <- grupos_columnas[n]        
        SIMPLE[contador_externo,3] <- as.character(TOTAL[[1]][k,n])        
        SIMPLE[contador_externo,4] <- as.character(TOTAL[[2]][k,n])       
        SIMPLE[contador_externo,5] <- TOTAL[[3]][k,n]       
        SIMPLE[contador_externo,6] <- as.character(TOTAL[[4]][k,n])       
        
        
      } # Fin for n
    } # Fin for k
    
    SIMPLE <- list(SIMPLE)  


  # Juntamos todo...
    RESULTADOS <- list(CLASICO, TOTAL, FILAS, COLUMNAS, SIMPLE)
    names(RESULTADOS) <- c("Clasico", "Al total", "Por filas", "Por columnas", "Simple Entrada")  

   
   if (mentime == TRUE) {
     
     # Para total...
     for (j in 1:length(RESULTADOS)) {
     for (n in 1:length(RESULTADOS[[j]])) {
           
    
       dimensiones <- dim(RESULTADOS[[j]][[n]])
       CAMBIASO <- matrix("Sin pares de Datos en las columnas", dimensiones[1], dimensiones[2])
       colnames(CAMBIASO) <- rep("Sin Datos", dimensiones[2])
       rownames(CAMBIASO) <- rep("Sin Datos", dimensiones[1])
       RESULTADOS[[j]][[n]] <- CAMBIASO
       
} # Fin for n
} # Fin for j
     
   } #fin if mentime == TRUE
   
    
    
   return(RESULTADOS)
    

  
  
  
} # Fin function



if (2 == 1) {
  
  # # Ejemplo
  BASE <- mtcars[,c(2,8)]
  input_base <- BASE
  input_decimales <- 2
  input_marginal <- TRUE
  input_talk <- FALSE
  
AVER <-   DF02(BASE,2, FALSE, TRUE)
AVER$SIMPLE

AVER2 <-   DF02(BASE,2, TRUE, TRUE)
AVER2

}