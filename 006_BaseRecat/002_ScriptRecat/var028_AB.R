

evaluame <- '



fusion_ds_dp <- rep(NA, nrow(BASE_MOD_ORIGINAL))


mini <- BASE_MOD_ORIGINAL[,let2num(c("DP", "DS"))]



for (k in 1:nrow(mini)) {

esta_fila <- as.vector(as.matrix(mini[k, ]))

if (length(esta_fila) == length(na.omit(esta_fila))) {

if (esta_fila[1] == "No")  fusion_ds_dp[k] <- "DP NO" else
if (esta_fila[1] == "Si" && esta_fila[2] == "No")  fusion_ds_dp[k] <- "DP SI + DS NO" else
if (esta_fila[1] == "Si" && esta_fila[2] == "Si")  fusion_ds_dp[k] <- "DP SI + DS SI"

}
} # Fin for k


recat_fusion_ds_dp <- fusion_ds_dp

dim(recat_fusion_ds_dp) <- c(length(recat_fusion_ds_dp), 1)
colnames(recat_fusion_ds_dp) <- "recat_fusion_ds_dp"

# Salida
data_salida <- recat_fusion_ds_dp




'





