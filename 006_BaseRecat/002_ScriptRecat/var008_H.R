


evaluame <- '





dias <- BASE_MOD_ORIGINAL[,let2num("FC")]

# Cat Egreso_Dias Internac
nombre_col <- c("Orden", "Min", "Max", "Categoría")

ref_dias <- as.data.frame(matrix(NA, 10, length(nombre_col)))
ref_dias[,2] <- as.numeric(as.character(ref_dias[,2]))
ref_dias[,3] <- as.numeric(as.character(ref_dias[,3]))
colnames(ref_dias) <- nombre_col
ref_dias[1,] <- c(1, 0, 1, "0 a 1")
ref_dias[2,] <- c(2, 2, 3, "2 a 3")
ref_dias[3,] <- c(3, 4, 7, "4 a 7")
ref_dias[4,] <- c(4, 8, 14, "8 a 14")
ref_dias[5,] <- c(5, 15, 30, "15 a 30")
ref_dias[6,] <- c(6, 31, 2000000, "Mayor a 30")
ref_dias <- na.omit(ref_dias)


recat_dias_egreso_internacion <- rep(NA, length(dias))
for (n in 1:length(recat_dias_egreso_internacion)) {

este_dia <- dias[n]

if (!is.na(este_dia)) {
ingreso <- FALSE
for(k in 1:nrow(ref_dias)) {

if (ingreso == FALSE) {
if(este_dia >= as.numeric(as.character(ref_dias[k,2])) && este_dia <= as.numeric(as.character(ref_dias[k,3]))){

recat_dias_egreso_internacion[n] <- ref_dias[k,4]
ingreso <- TRUE
} #if
} # if

} # for k
} else  recat_dias_egreso_internacion[n] <- "" #!is.na
} # For n


# Le damos dimension de columna
dim(recat_dias_egreso_internacion) <- c(length(recat_dias_egreso_internacion), 1)

# Le damos un nombre
colnames(recat_dias_egreso_internacion) <- "recat_dias_egreso_internacion"

nuevas_columnas[[3]] <- recat_dias_egreso_internacion


# Salida
data_salida <- recat_dias_egreso_internacion

'
