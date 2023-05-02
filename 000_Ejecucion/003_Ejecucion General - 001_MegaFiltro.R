


cat("*************** INICIO - Megafiltro - ***************", "\n", "\n")




# Armamos una "MegaFiltro"...
# Esto sera una lista... donde tiene, en primera instancia 
# los subgrupos de unidades hospitaralias
# y luego dentro dos bases, segun sea "Menores 1500" o "Mayores 1500".


BasesPristinas <- list(BASE_MOD_ORIGINAL, BASE_MOD_IPT, BASE_MOD_IC, BASE_MOD_RECAT)
names(BasesPristinas) <- c("Base Mod Original", "Base Mod IPT", "Base Mod IC", "Base Mod Recategorizada")

# Creacion de MegaFiltro
MegaFiltro <- list()
for (llave_creadora in 1:length(nivel02)) MegaFiltro[[llave_creadora]] <- list()
names(MegaFiltro) <- nivel02
remove(llave_creadora)

# Nombres en las listas
for (llave_creadora1 in 1:length(MegaFiltro)) {
  for (llave_creadora2 in 1:length(nivel03)) {
    
    MegaFiltro[[llave_creadora1]][[llave_creadora2]] <- list()
  }
  names(MegaFiltro[[llave_creadora1]]) <- nivel03
} 
remove(llave_creadora1, llave_creadora2)


# Generacion de Filtros para todos
{
  ###
  
  for (llave_creadora1 in 1:length(names(MegaFiltro))) {
    for (llave_creadora2 in 1:length(names(MegaFiltro[[llave_creadora1]]))) {
      
      
      # Filtro 1 - Unidades Hospitalarias
      detalle_seleccion_unidades <- BASE_ref_unidades_hospitalarias[names(MegaFiltro)[llave_creadora1]]
      dt_unidades_si <- detalle_seleccion_unidades == "SI"
      estas_unidades_si <- BASE_ref_unidades_hospitalarias[dt_unidades_si,2]
      
      solo_unidades_base <- BasesPristinas$`Base Mod Original`["Hospital"]
      mega_filtro1 <- rep(FALSE, nrow(BasesPristinas$`Base Mod Original`))
      
      for (llave_creadora3 in 1:length(estas_unidades_si)) {
        
        dt_hospital <- solo_unidades_base == estas_unidades_si[llave_creadora3]
        dt_hospital[is.na(dt_hospital)] <- FALSE
        
        mega_filtro1[dt_hospital]  <- TRUE        
        
      } # Fin llave3
      remove(llave_creadora3)
      
      
      # Filtro 2 - Grupos de peso
      solo_categorias_base <- BasesPristinas$`Base Mod Recategorizada`["recat_criterio_seleccion6"]
      
      categorias_posibles <- c("Menor 1500", "Mayor 1500")
      
      mega_filtro2 <- rep(FALSE, nrow(BasesPristinas$`Base Mod Original`))
      dt_categoria_posible <- solo_categorias_base == categorias_posibles[llave_creadora2]
      dt_categoria_posible[is.na(dt_categoria_posible)] <- FALSE
      mega_filtro2[dt_categoria_posible] <- T
      
      
      # Filtro 3 - Fusion de Filtros
      mega_filtro3 <- (as.numeric(mega_filtro1) + as.numeric(mega_filtro2)) == 2 
      
      
      
      # Guardamos el filtro
      MegaFiltro[[llave_creadora1]][[llave_creadora2]] <- mega_filtro3
      
      # BASE_MOD_ORIGINAL <- BasesPristinas$`Base Mod Original`[mega_filtro3, ]
      # BASE_MOD_IPT <- BasesPristinas$`Base Mod IPT`[mega_filtro3, ]
      # BASE_MOD_IC <- BasesPristinas$`Base Mod IC` [mega_filtro3, ]
      # BASE_MOD_Recategorizada <- BasesPristinas$`Base Mod Recategorizada` [mega_filtro3, ]
      # cat("------------ FILTRO APLICADO --------------------\n\n")
      
      remove(mega_filtro3)
      
    } # Fin llave2
  } # Fin llave1
  
  ###  
} # Fin Filtros para todos
###########################################################################

remove(llave_creadora1, llave_creadora2)


cat("Megafiltros creados con éxito!", "\n")


cat("*************** FIN - MegaFiltros  ***************", "\n", "\n")
