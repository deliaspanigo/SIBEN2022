

# En esta variable lo que se realiza es...
# Una recategorizacion de dos columnas...
# Variable 1: Base Original – DAP – Columna DN – Base Original
# Variable 2: Base Original – DAP_Tratam – Columna DP – Base Original
# Variable 3: Base Original - DAP_Tratamiento – Columna DQ

#  Orden      DAP (DN)   DAP (DP)      Nueva Categoría
#   1           Si          No            "No tratado"
#   2           Si          Si            Lo que diga la Variable 3
#   3           No          No            Lo que diga la Variable 3
#   4           No          Si            Lo que diga la Variable 3


 evaluame <- '


# Seleccionamos columnas
columnas <- c("DN", "DP", "DQ")

# Pasamos a letras
estas_columnas <- let2num(columnas)


# Minibase
mini <- BASE_MOD_ORIGINAL[estas_columnas]
mini7 <- mini

recat_dap <- rep(NA, nrow(mini))


for (k in 1:nrow(mini7)) {

  este_dn <- as.character(mini7[k,1])
  este_dp <- as.character(mini7[k,2])
  este_dq <- as.character(mini7[k,3])

  if (!is.na(este_dn) && !is.na(este_dp)) {

    if (este_dn == "Si" && este_dp == "No") recat_dap[k] <- "No tratado" else recat_dap[k] <- este_dq
      
      
    } # Fin if
  } # Fin for k
    

dim(recat_dap) <- c(length(recat_dap), 1)

colnames(recat_dap) <- "recat_dap"


# salida 
data_salida <- recat_dap


'
