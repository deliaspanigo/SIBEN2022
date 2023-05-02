
# Creamos una funcion que cargue todas las bases de datos medicas originales
# y solo devuelva las bases importadas, y algunos carteles de funcionamiento 
# interno.

if (candado_006) {
LoadDataRecat_007 <- function(){
  
  
##############
  # # # Script: 002_LoadData.R
  # Lo que hace es cargar 3 bases de datos medicas, que son los pilares
  # de todo el trabajo.
  # Al final hay algunos retoques que se realizan sobre algunas columnas en 
  # particular.
  
  # Detalles para la inportacion...
  direccion_general_carga <- "../006_BaseRecat/003_BaseRecat"
  ultima_version <- carpeta_UV(direccion_general_carga)
  subtipo <- "002_CSV"
  direccion_carpeta_completa <- paste0(direccion_general_carga, "/", ultima_version, "/", subtipo)
  
  # Archivos que seran cargados
  archivos_carga <- c("004_Base_RECAT.csv")
  
  # Mensajes armados para acompaniar la salida...
  mensaje_armado <- "Archivo de Script General - 007_LoadDataRecat.R"
  cat(mensaje_armado, "\n")
  
  # Controlamos que los archivos se encuentran en la carpeta
  seguimos <- control003(direccion_carpeta_completa  = direccion_carpeta_completa, 
                         archivos_carga = archivos_carga)
  
  # Si los archivos no estan, la funcion se detiene
  if(!seguimos) stop()
  
  # Armamos una lista
  BASE_RECAT <- cargar_CSV(direccion_carpeta_completa  = direccion_carpeta_completa, 
                                 archivos_carga = archivos_carga)[[1]]
  
  
  


###############################################################################################
# 4) Controles de alineado

# Control de alineado entre las bases de datos

# El alineado es para verificar que los archivos poseen:
# la misma cantidad de filas.


  
  # Control de alineado 1 de 2
  cat("Control de Alineacion de filas 1 de 2: BASE_ORIGINAL y BASE_IPT\n")
  candado_007 <- control_alineado_filas(input_b1 = BASES_ORIGINALES[[1]], input_b2 = BASES_ORIGINALES[[2]],
                                        input_speak = T, input_laststep = NULL, input_myreturn = TRUE)




################################################################################################
# 5) Return

  mi_salida <- list(candado_007, BASE_RECAT)
return(mi_salida)

}


Objetos_Salida_LoadDataRecat_007 <- LoadDataRecat_007() 

candado_007 <- Objetos_Salida_LoadDataRecat_007[[1]]
BASE_RECAT <- Objetos_Salida_LoadDataRecat_007[[2]]


remove(Objetos_Salida_LoadDataRecat_007)
}
# Cargamos bases de referencia