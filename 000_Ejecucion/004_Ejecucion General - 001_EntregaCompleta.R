

# Versiones de Entregas

cat("*** Inicio Creación de Carpetas para Entregas SIBEN (Documentacion + Estadisticas) ***********", "\n\n")

# Donde sera guardado el reporte
ubicacion_entrega <- "../016_EntregasSiben"

# Detalles intermedios
# numero_entrega <- length(list.files(ubicacion_reporte)) + 1
numero_entrega <- length(list.files(ubicacion_entrega)) + 1
orden_entrega <- GenNum(numero_entrega)


# Version de Entrega SIBEN
carpeta_entrega <- paste0("V",orden_entrega, " - Entrega SIBEN - ", date())
carpeta_entrega <- gsub(":", "_", carpeta_entrega)
dir_entrega <- paste0(ubicacion_entrega, "/", carpeta_entrega)
dir.create(dir_entrega)


# Copia de archivos

# Copia 1 a 3) Bases de Datos
dir_copia01 <- "../002_BasesOriginales"
ultima_version01 <- carpeta_UV(dir_copia01)
subtipo01 <- "001_EXCEL"
direccion_carpeta_completa01 <- paste0(dir_copia01, "/", ultima_version01, "/", subtipo01)
archivos_copia01 <- list.files(direccion_carpeta_completa01)

file.copy(file.path(direccion_carpeta_completa01, archivos_copia01), dir_entrega, overwrite = TRUE)

##########################################################################################################

# Copia 4) Base Recat
dir_copia04 <- "../006_BaseRecat/003_BaseRecat"
ultima_version04 <- carpeta_UV(dir_copia04)
subtipo04 <- "001_EXCEL"
direccion_carpeta_completa04 <- paste0(dir_copia04, "/", ultima_version04, "/", subtipo04)
archivos_copia04 <- list.files(direccion_carpeta_completa04)

file.copy(file.path(direccion_carpeta_completa04, archivos_copia04), dir_entrega, overwrite = TRUE)

##########################################################################################################


# Copia 5, 6 y 9) 
dir_copia05 <- "../014_Documentacion"
ultima_copia05 <- carpeta_UV(dir_copia05)
armado_dir_copia05 <- paste0(dir_copia05, "/", ultima_copia05)
archivos_copia05 <- list.files(armado_dir_copia05)

file.copy(file.path(armado_dir_copia05, archivos_copia05), dir_entrega, overwrite = TRUE)

##########################################################################################################




# Copia 7 y 8) 
dir_copia07 <- "../004_ArchivosFijos"
ultima_copia07 <- carpeta_UV(dir_copia07)
armado_dir_copia07 <- paste0(dir_copia07, "/", ultima_copia07)
archivos_copia07 <- list.files(armado_dir_copia07)

file.copy(file.path(armado_dir_copia07, archivos_copia07), dir_entrega, overwrite = TRUE)

##########################################################################################################



# Copia 10) 
dir_copia10 <- "../017_BaseFusion"
ultima_copia10 <- carpeta_UV(dir_copia10)
armado_dir_copia10 <- paste0(dir_copia10, "/", ultima_copia10)
archivos_copia10 <- list.files(armado_dir_copia10)

file.copy(file.path(armado_dir_copia10, archivos_copia10), dir_entrega, overwrite = TRUE)

##########################################################################################################

# Copia 11) 
dir_copia11 <- "../015_EstadisticasSIBEN"
ultima_copia11 <- carpeta_UV(dir_copia11)
armado_dir_copia11 <- paste0(dir_copia11, "/", ultima_copia11)
archivos_copia11 <- list.files(armado_dir_copia11)

# SIBEN 2021 - 25 de Mayo 2022
######################################################################################
# Cambie la forma de crear el directorio de entrega y de copiar los archivos
nuevo_modo <- paste0(dir_entrega, "/", "Estadisticas SIBEN - Tablas y Graficos")
dir.create(nuevo_modo)

R.utils::copyDirectory(from = armado_dir_copia11, to = nuevo_modo)
###########################################################################################
# 
# # # file.copy(armado_dir_copia10, dir_entrega, recursive = T)
# file.copy(from = armado_dir_copia11, to = dir_entrega,
#           overwrite = TRUE, recursive = TRUE,
#           copy.mode = TRUE)
# 
# file.copy(from = armado_dir_copia11, to = dir_entrega, recursive=TRUE)


# R.utils::copyDirectory(armado_dir_copia10, dir_entrega)
##########################################################################################################






cat("*** Fin Creación de Carpetas para Entregas SIBEN (Documentacion + Estadisticas) ***********", "\n\n")