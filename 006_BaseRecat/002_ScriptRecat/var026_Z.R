


evaluame <- '



cat_edad3 <- rep(NA, nrow(BASE_MOD_ORIGINAL))


edad_gestacional <- BASE_MOD_ORIGINAL[,let2num("C")]

cat_edad3 <- edad_gestacional
cat_edad3[edad_gestacional > 34] <- ">34"

recat_edad3 <- cat_edad3

dim(recat_edad3) <- c(length(recat_edad3), 1)
colnames(recat_edad3) <- "recat_edad3"

# Salida
data_salida <- recat_edad3



'



