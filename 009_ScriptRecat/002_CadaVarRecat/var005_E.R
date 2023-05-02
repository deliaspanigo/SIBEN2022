


evaluame <- 

'


# Detallamos los hospitales presentes en la base de referencia
  nombres_hospitales_tabulados <- BASE_ref_unidades_hospitalarias[,2]
  codigo_hospitales_tabulados <-  BASE_ref_unidades_hospitalarias[,3]


mini <- as.character(BASE_MOD_ORIGINAL[, let2num("FI")])

recat_codigo_unidad <- mini


for (k in 1:length(nombres_hospitales_tabulados)) {
  
  este_tabulado <- nombres_hospitales_tabulados[k]
  
  dt <- este_tabulado == recat_codigo_unidad
  
  recat_codigo_unidad[dt] <- codigo_hospitales_tabulados[k]
}

# Le damos dimension de columna
dim(recat_codigo_unidad) <- c(length(recat_codigo_unidad), 1)

colnames(recat_codigo_unidad) <- "recat_codigo_unidad"

# Salida
data_salida <- recat_codigo_unidad



'








