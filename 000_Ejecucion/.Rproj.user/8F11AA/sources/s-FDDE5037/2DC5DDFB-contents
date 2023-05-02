
# Creamos una funcion que cargue todos los niveles de todas
# las bases de datos medicas originales, y solo devuelve eso y algunos carteles de funcionamiento 
# interno.

if (candado_002) {
LoadNiveles_003 <- function(){
  
  # # # Script: 003_LoadNiveles.R
  # # # Se importaran las bases en donde se encuentran solo los niveles de 
  # # # cada una de las variables de cada base de datos medica original.
  
  # Detalles para la importacion...
  direccion_general_carga <- "../003_BasesNiveles"
  ultima_version <- carpeta_UV(direccion_general_carga)
  subtipo <- "001_EXCEL"
  direccion_carpeta_completa <- paste0(direccion_general_carga, "/", ultima_version, "/", subtipo)
  
  # Archivos que seran cargados
  archivos_carga <- c("001_BE_Niveles Base Original.xlsx", "002_BE_Niveles IPT.xlsx", "003_BE_Niveles IC.xlsx")
  
  # Mensajes armados para acompaniar la salida...
  mensaje_armado <- "Archivo de Script General - 003_LoadNiveles.R"
  cat(mensaje_armado, "\n")
  
  # Controlamos que los archivos se encuentran en la carpeta
  candado003 <- control002(direccion_carpeta_completa  = direccion_carpeta_completa, 
                         archivos_carga = archivos_carga)
  
  # Si los archivos no estan, la funcion se detiene
  if(!candado003) stop()
  
  
  
  
  #####################################################################################################
  
  
  # Base de datos original con los niveles ordenados
  cat("Generacion BASES_NIVELES_ORIGINALES\n")
 
      BASES_NIVELES_ORIGINALES <- cargar_EXCEL(direccion_carpeta_completa  = direccion_carpeta_completa, 
                                             archivos_carga = archivos_carga, input_hoja = 1)
    
  
      
  # Niveles de nuevas columnas... control_niveles01()
  for (k in 1:length(archivos_carga)) {
    
    
    cat( "\n","Analisis de Niveles - Base: ", archivos_carga[k], "\n")
    
  mi_archivo <- paste0(direccion_carpeta_completa, "/", archivos_carga[k])
  
 aver <-  control_niveles01(input_base = BASES_ORIGINALES[[k]], 
                    input_base_niveles = BASES_NIVELES_ORIGINALES[[k]],
                    mi_archivo = mi_archivo)
  
  
  # Guardamos el nuevo archivo
 contador_externo <- 0
 limite <- 4
 candado_interno <- aver[[1]]
 
  while(!candado_interno){
    
    contador_externo <- contador_externo + 1
    
    # Guardamos la base de niveles corregida
    writexl::write_xlsx( x = aver[[2]], path = mi_archivo)
    
    cat("Nuevos niveles guardados... \n")
    # La levantamos de nuevo...
    BASES_NIVELES_ORIGINALES[[k]] <- cargar_EXCEL(direccion_carpeta_completa  = direccion_carpeta_completa, 
                                             archivos_carga = archivos_carga[k], input_hoja = 1)
    
    cat("Base de Niveles - Recargada... \n")
    BASES_NIVELES_ORIGINALES[[k]] <- BASES_NIVELES_ORIGINALES[[k]][[1]]
    
    # Volvemos a verificarla
    aver <-  control_niveles01(input_base = BASES_ORIGINALES[[k]], 
                               input_base_niveles = BASES_NIVELES_ORIGINALES[[k]],
                               mi_archivo = mi_archivo)
    
    candado_interno <- aver[[1]]
    
    if (contador_externo >= limite) candado_interno <- TRUE
  } 
  } # Fin control_niveles01()
  #########################################################################
  
      
      
  # Niveles nuevos en columnas... control_niveles02()
      for (k in 1:length(archivos_carga)) {
        
        
        cat("Analisis de Niveles - control_niveles02() - Base: ", archivos_carga[k], "\n")
        
        mi_archivo <- paste0(direccion_carpeta_completa, "/", archivos_carga[k])
        
        aver <-  control_niveles02(input_base = BASES_ORIGINALES[[k]], 
                                   input_base_niveles = BASES_NIVELES_ORIGINALES[[k]],
                                   mi_archivo = mi_archivo)
        
        
        # Guardamos el nuevo archivo
        contador_externo <- 0
        limite <- 4
        candado_interno <- aver[[1]]
        
        while(!candado_interno){
          
          contador_externo <- contador_externo + 1
          
          # Guardamos la base de niveles corregida
          write_xlsx( x = aver[[2]], path = mi_archivo)
          
          cat("Nuevos niveles guardados... \n")
          # La levantamos de nuevo...
          BASES_NIVELES_ORIGINALES[[k]] <- cargar_EXCEL(direccion_carpeta_completa  = direccion_carpeta_completa, 
                                                        archivos_carga = archivos_carga[k], input_hoja = 1)
          
          cat("Base de Niveles - Recargada... \n")
          BASES_NIVELES_ORIGINALES[[k]] <- BASES_NIVELES_ORIGINALES[[k]][[1]]
          
          # Volvemos a verificarla
          aver <-  control_niveles01(input_base = BASES_ORIGINALES[[k]], 
                                     input_base_niveles = BASES_NIVELES_ORIGINALES[[k]],
                                     mi_archivo = mi_archivo)
          
          candado_interno <- aver[[1]]
          
          if (contador_externo >= limite) candado_interno <- TRUE
        } 
      } # Fin control_niveles01()
      #########################################################################      
      
      
      
  ####################################################################################################
  
  # 5) Return
  
  objetos_salida <- list(BASES_NIVELES_ORIGINALES, candado003)
  
  return(objetos_salida)
  
  
  
}


Objetos_Salida_LoadNiveles_003 <-  LoadNiveles_003() 

BASES_NIVELES_ORIGINALES <- Objetos_Salida_LoadNiveles_003[[1]]
candado_003 <- Objetos_Salida_LoadNiveles_003[[2]]

remove(Objetos_Salida_LoadNiveles_003)


}

# Cargamos bases de referencia