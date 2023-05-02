


evaluame <- 
'

# Siben- Mayo 2021 (Entrega Siben 2020)
#  estas_columnas <- let2num(c("AA","AL","AW","BH","BS", "CD", "CO", "CZ", "DK", "DV"))
  
# Siben - Mayo 2022 (Entrega Siben 2021)
  estas_columnas <- let2num(c("AA","AL","AW","BH","BS", "CD", "CO", "CZ", "DK"))
  mini <- BASE_MOD_IPT[,estas_columnas]


recat_atb_dias_general <- rep(NA, nrow(mini))

for (k in 1:length(recat_atb_dias_general)) {
  
  dias <- as.vector(as.matrix(mini[k,]))
  
  dt_1 <- dias <= 3
  dt_1[is.na(dt_1)] <- FALSE
  
  dt_2 <- dias > 3
  dt_2[is.na(dt_2)] <- FALSE
  
  if (sum(dt_1) > 0) recat_atb_dias_general[k] <- "1 a 3"
  if (sum(dt_2) > 0) recat_atb_dias_general[k] <- ">3"

} # Fin for k




dim(recat_atb_dias_general) <- c(length(recat_atb_dias_general), 1)
colnames(recat_atb_dias_general) <- "recat_atb_dias_general"


# salida 
data_salida <- recat_atb_dias_general


'
