

evaluame <- '

recat_gravedad_dbp <- rep(NA, nrow(BASE_MOD_ORIGINAL))




v1 <- BASE_MOD_ORIGINAL[,let2num("FA")]
v2 <- as.character(BASE_MOD_ORIGINAL[,let2num("DW")])

for (k in 1:length(v1)) {

este1 <- v1[k]
este2 <- v2[k]

if(!is.na(este1) && !is.na(este2)) {

if (este1 >= 36){

if (este2 == "Sin O2")  recat_gravedad_dbp[k] <- "Sin Displasia"
if (este2 == "FiO2 > 30")     recat_gravedad_dbp[k] <- "DBP Leve"
if (este2 == "FiO2 < 30")     recat_gravedad_dbp[k] <- "DBP Moderada"
if (este2 == "VM")      recat_gravedad_dbp[k] <- "DBP Grave"
if (este2 == "CPAP")    recat_gravedad_dbp[k] <- "DBP Grave"

} # Fin if          
} # Fin if
} # Fin for k



dim(recat_gravedad_dbp) <- c(length(recat_gravedad_dbp), 1)
colnames(recat_gravedad_dbp) <- "recat_gravedad_dbp"

# Salida
data_salida <- recat_gravedad_dbp





'
