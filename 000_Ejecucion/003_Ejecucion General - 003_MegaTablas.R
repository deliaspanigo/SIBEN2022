
# Generacion de Tablas para todos
{
  ###
  
  for (llave_creadora1 in 1:length(names(MegaBase))) {
    for (llave_creadora2 in 1:length(names(MegaBase[[llave_creadora1]]))) {
      
      # Bases de Datos
      BASE_MOD_ORIGINAL <- MegaBase[[llave_creadora1]][[llave_creadora2]]$BASE_MOD_ORIGINAL
      BASE_MOD_IPT <- MegaBase[[llave_creadora1]][[llave_creadora2]]$BASE_MOD_IPT
      BASE_MOD_IC <- MegaBase[[llave_creadora1]][[llave_creadora2]]$BASE_MOD_IC
      BASE_MOD_RECAT <- MegaBase[[llave_creadora1]][[llave_creadora2]]$BASE_MOD_RECAT
      
      
      esquirla1 <- names(MegaBase)[llave_creadora1]
      esquirla2 <- names(MegaBase[[llave_creadora1]])[llave_creadora2]
      esquirla3 <- "001_Tablas"
      
      mi_mega_directorio <- paste0(dir_001, "/", esquirla1, "/", esquirla2 , "/", esquirla3)
      
      source("../011_Tablas/002_ScriptTablas_General/011_Tablas - 001_Objetos Iniciales.R", encoding = "UTF-8")
      
      source("../011_Tablas/002_ScriptTablas_General/011_Tablas - 002_Minibases Tablas.R", encoding = "UTF-8")
      
      source("../011_Tablas/002_ScriptTablas_General/011_Tablas - 003_Crear Tablas.R", encoding = "UTF-8")
      
      source("../011_Tablas/002_ScriptTablas_General/011_Tablas - 004_GuardarTablas.R", encoding = "UTF-8")
      
      #     remove(BASE_MOD_ORIGINAL, BASE_MOD_IPT, BASE_MOD_IC, BASE_MOD_Recategorizada)
      
    } # Fin llave2
  } # Fin llave1
  
  ###  
} # Fin Tablas para todos
###########################################################################
