


# Parametros generales
options(warn=2)  # treat warnings as errors
# options(encoding= "utf-8" )

# options("encoding" = getOption("encoding"))
habla_general <- TRUE

### 1) Librerias, Funciones y Carga Minima de archivos para cualquier accion
source("../000_Ejecucion/001_Ejecucion General - 001_Carga Minima.R", encoding = "UTF-8")


### 2) Carga base Recat
source("../000_Ejecucion/001_Ejecucion General - 002_Carga Recat.R", encoding = "UTF-8")


### 3) Creacion de las carpetas para un nuevo reporte
source("../000_Ejecucion/002_Ejecucion General - 001_Nueva Carpeta Entrega.R", encoding = "UTF-8")



### 4) Creacion del MegaFiltro
source("../000_Ejecucion/003_Ejecucion General - 001_MegaFiltro.R", encoding = "UTF-8")




### 5) Creacion del MegaBase
source("../000_Ejecucion/003_Ejecucion General - 002_MegaBase.R", encoding = "UTF-8")



### 6) Generacion de MegaTablas
source("../000_Ejecucion/003_Ejecucion General - 003_MegaTablas.R", encoding = "UTF-8")


### 7) Generacion de MegaGraficos
source("../000_Ejecucion/003_Ejecucion General - 004_MegaGraficos.R", encoding = "UTF-8")


### 8) Armado de entrega completa (Documentacion + Estadistcas)
source("../000_Ejecucion/004_Ejecucion General - 001_EntregaCompleta.R", encoding = "UTF-8")


