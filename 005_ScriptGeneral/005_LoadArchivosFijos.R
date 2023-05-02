
# Creamos una funcion que cargue todos las bases fijas y haga controles.
# Esto implica:
# - Unidades Hospitalarias
# - Valores Fenton de Peso
# - Valores Fenton de Perimetro Cefalico


if (candado_004) {
LoadArchivosFijos_005 <- function(){
  
  
  # # # Script: 005_LoadArchivosFijos.R
  # Creamos una funcion que cargue todos las bases fijas y haga controles.
  # Esto implica:
  # - Unidades Hospitalarias
  # - Valores Fenton de Peso
  # - Valores Fenton de Perimetro Cefalico
  
  # Detalles para la importacion...
  direccion_general_carga <- "../004_ArchivosFijos"
  ultima_version <- carpeta_UV(direccion_general_carga)
  direccion_carpeta_completa <- paste0(direccion_general_carga, "/", ultima_version)
  
  # Archivos que seran cargados
  archivos_carga <- c("007_Unidades Hospitalarias.xlsx", "008_Fenton General.xlsx")
  
  # Mensajes armados para acompaniar la salida...
  mensaje_armado <- "Archivo de Script General - 005_LoadArchivosFijos.R"
  cat(mensaje_armado, "\n")
  
  
  
  # Armamos una lista
  REJUNTE_BASES_FIJAS <- list()
  
    # 1) Unidades Hospitalarias
    REJUNTE_BASES_FIJAS[[1]] <- cargar_EXCEL(direccion_carpeta_completa  = direccion_carpeta_completa, 
                                             archivos_carga = archivos_carga[1], input_hoja = 1)
    
  
    
    # 2) Valores Fenton Peso
    REJUNTE_BASES_FIJAS[[2]] <- cargar_EXCEL(direccion_carpeta_completa  = direccion_carpeta_completa, 
                                             archivos_carga = archivos_carga[2], input_hoja = 1)
  
    
    
    # 3) Valoes Fenton Cefalico
    REJUNTE_BASES_FIJAS[[3]] <- cargar_EXCEL(direccion_carpeta_completa  = direccion_carpeta_completa, 
                                             archivos_carga = archivos_carga[2], input_hoja = 2)
    
  
    
    # # # # # # # # # # # # # #
    # Comprobamos si hay hospitales nuevos o no...
    control_unidades(input_base = BASES_ORIGINALES[[1]], input_ref = REJUNTE_BASES_FIJAS[[1]][[1]])
    
    
    
    
    
  # Salida...
    
    # De onda... El candado es TRUE, por que no hay control de nada.
    candado005 <- T
    mi_salida <- list(REJUNTE_BASES_FIJAS, candado005)
    return(mi_salida)
    
    
}

# Los captamos, y las separamos...
REJUNTE_BASES_FIJAS <- LoadArchivosFijos_005()

BASE_ref_unidades_hospitalarias <- REJUNTE_BASES_FIJAS[[1]][[1]][[1]]
BASE_ref_Fenton_Peso  <- REJUNTE_BASES_FIJAS[[1]][[2]][[1]]
BASE_ref_Fenton_PC  <- REJUNTE_BASES_FIJAS[[1]][[3]][[1]]

candado_005 <- REJUNTE_BASES_FIJAS[[2]]

remove(REJUNTE_BASES_FIJAS)

}
