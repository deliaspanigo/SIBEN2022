
# # # # TEXTOS AUTOMATIZADOS



savePPTX_SIBEN <- '
 if (candado_pptx == TRUE) {
doc_pptx <- add_slide(doc_pptx, layout = "Title and Content", master = "Office Theme")
doc_pptx <- ph_with_vg(doc_pptx, code = eval(parse(text = mi_grafico)),
                       type = "body")
}
'


texto_partes01 <- '
# Objetos Generales
PARTES[[este_orden]] <- list()
columnas[[este_orden]] <- list()
naval[[este_orden]] <- list()
'

texto_minibase02 <- '
# Pasamos a letras
estas_columnas <- let2num(columnas[[este_orden]])

# Minibase
mini <- na.omit(BASE_MOD[,estas_columnas])

MINIBASE[[este_orden]] <- mini

naval[[este_orden]] <- tabla_naval(BASE_MOD, columnas[[este_orden]])
'  

texto_tablas01 <- "
# Generales de Tabla
num_interno_tabla <- ref_tablas$'Orden Interno'[n]
num_externo_tabla <- ref_tablas$Tabla[n]
titulo_tabla <- ref_tablas$Titulo[n]

tablas_internas[[num_interno_tabla]] <- list()
tablas_externas[[num_externo_tabla]] <- list()
arm_tabla[[num_interno_tabla]] <- list()

# Especificos de Tabla
mini <- minibase_tablas[[num_interno_tabla]]
"


texto_tablas02 <- '
# Armamos la tabla y la asignamos
tablas_internas[[num_interno_tabla]] <- tabla_salida
tablas_externas[[num_externo_tabla]] <- tabla_salida
objeto_tabla <- paste0("tabla", GenNum(num_interno_tabla))
objeto_tabla <- paste0(objeto_tabla, " <- tabla_salida")
eval(parse(text= objeto_tabla))
'

texto_tablas03 <- '
# Armamos la tabla y la asignamos
tablas_internas[[num_interno_tabla]] <- tabla_ayuda
tablas_externas[[num_externo_tabla]] <- tabla_ayuda
objeto_tabla <- paste0("tabla", GenNum(num_interno_tabla))
objeto_tabla <- paste0(objeto_tabla, " <- tabla_ayuda")
eval(parse(text= objeto_tabla))
'


texto_tablas04 <- '
# Armamos la tabla y la asignamos
tablas_internas[[num_interno_tabla]] <- tabla_ayuda2
tablas_externas[[num_externo_tabla]] <- tabla_ayuda2
objeto_tabla <- paste0("tabla", GenNum(num_interno_tabla))
objeto_tabla <- paste0(objeto_tabla, " <- tabla_ayuda2")
eval(parse(text= objeto_tabla))
'

texto_graficos01 <- "
# Generales de Grafico
num_interno_grafico <- ref_graficos$'Orden Interno'[n]
num_externo_grafico <- ref_graficos$Grafico[n]
titulo_grafico <- ref_graficos$Titulo[n]
titulo_grafico <- paste0('Gráfico ', num_interno_grafico, ': ', titulo_grafico)

graficos_internos[[num_interno_grafico]] <- list()
graficos_externos[[num_externo_grafico]] <- list()
arm_grafico[[num_interno_grafico]] <- list()

# Especificos de Grafico
mini <- minibase_graficos[[num_interno_grafico]]
"


texto_graficos02 <- '
# Armamos la tabla del grafico y la asignamos
graficos_internos[[num_interno_grafico]] <- tabla_salida
graficos_externos[[num_externo_grafico]] <- tabla_salida
objeto_grafico <- paste0("grafico", GenNum(num_interno_grafico))
objeto_grafico <- paste0(objeto_grafico, " <- tabla_salida")
eval(parse(text= objeto_grafico))
'


texto_graficos03 <- '
# Armamos la tabla y la asignamos
graficos_internos[[num_interno_grafico]] <- tabla_ayuda
graficos_externos[[num_externo_grafico]] <- tabla_ayuda
objeto_grafico <- paste0("grafico", GenNum(num_interno_grafico))
objeto_grafico <- paste0(objeto_grafico, " <- tabla_ayuda")
eval(parse(text= objeto_grafico))
'

texto_graficos04 <- '
# Armamos la tabla y la asignamos
graficos_internos[[num_interno_grafico]] <- tabla_ayuda2
graficos_externos[[num_externo_grafico]] <- tabla_ayuda2
objeto_graficos <- paste0("grafico", GenNum(num_interno_grafico))
objeto_graficos <- paste0(objeto_graficos, " <- tabla_ayuda2")
eval(parse(text= objeto_graficos))
'

grafico_ayuda <- '
texto_ayuda <- paste0("Reveer variables \n", "Gráfico ", n)
plot(1,1,col="white", axes=F, xlab="", ylab="", main = titulo_grafico)
text(1,1, texto_ayuda, col="green", cex=3)
'

grafico_no_corresponde <- '
texto_no_corresponde <- paste0("Gráfico No Corresponde \n", "Gráfico ", n)
plot(1,1,col="white", axes=F, xlab="", ylab="", main = titulo_grafico)
text(1,1, texto_no_corresponde, col="rojo", cex=3)
'

grafico_sin_datos <- '
texto_sin_datos <- paste0("MiniBase sin Datos \n", "Gráfico ", n)
plot(1,1,col="white", axes=F, xlab="", ylab="", main = titulo_grafico)
text(1,1, texto_sin_datos, col="orange", cex=3)
'

tabla_ayuda <- as.data.frame(matrix("Reveer Variables", 4,3))
tabla_ayuda2 <- as.data.frame(matrix("No Corresponde", 4,3))
