


evaluame <- '



# Solo con “Fallecido” de la columna FD
# se crea una nueva columna con los valores de la columna FC de este modo:

# #     Grupo 1: Fallecido en 0 dias
# #     Grupo 2: Fallecido entre las 1 y 3 dias
# #     Grupo 3: Fallecido entre las 4 y los 7 dias
# #     Grupo 4: Fallecido después de los 7 dias

cat_dias_int_fallec <- rep(NA, nrow(BASE_MOD_ORIGINAL))

estado_muerte <- BASE_MOD_ORIGINAL[,let2num("FD")]
dias <- BASE_MOD_ORIGINAL[,let2num("FC")]


for (k in 1:length(cat_dias_int_fallec)) {

if (!is.na(estado_muerte[k]) && !is.na(dias[k])) {

if (estado_muerte[k] == "Fallecido") {

estos_dias <- dias[k]

if(estos_dias == 0) cat_dias_int_fallec[k] <- "Grupo 1" 
if(estos_dias >= 1 && estos_dias <= 3) cat_dias_int_fallec[k] <- "Grupo 2" 
if(estos_dias >= 4 && estos_dias <= 7) cat_dias_int_fallec[k] <- "Grupo 3" 
if(estos_dias > 7) cat_dias_int_fallec[k] <- "Grupo 4"

}
}
} # Fin for k


tapply(dias, cat_dias_int_fallec, max)




recat_dias_int_fallec <- cat_dias_int_fallec

dim(recat_dias_int_fallec) <- c(length(recat_dias_int_fallec), 1)
colnames(recat_dias_int_fallec) <- "recat_dias_int_fallec"

# Salida
data_salida <- recat_dias_int_fallec









'


