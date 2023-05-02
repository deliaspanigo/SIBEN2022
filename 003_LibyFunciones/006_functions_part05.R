


control001 <- function(direccion_carpeta_completa  = direccion_carpeta_completa, 
                       archivos_carga = archivos_carga){
  
  
  cantidad_maxima_esperada <- length(archivos_carga)
  
  archivos_observados <- list.files(direccion_carpeta_completa)
  
  
  dt_control001 <- identical(archivos_observados, archivos_carga)
  
  # Si hay algun error...
  if(!dt_control001){
    cat("*** Control001 - Funcion: control001()", "\n",
        "\t","En la direccion especificada no se encuentran todos los archivos", "\n",
        "\t","que deben ser importados o hay archivos de más.", "\n",
        "\t","La carpeta solo debe contener 3 archivos, que son:", "\n",
        "\t","001_Base_Original.csv", "\n", 
        "\t","002_Base_IPT.csv", "\n",
        "\t","003_Base_IC.csv", "\n", "\n", "\n")

  }
  
  
  # Si esta todo bien...
  if(dt_control001){
    cat("*** Control001 - Funcion: control001() - TODO OKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK", "\n",
        "\t","En la direccion especificada se encontraron perfectamente", "\n",
        "\t","los tres archivos que seran importados:", "\n",
        "\t","001_Base_Original.csv", "\n", 
        "\t","002_Base_IPT.csv", "\n",
        "\t","003_Base_IC.csv", "\n", "\n", "\n")
    
  }
  
  return(dt_control001)
  
  
}







control002 <- function(direccion_carpeta_completa  = direccion_carpeta_completa, 
                       archivos_carga = archivos_carga){
  
  
  cantidad_maxima_esperada <- length(archivos_carga)
  
  archivos_observados <- list.files(direccion_carpeta_completa)
  
  
  dt_control002 <- identical(archivos_observados, archivos_carga)
  
  # Si hay algun error...
  if(!dt_control002){
    cat("*** Control002 - Funcion: control002()", "\n",
        "\t","En la direccion especificada no se encuentran todos los archivos", "\n",
        "\t","que deben ser importados o hay archivos de más.", "\n",
        "\t","La carpeta solo debe contener 3 archivos, que son:", "\n",
        "\t","001_BE_Niveles Base Original.xlsx", "\n", 
        "\t","002_BE_Niveles IPT.xlsx", "\n",
        "\t","003_BE_Niveles IC.xlsx", "\n", "\n", "\n")
    
  }
  
  
  # Si esta todo bien...
  if(dt_control002){
    cat("*** Control001 - Funcion: control002() - TODO OKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK", "\n",
        "\t","En la direccion especificada se encontraron perfectamente", "\n",
        "\t","los tres archivos que seran importados:", "\n",
        "\t","001_BE_Niveles Base Original.xlsx", "\n", 
        "\t","002_BE_Niveles IPT.xlsx", "\n",
        "\t","003_BE_Niveles IC.xlsx", "\n", "\n", "\n")
    
  }
  
  return(dt_control002)
  
  
}




#################



control003 <- function(direccion_carpeta_completa  = direccion_carpeta_completa, 
                       archivos_carga = archivos_carga){
  
  
  cantidad_maxima_esperada <- length(archivos_carga)
  
  archivos_observados <- list.files(direccion_carpeta_completa)
  
  
  dt_control001 <- identical(archivos_observados, archivos_carga)
  
  # Si hay algun error...
  if(!dt_control001){
    cat("*** Control001 - Funcion: control003()", "\n",
        "\t","En la direccion especificada no se encuentran el archivo", "\n",
        "\t","que debe ser importados o hay archivos de más.", "\n",
        "\t","La carpeta solo debe contener 1 archivo, que es:", "\n",
        "\t","004_Base_RECAT.csv", "\n", "\n")
    
  }
  
  
  # Si esta todo bien...
  if(dt_control001){
    cat("*** Control001 - Funcion: control002() - TODO OKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK", "\n",
        "\t","En la direccion especificada se encontro perfectamente", "\n",
        "\t","el archivo que sera importado:", "\n",
        "\t","004_Base_RECAT.csv", "\n", 
        "\t","002_Base_IPT.csv", "\n",
        "\t","003_Base_IC.csv", "\n", "\n", "\n")
    
  }
  
  return(dt_control001)
  
  
}







control004 <- function(direccion_carpeta_completa  = direccion_carpeta_completa, 
                       archivos_carga = archivos_carga){
  
  
  cantidad_maxima_esperada <- length(archivos_carga)
  
  archivos_observados <- list.files(direccion_carpeta_completa)
  
  
  dt_control004 <- identical(archivos_observados, archivos_carga)
  
  # Si hay algun error...
  if(!dt_control004){
    cat("*** Control002 - Funcion: control004()", "\n",
        "\t","En la direccion especificada no se encuentra el archivo", "\n",
        "\t","que debe ser importado o hay archivos de más.", "\n",
        "\t","La carpeta solo debe contener 1 archivo, que es:", "\n",
        "\t","004_Niveles_de_Recategorizadas.xlsx", "\n", "\n")
    
  }
  
  
  # Si esta todo bien...
  if(dt_control004){
    cat("*** Control004 - Funcion: control004() - TODO OKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK", "\n",
        "\t","En la direccion especificada se encontro perfectamente", "\n",
        "\t","el archivo que sera importado:", "\n",
        "\t","004_Niveles_de_Recategorizadas.xlsx", "\n", "\n")
    
  }
  
  return(dt_control004)
  
  
}




