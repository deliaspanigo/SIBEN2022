
# Creamos una funcion que cargue todos las bases de referencia
# que tenemos para la resolucion de tablas y graficos


if (candado_005) {
LoadArchivosRef_006 <- function(){
  
  
  # Tenemos un mensaje de referencia...
  mensaje_armado <- "Carga de Referencia para Tablas - 006_LoadArchivosRef"
  cat(mensaje_armado, "\n")
  
  
  # Detalles para la importacion...
  direccion_general_carga01 <- "../011_Tablas/001_ModelosTablas"
  ultima_version01 <- carpeta_UV(direccion_general_carga01)
  direccion_carpeta_completa01 <- paste0(direccion_general_carga01, "/", ultima_version01)
  
  # Archivos que seran cargados
  archivos_carga01 <- c("000_Tablas y Minibases.xlsx")

  
  # 1) Referencia de Tablas
  ref_tablas <- cargar_EXCEL(direccion_carpeta_completa  = direccion_carpeta_completa01, 
                                           archivos_carga = archivos_carga01[1], input_hoja = 1)[[1]]
  
  
  
  
  # Detalles para la importacion...
  direccion_general_carga02 <- "../012_Graficos/001_ModelosGraficos"
  ultima_version02 <- carpeta_UV(direccion_general_carga02)
  direccion_carpeta_completa02 <- paste0(direccion_general_carga02, "/", ultima_version02)
  
  # Archivos que seran cargados
  archivos_carga02 <- c("000_Graficos y Minibases.xlsx")
  
  # 1) Referencia de Tablas
  ref_graficos <- cargar_EXCEL(direccion_carpeta_completa  = direccion_carpeta_completa02, 
                             archivos_carga = archivos_carga02[1], input_hoja = 1)[[1]]
  
  
  # De onda... El candado es TRUE, por que no hay control de nada.
  candado006 <- T
  
  # Juntamos todos en un combinadito...
  combinadito <- list(candado006, ref_tablas, ref_graficos)
  
  
  # Sale el combinadito...
  return(combinadito)
  
  
  
  
}

# Los captamos, y las separamos...
combinadito <- LoadArchivosRef_006()
candado_006 <- combinadito[[1]]
ref_tablas <- combinadito[[2]]
ref_graficos <- combinadito[[3]]

remove(combinadito)
}