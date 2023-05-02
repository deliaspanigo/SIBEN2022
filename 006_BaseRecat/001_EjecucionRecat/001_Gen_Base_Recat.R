
# # # #
# Este archivo lo que genera son las columnas de una base de datos que contiene
# las nuevas columnas que surgen de recategorizar la informacion de "BASE_ORIGINAL", y/o "BASE_IPT".
#

# Si hay warning, los trata como errores, y detiene los bucle for
options(warn=2)

# Cargamos herramientas y bases medicas
source("../002_Carga_Bases_Medicas/001s_Carga_Bases_Medicas.R")



# Creamos una lista donde guardaremos las nuevas columnas
# El nombre de cada columna nueva recategorizada, comienza con "recat_"
nuevas_columnas <- list()
#############################################################################################################



# 1) recat_id_pac (A)

# La guardamos
nuevas_columnas[[1]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var001_A.R")
remove(evaluame)

############################################################################################################


# 2) recat_anio (B)

# La guardamos
nuevas_columnas[[2]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var002_B.R")
remove(evaluame)

############################################################################################################


# 3) recat_nombre_hospital (C)

# La guardamos
nuevas_columnas[[3]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var003_C.R")
remove(evaluame)

############################################################################################################



# 4) recat_pais (D)

# La guardamos
nuevas_columnas[[4]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var004_D.R")
remove(evaluame)

############################################################################################################



# 5) recat_codigo_unidades (E)

nuevas_columnas[[5]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var005_E.R")
remove(evaluame)


###########################################################################################################


# 6) recat_grupo (F)
nuevas_columnas[[6]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var006_F.R")
remove(evaluame)
############################################################################################################


# 7) recat_cat_peso (G)
nuevas_columnas[[7]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var007_G.R")
remove(evaluame)
############################################################################################################


# 8) recat_dias_egreso_internacion (H)
nuevas_columnas[[8]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var008_H.R")
remove(evaluame)
############################################################################################################



# 9) recat_apgar1 (I)
nuevas_columnas[[9]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var009_I.R")
remove(evaluame)
############################################################################################################


# 10) recat_apgar5 (J)
nuevas_columnas[[10]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var010_J.R")
remove(evaluame)
###########################################################################################################


# 11) recat_apgar10 (K)
nuevas_columnas[[11]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var011_K.R")
remove(evaluame)
###########################################################################################################


# 12) recat_rangos_eg_inicial (L)
nuevas_columnas[[12]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var012_L.R")
remove(evaluame)
###########################################################################################################


# 13) recat_fiO2 (M)
nuevas_columnas[[13]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var013_M.R")
remove(evaluame)
###########################################################################################################

 
# 14) recat_eco2 (N)
nuevas_columnas[[14]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var014_N.R")
remove(evaluame)
###########################################################################################################


# 15) recat_eg_final (O)
nuevas_columnas[[15]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var015_O.R")
remove(evaluame)
###########################################################################################################


# 16) recat_sexo (P)
nuevas_columnas[[16]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var016_P.R")
remove(evaluame)
###########################################################################################################


# Objetos de uso comunitario 
{
###
  
# La Edad Gestacional Inicial
edad_gestacional_inicial <- BASE_ORIGINAL[,let2num("C")]

# 
# 
# # Dias de internacion
# dias_internacion <- BASE_ORIGINAL[,let2num("FC")]
# 
# semanas_internacion <-  dias_internacion%/%7
# 
# # La Edad Gestacional Final
# edad_gestacional_final <- edad_gestacional_inicial + semanas_internacion

  # # El sexo del paciente
# sexo <- BASE_ORIGINAL[,let2num("AT")]
# sexo[sexo == "Ambiguo"] <- NA

  
    edad_gestacional_final <-   nuevas_columnas[[15]]  # Nuevo detalle (recat_eg_final)
    sexo <- nuevas_columnas[[16]] # Nuevo detalle (recat_sexo)
  
# El peso inicial
pesos_inicial <- BASE_ORIGINAL[,let2num("B")]


# El peso final
pesos_final <- BASE_ORIGINAL[,let2num("EX")]


# El Perimetro Cefalico al nacer
PC_inicial <- BASE_ORIGINAL[,let2num("AW")]



# El Perimetro Cefalico al egreso
PC_final <- BASE_ORIGINAL[,let2num("EZ")]





###
} # Fin objetos de uso comunitario
###########################################################################################################


# 17) recat_fenton_peso_nacim (Q)
nuevas_columnas[[17]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var017_Q.R")
remove(evaluame)
###########################################################################################################



# 18) recat_fenton_peso_egreso (R)
nuevas_columnas[[18]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var018_R.R")
remove(evaluame)
###########################################################################################################


# 19) recat_fenton_PC_nacim (S)
nuevas_columnas[[19]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var019_S.R")
remove(evaluame)
###########################################################################################################



# 20) recat_fenton_PC_egreso (T)
nuevas_columnas[[20]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var020_T.R")
remove(evaluame)
###########################################################################################################



# 21) recat_Z_peso_nacim (U)
nuevas_columnas[[21]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var021_U.R")
remove(evaluame)
############################################################################################################

# 22) recat_Z_peso_egreso (V)
nuevas_columnas[[22]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var022_V.R")
remove(evaluame)
############################################################################################################

# 23) recat_Z_PC_nacim (W)
nuevas_columnas[[23]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var023_W.R")
remove(evaluame)
############################################################################################################

# 24) recat_Z_PC_egreso (X)
nuevas_columnas[[24]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var024_X.R")
remove(evaluame)
############################################################################################################


# 25) recat_fusion_retino (Y)
nuevas_columnas[[25]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var025_Y.R")
remove(evaluame)

############################################################################################################



# 26) recat_edad3 (Z)
nuevas_columnas[[26]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var026_Z.R")
remove(evaluame)
############################################################################################################


# 27) recat_fusion_arm_cpap (AA)
nuevas_columnas[[27]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var027_AA.R")
remove(evaluame)
############################################################################################################


# 28) recat_fusion_ds_dp (AB)
nuevas_columnas[[28]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var028_AB.R")
remove(evaluame)
############################################################################################################



# 29) recat_eco3 (AC)
nuevas_columnas[[29]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var029_AC.R")
remove(evaluame)
############################################################################################################



# 30) recat_dias_int_fallec (AD)
nuevas_columnas[[30]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var030_AD.R")
remove(evaluame)
############################################################################################################



# 31) recat_control_mas_tres (AE)
nuevas_columnas[[31]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var031_AE.R")
remove(evaluame)
############################################################################################################



# 32) recat_fusion_retino2 (AF)
nuevas_columnas[[32]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var032_AF.R")
remove(evaluame)
############################################################################################################

# 33) recat_criterio_seleccion1 (AG)
nuevas_columnas[[33]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var033_AG.R")
remove(evaluame)
############################################################################################################


# 34) criterio_seleccion2 (AH)
nuevas_columnas[[34]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var034_AH.R")
remove(evaluame)
############################################################################################################


# 35) criterio_seleccion3 (AI)
nuevas_columnas[[35]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var035_AI.R")
remove(evaluame)
############################################################################################################


# 36) criterio_seleccion4 (AJ)
nuevas_columnas[[36]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var036_AJ.R")
remove(evaluame)
############################################################################################################



# 37) criterio_seleccion5 (AK)
nuevas_columnas[[37]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var037_AK.R")
remove(evaluame)
############################################################################################################




# 38) criterio_seleccion6 (AL)
nuevas_columnas[[38]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var038_AL.R")
remove(evaluame)
############################################################################################################

# 39) criterio_seleccion6 (AM)
nuevas_columnas[[39]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var039_AM.R")
remove(evaluame)
############################################################################################################



# 40) recat_rangos_eg_final (AN)
nuevas_columnas[[40]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var040_AN.R")
remove(evaluame)
############################################################################################################



# 41) recat_criterio_inclusion8 (AO)
nuevas_columnas[[41]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var041_AO.R")
remove(evaluame)
############################################################################################################


# 42) recat_criterio_inclusion9 (AP)
nuevas_columnas[[42]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var042_AP.R")
remove(evaluame)
############################################################################################################


# 43) recat_dap (AQ)
nuevas_columnas[[43]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var043_AQ.R")
remove(evaluame)
############################################################################################################


# 44) recat_fusion_retino3 (AR)
nuevas_columnas[[44]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var044_AR.R")
remove(evaluame)
############################################################################################################



# 45) recat_dbp (AS)
nuevas_columnas[[45]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var045_AS.R")
remove(evaluame)
############################################################################################################



# 46) recat_gravedad_dbp (AT)
nuevas_columnas[[46]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var046_AT.R")
remove(evaluame)
############################################################################################################



# 47) recat_criterio_inclusion10 (AU)
nuevas_columnas[[47]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var047_AU.R")
remove(evaluame)
############################################################################################################


# 48) recat_fusion_grado_hemo (AV)
nuevas_columnas[[48]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var048_AV.R")
remove(evaluame)
############################################################################################################


# 49) recat_criterio_inclusion11 (AW)
nuevas_columnas[[49]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var049_AW.R")
remove(evaluame)
############################################################################################################



# 50) recat_criterio_inclusion12 (AX)
nuevas_columnas[[50]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var050_AX.R")
remove(evaluame)
############################################################################################################



# 51) recat_atb_cultivos_sp (AY)
nuevas_columnas[[51]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var051_AY.R")
remove(evaluame)
############################################################################################################



# 52) recat_atb_dias_general (AZ)
nuevas_columnas[[52]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var052_AZ.R")
remove(evaluame)
############################################################################################################



# 53) recat_st_cultivo_general (BA)
nuevas_columnas[[53]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var053_BA.R")
remove(evaluame)
############################################################################################################


# 54) recat_atb_cultivos_st (BB)
nuevas_columnas[[54]] <- mega(input = "../004_Generacion_de_Columnas_Recategorizadas/new/var054_BB.R")
remove(evaluame)
############################################################################################################

#

#
#
#
#
#



# Reunimos todas las columnas nuevas
rejunte_columnas <- as.data.frame(matrix(NA, nrow(BASE_ORIGINAL), length(nuevas_columnas)))
for (n in 1:ncol(rejunte_columnas)) rejunte_columnas[,n] <- nuevas_columnas[[n]]
for (n in 1:ncol(rejunte_columnas)) colnames(rejunte_columnas)[n] <- colnames(nuevas_columnas[[n]])





##############################################################################################

# NUEVA_BASE <- cbind(BASE_ORIGINAL, rejunte_columnas)

NUEVA_BASE <- rejunte_columnas

# Direccion General de Carga
direccion_carpeta_save <- "../../002_Bases/004_Nuevas_Columnas_Recategorizadas/001_Base_Recategorizada"
archivo_nuevo <- "004_Base_Recategorizada.csv"
este_archivo_nuevo <- paste0(direccion_carpeta_save, "/", archivo_nuevo)



write.csv(NUEVA_BASE, file = este_archivo_nuevo, row.names = FALSE, na = "")



# Los warning no son errores y solo se muestran
options(warn=1)
