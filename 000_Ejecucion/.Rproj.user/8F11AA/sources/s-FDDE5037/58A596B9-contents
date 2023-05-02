

# General carpeta graficos
general_graficos <- "../008_Graficos"

# Nombre de la carpeta
carpeta_graficos <- "graf"

# Listamos los archivos actuales
mis_archivos <- list.files(general_graficos)

# Vemos si esta la carpeta
dt_carpeta <- mis_archivos == carpeta_graficos

fusion_direccion <- paste0(general_graficos, "/", carpeta_graficos)



# Si está... la borramos...
if (sum(dt_carpeta) > 0) {
  listado_graficos <- list.files(fusion_direccion)
  
  estos_graficos <- paste0(fusion_direccion, "/", listado_graficos)
  
  unlink(estos_graficos, recursive=TRUE)

  dir.create(fusion_direccion)
  
  } else dir.create(fusion_direccion)



cat("Carpeta 'graf' reseteada... \n")