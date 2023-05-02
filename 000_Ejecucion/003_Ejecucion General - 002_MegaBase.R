



cat("*** Inicio Creación de MegaBases ***********", "\n\n")

# Armamos una "MegaBase"...
# Esto sera una lista... donde tiene, en primera instancia 
# los subgrupos de unidades hospitaralias
# luego los subgrupos de "Menores 1500" o "Mayores 1500"
# y ahi, las 4 bases de datos que se utilizan en cada caso.

# Creacion de MegaBase
MegaBase <- list()
for (llave_creadora in 1:length(nivel02)) MegaBase[[llave_creadora]] <- list()
names(MegaBase) <- nivel02
remove(llave_creadora)



# Nombres en las listas
for (llave_creadora1 in 1:length(MegaBase)) {
  for (llave_creadora2 in 1:length(nivel03)) {
    
    MegaBase[[llave_creadora1]][[llave_creadora2]] <- list()
  }
  names(MegaBase[[llave_creadora1]]) <- nivel03
} 



# Generacion de Bases para todos
{
  ###
  
  for (llave_creadora1 in 1:length(names(MegaFiltro))) {
    for (llave_creadora2 in 1:length(names(MegaFiltro[[llave_creadora1]]))) {
      
      
      # Guardamos el filtro
      este_mega_filtro <- MegaFiltro[[llave_creadora1]][[llave_creadora2]]
      
      BASE_MOD_ORIGINAL <- BasesPristinas$`Base Mod Original`[este_mega_filtro, ]
      BASE_MOD_IPT <- BasesPristinas$`Base Mod IPT`[este_mega_filtro, ]
      BASE_MOD_IC <- BasesPristinas$`Base Mod IC` [este_mega_filtro, ]
      BASE_MOD_RECAT <- BasesPristinas$`Base Mod Recategorizada` [este_mega_filtro, ]
      
      
      MegaBase[[llave_creadora1]][[llave_creadora2]] <- list(BASE_MOD_ORIGINAL, BASE_MOD_IPT, BASE_MOD_IC, BASE_MOD_RECAT)
      
      names(MegaBase[[llave_creadora1]][[llave_creadora2]]) <- c("BASE_MOD_ORIGINAL", "BASE_MOD_IPT", "BASE_MOD_IC", "BASE_MOD_RECAT")
      remove(este_mega_filtro, BASE_MOD_ORIGINAL, BASE_MOD_IPT, BASE_MOD_IC, BASE_MOD_RECAT)            
      # cat("------------ FILTRO APLICADO --------------------\n\n")
      
    } # Fin llave2
  } # Fin llave1
  
  ###  
} # Fin Bases para todos
###########################################################################


remove(llave_creadora1)
remove(llave_creadora2)

cat("*** Fin Creación de MegaBases ***********", "\n\n")



