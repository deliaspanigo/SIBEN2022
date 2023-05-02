
# Otras funciones
###################




# Funcion para cargar archivos xls, como yo quiero...
carga_xls <- function(input_archivo = NULL, input_hoja = 1) {
  
 # input_archivo <- "../003_BasesNiveles/V001_10 de Febrero 2021/001_BE_Niveles Base Original.xlsx"
  #list.files("../003_BasesNiveles")
  # # # Detalle:
  # La funcion "carga_xls()", permite importar solo una hoha de un excel.
  # Por defecto, la primera.
  # En la importacion respetara textualmente el nombre de las columnas del archivo original.
  # R normalmente pone puntos en los espacios de las columnas, y esos puntos
  # aparecen en los graficos y las tablas. Lo que hicimos aqui fue cancelar
  # esa modificacion de R para que los graficos y tablas tengan el detalle
  # textual que fue escrito en la base".
  
  # Libreria
  library(readxl)
  
  # Mi archivo  
  output_archivo <- strsplit(input_archivo, "/")[[1]]
  output_archivo <- output_archivo[length(output_archivo)]
  
  # Cargamos la base completa
  # Le quitamos los avisos
  suppressWarnings({
  #  BASE_XLS <- as.data.frame(read_excel(input_archivo, col_names= TRUE, sheet = input_hoja, trim_ws = FALSE))
    BASE_XLS <- as.data.frame(suppressWarnings(read_excel(input_archivo)))
  })
  
  # Cargamos solo el nombre de las columnas
  nombres_columnas <- as.vector(as.matrix(as.data.frame(
    suppressWarnings(read_excel(path = input_archivo, col_names = F, n_max = 1)))))
  
  # Cambiamos el nombre de las columnas por el original tal cual
  # lo tiene el archivo
  colnames(BASE_XLS) <- nombres_columnas
  
  
  # # Modo Beta de Carga de datos
  # if (!is.null(input_modo_beta)) if (input_modo_beta){
  #   
  #   # Si entra aqui, es que la base debe ser cargada contemplado que todo es datos
  #   # incluso la primera fila.
  #   suppressWarnings({
  #    
  #     BASE_XLS <- as.data.frame(suppressWarnings(read_excel(path = input_archivo, col_names = F)))
  #   })
  # }
  
  # # # NOTA - NOTA - NOTA
  # En algun momento hay que agregar unas sentencias, por que a veces detecta mas
  # filas o mas columnas que estan vacias.
  # Mientras tanto, esto funciona bien.
 
  SALIDA <- list()
  SALIDA[[1]] <- output_archivo
  SALIDA[[2]] <- BASE_XLS
  
  return(SALIDA)
  
}



