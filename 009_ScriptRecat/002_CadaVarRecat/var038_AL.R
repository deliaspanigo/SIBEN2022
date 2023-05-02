






evaluame <- '


### La base de datos se divide en dos:
# a) "Menores":
#    - todos los RN menores o iguales a 33 semanas de gestación, indistintamente del peso.
#    - todos los RN menores o iguales a 1500, indistintamente de su edad gestacional.


# b) "Mayores": 
#    - todos los RN con una edad gestacional igual o mayor a 34 semanas de gestacional (incluye a los de 34 semanas)
#      y tener un peso superior a 1500g (no incluye a los de 1500g). 
#      El requisito de edad gestacional y peso debe ser cumplido simultáneamente.



# Peso al Nacer     - Columna B - Peso_RN
# Edad Gestacional  - Columna C - Edad.Gestacional





criterio_seleccion6 <- rep(NA, nrow(BASE_MOD_ORIGINAL))
cambio <- BASE_MOD_ORIGINAL[let2num(c("B", "C"))]

for (k in 1:nrow(cambio)) {

este_cambio <- cambio[k, ]

if(sum(is.na(este_cambio)) == 0) {

este_peso <- cambio[k,1]
esta_eg <- cambio[k,2]




if (esta_eg <= 33 | este_peso <= 1500) criterio_seleccion6[k] <- "Menor 1500" else if (esta_eg >= 34 && este_peso > 1500) criterio_seleccion6[k] <- "Mayor 1500"











} # Fin if

} # Fin for k



recat_criterio_seleccion6 <- criterio_seleccion6

dim(recat_criterio_seleccion6) <- c(length(recat_criterio_seleccion6), 1)
colnames(recat_criterio_seleccion6) <- "recat_criterio_seleccion6"

# Salida
data_salida <- recat_criterio_seleccion6



'

