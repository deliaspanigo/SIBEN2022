


evaluame <- 

'


  mini <- cbind(nuevas_columnas[[52]], nuevas_columnas[[53]])


recat_atb_cultivos_st <- rep(NA, nrow(mini))

for (k in 1:length(recat_atb_cultivos_st)) {
  
  dias <- mini[k,1]
  sp_cultivo <- mini[k,2]
  
  if (!is.na(dias) && !is.na(sp_cultivo)) {

    
    if (dias >= 1) if (dias == "1 a 3") if (sp_cultivo == "Negativo")   recat_atb_cultivos_st[k] <- "No"
    if (dias >= 1) if (dias == "1 a 3") if (sp_cultivo == "Positivo")   recat_atb_cultivos_st[k] <- "No"
                   if (dias == ">3") if (sp_cultivo == "Negativo")   recat_atb_cultivos_st[k] <- "Si"
                   if (dias == ">3") if (sp_cultivo == "Positivo")   recat_atb_cultivos_st[k] <- "No"


  } # Fin if
} # Fin for k




dim(recat_atb_cultivos_st) <- c(length(recat_atb_cultivos_st), 1)
colnames(recat_atb_cultivos_st) <- "recat_atb_cultivos_st"


# salida 
data_salida <- recat_atb_cultivos_st


'
