


evaluame <- 
'

# Siben- Mayo 2021 (Entrega Siben 2020)
#  estas_columnas <- let2num(c("X", "AI", "AT", "BE", "BP", "CA", "CL", "CW", "DH", "DS"))

# Siben - Mayo 2022 (Entrega Siben 2021)
  estas_columnas <- let2num(c("X", "AI", "AT", "BE", "BP", "CA", "CL", "CW", "DH"))  
  
  mini <- BASE_MOD_IPT[,estas_columnas]


recat_st_cultivo_general <- rep(NA, nrow(mini))

for (k in 1:length(recat_st_cultivo_general)) {
  
  sp_cultivo <- as.vector(as.matrix(mini[k,]))
  
  dt_1 <- sp_cultivo == "Negativo"
  dt_1[is.na(dt_1)] <- FALSE
  
  dt_2 <- sp_cultivo == "Positivo"
  dt_2[is.na(dt_2)] <- FALSE
  
  if (sum(dt_1) > 0) recat_st_cultivo_general[k] <- "Negativo"
  if (sum(dt_2) > 0) recat_st_cultivo_general[k] <- "Positivo"

} # Fin for k




dim(recat_st_cultivo_general) <- c(length(recat_st_cultivo_general), 1)
colnames(recat_st_cultivo_general) <- "recat_st_cultivo_general"


# salida 
data_salida <- recat_st_cultivo_general


'