# Funcion para cargar un archivo (xlsx) de la ultima version (carpeta)
cargar_archivoUV <- function(input_direccion = NULL, input_pos_archivo = NULL, 
                             input_archivo_esperado = NULL, input_mensaje = NULL,
                             input_hoja = 1, input_formato = "Excel", 
                             input_speak = T, input_laststep = FALSE, input_myreturn = TRUE, ...){
  
  
  # input_direccion = "../011_Tablas/001_ModelosTablas"
  # input_pos_archivo = NULL
  # input_archivo_esperado = "000_Tablas y Minibases.xlsx"
  # input_mensaje = "Hola hola hola"
  # input_hoja <- 1
  # input_speak = T
  # input_laststep = TRUE
  # input_myreturn = TRUE
  
  # Valor por defecto de return...
  my_final_return <- NULL
  
  # Si el paso anterior estuvo OKKKKKKKKKKK
  if (input_laststep) {
    
  # Control General
  controles <- TRUE
  
  # Control 1) Tiene que estar detallado el nombre del archivo a importar...
  if (is.null(input_archivo_esperado)) {
    controles <- FALSE
    cat("En cargar_archivoUV() falta detallar el nombre completo
        del archivo que se desea importar en el argumento 'input_archivo_esperado'.", "\n")
    
    # Cambiamos el return
    my_final_return <- FALSE
  }
  

  
  if (controles) {
  
  # # # Detalle:
  # Lo que hacemos es darle la direccion de una carpeta, y dentro de esta
  # encontramos a V001, V002, V003, ... V011 como carpetas.
  # Entonces se va a ir a la ultima carpeta (ultima version).
  # Por defecto de esa carpeta va a cargar el ultimo archivo, pero hemos agrgado
  # la posibilidad en un argumento de indicar un archivo en particular o varios
  # archivos que deben ser cargados.
  

  ############################################################################################
  # 1) Detectamos la ultima version (carpeta)
  versiones_carpetas <- list.files(input_direccion)
  ultima_version_carpeta <- versiones_carpetas[length(versiones_carpetas)]
  carpeta_especifica_bases <- paste0(input_direccion, "/", ultima_version_carpeta)
  
  
  
  ###########################################################################################
  # 2) Control del nombre y cantidad de los archivos
  # Si o si se establecio ya el nombre del archivo que se quiere cargar.
  # y se dio ademas la posicion de ese archivo en la carpeta (si se dio NULL, 
  # se trabaja por defecto como el ultimo archivo).
  # Si no coincide el nombre o la posicion, hay mensajes de error y no sigue 
  # trabajando la funcion.
  
  
  # Archivos observados totales
  archivos_observados <- list.files(carpeta_especifica_bases)
  
  # Un archivo observado en una posicion en particular
  if(is.null(input_pos_archivo)) esta_posicion <- length(archivos_observados) else esta_posicion <- input_pos_archivo
  archivo_observado <- archivos_observados[esta_posicion]
  
  # Archivo esperado
  archivo_esperado <- input_archivo_esperado
  
  # Veamos si lo esperado y lo observado coinciden
  dt_control_bases <- identical(archivo_esperado, archivo_observado)
  
  
  # Si coinciden el detalle de esperado y observado
  if(dt_control_bases) {
   
    # Si es un archivo Excel...
    if(input_formato == "Excel") {
      
    # Cargamos la base de datos
    library(readxl)
    
    
    # Cargamos la base de referencia de Tablas
    este_archivo <- paste0(carpeta_especifica_bases, "/", archivo_observado)
   # ref_Tablas <-  as.data.frame(suppressWarnings(read_excel(este_archivo)))
    BASE_CARGADA <- carga_xls(input_archivo = este_archivo, input_hoja = 1)[[2]]
    remove(este_archivo)
   
    # Damos un mensaje de exito
    cat("Funcion cargar_archivoUV()", "\n",
        input_mensaje, "\n",
        "Base a importar: ", archivo_observado, "\n",
        "Hoja: ", input_hoja, "\n",
        "Carpeta Ultima version: ", ultima_version_carpeta, "\n",
        "Control de existencia del archivo: OKKKKKKKKKKKKKKKKKKKKKKKKKK", "\n",
        "Base '", archivo_observado, "' cargada exitosamente.", "\n", "\n")
     
    
    } # Fin Si es Excel...
    
    
    if (input_formato == "CSV") {
      
      
       
      # Cargamos la base de referencia de Tablas
      este_archivo <- paste0(carpeta_especifica_bases, "/", archivo_observado)
      # ref_Tablas <-  as.data.frame(suppressWarnings(read_excel(este_archivo)))
      BASE_CARGADA <- read.csv(file = este_archivo, header = T, stringsAsFactors = F, sep = ";", dec = ".",
                               na.strings = "")
      
      
      
      
      # Cargamos solo el nombre de las columnas
      nombres_columnas <- as.character(as.vector(as.matrix(read.csv(file = este_archivo,
                          header = F, stringsAsFactors = F, sep = ";", dec = ".", nrows = 1,
                          na.strings = ""))))
      
      # Cambiamos el nombre de las columnas por el original tal cual
      # lo tiene el archivo
      colnames(BASE_CARGADA) <- nombres_columnas
      
      
      
      remove(este_archivo)
      
      # Damos un mensaje de exito
      cat("Funcion cargar_archivoUV()", "\n",
          input_mensaje, "\n",
          "Base a importar: ", archivo_observado, "\n",
          "Carpeta Ultima version: ", ultima_version_carpeta, "\n",
          "Control de existencia del archivo: OKKKKKKKKKKKKKKKKKKKKKKKKKK", "\n",
          "Base '", archivo_observado, "' cargada exitosamente.", "\n", "\n")
      
      
    } # Fin si es "CSV"
    
    
    # Cambiamos el return
    my_final_return <- TRUE
    
  } # Fin si paso todos los controles...
  
  
  
  
  
  # Si no coinciden los archivos esperados y observados
  if(!dt_control_bases){
    cat("####### Error en carga_archivoUV()", "\n",
        input_mensaje, "\n",
        "Direccion completa: ", carpeta_especifica_bases, "\n",
        "Ultima version: ", ultima_version, "\n",
        "Control de nombre de bases: ERROR!!!!!!", "\n", "\n",
        "En la posicion ", input_pos_archivo, " se espera encontrar","\n",
        " el archivo llamado '", input_archivo_esperado, "' y eso no paso.", "\n",
        " Verifique tanto el nombre como la posicion del archivo en la carpeta", "\n")
    
    
    # Cambiamos el return
    my_final_return <- FALSE
    
  }
  
  
  
 
  
  ########################################################################################
  # 4) Return
  
  
  if(input_myreturn == TRUE) {
  objetos_salida <- list(BASE_CARGADA, my_final_return)
  
  return(objetos_salida)
  }
  
  if(input_myreturn == FALSE) {
    return(BASE_CARGADA)
  }
  
  } # Fin controles
  
  }
  
}



# Funcion para verificar las versiones de entre dos carpetas...
ControlVersionesCarpetas <- function(input_dir1 = NULL, input_dir2 = NULL, input_texto = NULL) {
  
  
  archivos1 <- list.files(input_dir1)
  archivos2 <- list.files(input_dir2)
  
  dt_versiones <- identical(archivos1, archivos2)
  
  # Si esta todo OK entre las versiones...
  if (dt_versiones) {
    
    cat("**** Control de Versiones  de: ", input_texto, "\n",
        "Todo OKKKKKKKKKKK!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!", "\n", 
        "Las mismas versiones están en formato XLS y CSV.", "\n",
        "Todo OKKKKKKKKKKK!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!", "\n","\n")
    
    
  }
  
  
  # Si hay algun problema...
  if (!dt_versiones) {
    
    cat("**** Control de Versiones  de: ", input_texto, "\n",
        "PROBLEMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM!!!!!!!!!!!!!!!", "\n",
        "Revisar las versiones de XLS y CSV", "\n")
    
    
  }
  
  
}

