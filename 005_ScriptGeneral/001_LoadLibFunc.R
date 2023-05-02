
#list.files("../003_LibyFunciones")

# Carga de Librerias
source("../003_LibyFunciones/001_libraries.R")

# Carga de la funcion EVA
source("../003_LibyFunciones/002_loadEVA.R")

# Carga de las funciones definidas en la carpeta "functions"
EVA01("../003_LibyFunciones/functions")

# Cargamos funciones escritas en otros formatos
source("../003_LibyFunciones/003_functions_part01.R")
source("../003_LibyFunciones/004_functions_part02.R")
source("../003_LibyFunciones/005_functions_part03.R")
source("../003_LibyFunciones/006_functions_part04.R")
source("../003_LibyFunciones/006_functions_part05.R")

# Cargamos textos automatizados
source("../003_LibyFunciones/006_textos_automatizados.R", encoding = "UTF-8")
