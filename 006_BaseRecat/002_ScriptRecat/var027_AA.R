


evaluame <- '


# Fusion de las columnas (CX) y (DC)

fusion_arm_cpap <- rep(NA, nrow(BASE_ORIGINAL))

arm <- BASE_MOD_ORIGINAL[,let2num("CX")]
cpap <- BASE_MOD_ORIGINAL[,let2num("DC")]

# table(arm, cpap)

combinacion <- paste0(arm, "-", cpap, sep="")
dt1 <- combinacion == "No-No"
dt2 <- combinacion == "Si-No"
dt3 <- combinacion == "No-Si"
dt4 <- combinacion == "Si-Si"
dt5 <- (as.numeric(dt1) + as.numeric(dt2) + as.numeric(dt3) + as.numeric(dt4)) == 0

combinacion[dt1] <- "Sin Apoyo"
combinacion[dt2] <- "ARM"
combinacion[dt3] <- "CPAP"
combinacion[dt4] <- "ARM+CPAP"
combinacion[dt5] <- NA


fusion_arm_cpap <- combinacion

recat_fusion_arm_cpap <- fusion_arm_cpap

dim(recat_fusion_arm_cpap) <- c(length(recat_fusion_arm_cpap), 1)
colnames(recat_fusion_arm_cpap) <- "recat_fusion_arm_cpap"


# Salida
data_salida <- recat_fusion_arm_cpap




'

