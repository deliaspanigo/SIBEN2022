


cat("*************** INICIO - Ejecucion de Carga Minima - ***************", "\n", "\n")

### 1) Cargar librerias y funciones
source("../005_ScriptGeneral/001_LoadLibFunc.R", encoding = "UTF-8")


### 2) Cargar bases de datos y controles de bases originales
source("../005_ScriptGeneral/002_LoadData.R")


### 3) Cargar niveles de la base de datos y controles
source("../005_ScriptGeneral/003_LoadNiveles.R")


### 4) Cambio automatico de los niveles de la base de datos (si fuera necesario)
source("../005_ScriptGeneral/004_BasesModificadas.R")

### 5) Carga de Archivos Fijos (Unidades Hospitalarias y Valores Fenton)
source("../005_ScriptGeneral/005_LoadArchivosFijos.R")

### 6) Carga de Archivos de Referencia de Tablas y Graficos
source("../005_ScriptGeneral/006_LoadArchivosRef.R")



cat("*************** FIN - Ejecucion de Carga Minima - ***************", "\n", "\n")