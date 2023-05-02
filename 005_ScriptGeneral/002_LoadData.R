
# Creamos una funcion que cargue todas las bases de datos medicas originales
# y solo devuelva las bases importadas, y algunos carteles de funcionamiento 
# interno.

LoadData_002 <- function(){
  
  library(readxl)
  # # # Script: 002_LoadData.R
  # Lo que hace es cargar 3 bases de datos medicas, que son los pilares
  # de todo el trabajo.
  # Al final hay algunos retoques que se realizan sobre algunas columnas en 
  # particular.
  
  # Detalles para la inportacion...
  direccion_general_carga <- "../002_BasesOriginales"
  ultima_version <- carpeta_UV(direccion_general_carga)
  subtipo <- "002_CSV"
  direccion_carpeta_completa <- paste0(direccion_general_carga, "/", ultima_version, "/", subtipo)
  
  # Archivos que seran cargados
  archivos_carga <- c("001_Base_Original.csv", "002_Base_IPT.csv", "003_Base_IC.csv")

  # Mensajes armados para acompaniar la salida...
  mensaje_armado <- "Archivo de Script General - 002_LoadData.R"
  cat(mensaje_armado, "\n")
  
  # Controlamos que los archivos se encuentran en la carpeta
  seguimos <- control001(direccion_carpeta_completa  = direccion_carpeta_completa, 
                         archivos_carga = archivos_carga)
  
  # Si los archivos no estan, la funcion se detiene
  if(!seguimos) stop()
  
  # Armamos una lista
  BASES_ORIGINALES <- cargar_CSV(direccion_carpeta_completa  = direccion_carpeta_completa, 
                                 archivos_carga = archivos_carga)
  
  
#####################################################################  


# # # Modificaciones minimas sobre la base de datos original
# 1) Columna G
esta_columna <- let2num("G")
mini <- BASES_ORIGINALES[[1]][, esta_columna]

for ( k in 1:length(mini)) if (!is.na(mini[k])) if (mini[k] == "-") mini[k] <- NA

BASES_ORIGINALES[[1]][, esta_columna] <- mini

remove(mini, esta_columna, k)
##############      ##############      ##############      ##############      ##############



# 2) Columna H
esta_columna <- let2num("H")
mini <- BASES_ORIGINALES[[1]][, esta_columna]

for ( k in 1:length(mini)) if (!is.na(mini[k])) if (mini[k] == "-") mini[k] <- NA

BASES_ORIGINALES[[1]][, esta_columna] <- mini


remove(mini, esta_columna, k)
##############      ##############      ##############      ##############      ##############


# 3) Columna AC
esta_columna <- let2num("AC")
mini <- BASES_ORIGINALES[[1]][, esta_columna]

for ( k in 1:length(mini)) if (!is.na(mini[k])) if (mini[k] == "Forceps") mini[k] <- "Vaginal"

BASES_ORIGINALES[[1]][, esta_columna] <- mini


remove(mini, esta_columna, k)
##############      ##############      ##############      ##############      ##############




###############################################################################################
# 4) Controles de alineado

# Control de alineado entre las bases de datos

# El alineado es para verificar que los archivos poseen:
# la misma cantidad de filas.


# Control de alineado 1 de 2
cat("Control de Alineacion de filas 1 de 2: BASE_ORIGINAL y BASE_IPT\n")
candado_002 <- control_alineado_filas(input_b1 = BASES_ORIGINALES[[1]], input_b2 = BASES_ORIGINALES[[2]],
                     input_speak = T, input_laststep = NULL, input_myreturn = TRUE)


# Control de alineado 2 de 2
cat("Control de Alineacion de filas 2 de 2: BASE_ORIGINAL y BASE_IC\n")
candado_002 <- control_alineado_filas(input_b1 = BASES_ORIGINALES[[1]], input_b2 = BASES_ORIGINALES[[3]],
                       input_speak = T, input_laststep = candado_002, input_myreturn = TRUE)  


################################################################################################
# 5) Return

objetos_salida <- list(BASES_ORIGINALES, candado_002)

return(objetos_salida)

}


Objetos_Salida_LoadData_002 <- LoadData_002() 

BASES_ORIGINALES <- Objetos_Salida_LoadData_002[[1]]
candado_002 <- Objetos_Salida_LoadData_002[[2]]

remove(Objetos_Salida_LoadData_002)
# Cargamos bases de referencia