

library(xlsx)
library(rJava)


# SIBEN 2021 - 25 de Mayo 2021
#########################################################################################################
# Para las tablas agrego el detalle del nombre del grupo y subgrupo al cual se estan realizando.
modificacion01 <- strsplit(esquirla1, "_")[[1]]
modificacion01 <- paste0(modificacion01[2:length(modificacion01)], collapse = "")

modificacion02 <- strsplit(esquirla2, "_")[[1]][2]
modificacion03 <- paste0(modificacion01, " - ", modificacion02)
###################################################################################################

# Cargamos cada parte del trabajo
direccion <- "../011_Tablas/003_ScriptCadaTabla"
archivos <- list.files(direccion)
orden_archivos <- grep("^006_Tabla ", archivos)

cargar_archivos <- archivos[orden_archivos]
cargar_archivos <- paste0(direccion, "/", cargar_archivos)


for (n in 1:length(cargar_archivos)) {
  
  # n <- 19
  
  if (n <= nrow(ref_tablas)) {
    
    
    cat(modificacion03, " - Tabla Interna ", GenNum(n), " - Inicio",  "\n", sep="")  
    
  este_detalle <- ref_tablas$Tipo[n]

  eval(parse(text= texto_tablas01))
  
  if (este_detalle != "Reveer" && este_detalle != "No Corresponde") {
    
  # 1ra Generacion de elementos para tablas

  

  
    
    if (nrow(mini) > 0) {
      
      # Esta tabla
      source(cargar_archivos[n], encoding = "UTF-8")
      
  # 2da Generacion de elementos para tablas
  eval(parse(text= texto_tablas02))
  
    } else {
      
      # mi_grafico <- '
      # plot(c(0,10), c(0,10), col="white", xlab="", ylab="", axes = F, main=titulo_grafico)
      # text(5, 5, "Sin Datos en el subconjunto seleccionado")
      # '
      
      tabla_salida <- as.matrix("Sin Datos en el subconjunto seleccionado", 4, 4)
      tabla_salida <- list(tabla_salida)
      names(tabla_salida) <- " "
      tablas_internas[[n]] <- tabla_salida
    }  
  
  # Numero de Tabla Interna
  cat(modificacion03, " - Tabla Interna ", GenNum(num_interno_tabla), " - Fin",  "\n", sep="")
  
  dt_mini <-  grep("^mini$", ls())
  if (length(dt_mini) == 1) remove(mini)
  
  dt_mini2 <-  grep("^mini2$", ls())
  if (length(dt_mini2) == 1) remove(mini2)
  
  dt_tabla_intermedia <-  grep("^tabla_intermedia$", ls())
  if (length(dt_tabla_intermedia) == 1) remove(tabla_intermedia)
  
  dt_tabla_rejunte <-  grep("^tabla_rejunte$", ls())
  if (length(dt_tabla_rejunte) == 1) remove(tabla_rejunte)
  
  dt_tabla_salida <-  grep("^tabla_salida$", ls())
  if (length(dt_tabla_salida) == 1) remove(tabla_salida)
  
  dt_tabla_fa <-  grep("^tabla_fa$", ls())
  if (length(dt_tabla_fa) == 1) remove(tabla_fa)
  
  dt_tabla_p <-  grep("^tabla_p$", ls())
  if (length(dt_tabla_p) == 1) remove(tabla_p)
  
  dt_tabla_fa2 <-  grep("^dt_tabla_fa2$", ls())
  if (length(dt_tabla_fa2) == 1) remove(dt_tabla_fa2)

  dt_tabla_p2 <-  grep("^dt_tabla_p2$", ls())
  if (length(dt_tabla_p2) == 1) remove(dt_tabla_p2)
  
    
  } else {
    
    # Numero de Tabla Interna
   if (este_detalle == "Reveer") {
    
     cat("Tabla Interna ", GenNum(num_interno_tabla), " - Fin (En Revision)", "\n", sep="")
     eval(parse(text= texto_tablas03))
   }
    
   if (este_detalle == "No Corresponde") {
     eval(parse(text= texto_tablas04))
     cat("Tabla Interna ", GenNum(num_interno_tabla),  " - Fin" , " - Generación Externa o Cancelada",  "\n", sep="")
     
   }
    
    
  }
} # Fin if 
  
} # Fin for n


# Correccion para cuando no hace las tablas por que
# estan en revision o son nulas....
if (1 == 2) {
for(n in 1:length(tablas_internas)) {
  
  if(is.null(dim(tablas_internas[[n]]))) tablas_internas[[n]] <- matrix("Rev o No corresponde", 3, 4)
  
}
}


remove(direccion, archivos, orden_archivos, cargar_archivos)


