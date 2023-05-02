
# Objetos Generales
mix_base <- list(BASE_MOD_ORIGINAL, BASE_MOD_RECAT, BASE_MOD_IPT)
columnas_filtro <- c("Filtro_Base_Original", "Filtro_Base_Recategorizada", "Filtro_Base_IPT")
columnas_var <- c("Columnas_Base_Original", "Columnas_Base_Recategorizada", "Columnas_Base_IPT")
detalle_base <- c("Base_Original", "Base_Recategorizada", "Base_IPT")

verificar.filtros(input_ref_interno =  ref_tablas, 
                  input_columnas_filtro = columnas_filtro,
                  input_mix_base = mix_base)


mis_filtros <- crear.filtros(input_ref_interno =  ref_tablas, 
                             input_columnas_filtro = columnas_filtro,
                             input_mix_base = mix_base)

# Creamos todas las minibases_tablas
minibase_tablas <- crear.minibase.tablas(input_ref_interno =  ref_tablas, 
                                         input_mix_base = mix_base, input_filtros = mis_filtros)



# Creamos todas las naval de tablas
naval_tablas <- crear.naval.tablas(input_ref_interno =  ref_tablas, 
                                   input_mix_base = mix_base,
                                   input_detalle_base = detalle_base,
                                   input_columnas_var = columnas_var ,
                                   input_columnas_filtro = columnas_filtro)



# Creamos las tablas con el detalle de filtros
# tablas_filtros <- crear.tabla.filtro(ref_interno = ref_tablas, input_base = BASE_MOD)


cat("Fin Creacion de Minibases y Naval", "\n")