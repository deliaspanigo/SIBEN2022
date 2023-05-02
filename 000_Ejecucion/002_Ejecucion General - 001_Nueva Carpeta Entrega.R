

# Versiones de Informe


cat("*************** INICIO - Creación de Carpetas para Entregas - ***************", "\n", "\n")


# Donde sera guardado el reporte
ubicacion_reporte <- "../015_EstadisticasSIBEN"

# Detalles intermedios
numero_entrega <- length(list.files(ubicacion_reporte)) + 1
orden_entrega <- GenNum(numero_entrega)


# Niveles de carpetas
nivel01 <- paste0("V",orden_entrega, " - Estadisticas SIBEN - ", date())
nivel01 <- gsub(":", "_", nivel01)
nivel02 <- colnames(BASE_ref_unidades_hospitalarias)[5:ncol(BASE_ref_unidades_hospitalarias)]
nivel03 <- c("001_Menores 1500", "002_Mayores 1500")
nivel04 <- c("001_Tablas", "002_Graficos")


dir_001 <- paste0(ubicacion_reporte, "/", nivel01)
for (llave_creadora in 1:length(dir_001)) dir.create(dir_001[llave_creadora])
remove(llave_creadora)

dir_002 <- paste0(dir_001, "/", nivel02)
for (llave_creadora in 1:length(dir_002)) dir.create(dir_002[llave_creadora])
remove(llave_creadora)

dir_003 <- paste0(dir_002[c(1,1,2,2,3,3)], "/", nivel03)
for (llave_creadora in 1:length(dir_003)) dir.create(dir_003[llave_creadora])
remove(llave_creadora)

dir_004 <- paste0(dir_003[c(1,1,2,2,3,3,4,4,5,5,6,6)], "/", nivel04)
for (llave_creadora in 1:length(dir_004)) dir.create(dir_004[llave_creadora])
remove(llave_creadora)

dir_005 <- paste0(dir_004[c(F,T)], "/", "003_Graficos_Individuales")
for (llave_creadora in 1:length(dir_005)) dir.create(dir_005[llave_creadora])
remove(llave_creadora)


cat("Carpetas credas con éxito!", "\n")
cat("*************** FIN - Creación de Carpetas para Entregas  ***************", "\n", "\n")


