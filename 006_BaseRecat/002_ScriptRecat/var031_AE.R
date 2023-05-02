

evaluame <- '

control_mas_tres <- rep(NA, nrow(BASE_MOD_ORIGINAL))

mini <- BASE_MOD_ORIGINAL[,let2num("F")]

for (k in 1:length(control_mas_tres)) {
  
  if (!is.na(mini[k])) {
    
    if (mini[k] >= 3) control_mas_tres[k] <- "Si" else control_mas_tres[k] <- "No"
    
  }
  
} # Fin for k


recat_control_mas_tres <- control_mas_tres

dim(recat_control_mas_tres) <- c(length(recat_control_mas_tres), 1)
colnames(recat_control_mas_tres) <- "recat_control_mas_tres"




# Salida
data_salida <- recat_control_mas_tres





'







