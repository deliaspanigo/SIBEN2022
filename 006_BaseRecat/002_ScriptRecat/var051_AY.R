


evaluame <- 
'


  estas_columnas <- let2num(c("G", "D"))
  mini <- BASE_MOD_IPT[,estas_columnas]


recat_atb_cultivos_sp <- rep(NA, nrow(mini))

for (k in 1:length(recat_atb_cultivos_sp)) {
  
  dias <- mini[k,1]
  sp_cultivo <- mini[k,2]
  
  if (!is.na(dias) && !is.na(sp_cultivo)) {

    
    if (dias >= 1) if (dias <= 3) if (sp_cultivo == "Negativo")   recat_atb_cultivos_sp[k] <- "No"
    if (dias >= 1) if (dias <= 3) if (sp_cultivo == "Positivo")   recat_atb_cultivos_sp[k] <- "No"
                   if (dias >  3) if (sp_cultivo == "Negativo")   recat_atb_cultivos_sp[k] <- "Si"
                   if (dias >  3) if (sp_cultivo == "Positivo")   recat_atb_cultivos_sp[k] <- "No"


  } # Fin if
} # Fin for k




dim(recat_atb_cultivos_sp) <- c(length(recat_atb_cultivos_sp), 1)
colnames(recat_atb_cultivos_sp) <- "recat_atb_cultivos_sp"


# salida 
data_salida <- recat_atb_cultivos_sp


'
