


  
  cat("****  Inicio Generacion Base Recat", "\n")
  
  
# # # #
# Este archivo lo que genera son las columnas de una base de datos que contiene
# las nuevas columnas que surgen de recategorizar la informacion de "BASE_MOD_ORIGINAL", y/o "BASE_MOD_IPT".
#

# Si hay warning, los trata como errores, y detiene los bucle for
options(warn=2)




# Creamos una lista donde guardaremos las nuevas columnas
# El nombre de cada columna nueva recategorizada, comienza con "recat_"
nuevas_columnas <- list()
#############################################################################################################



# 1) recat_id_pac (A)

# La guardamos
nuevas_columnas[[1]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var001_A.R")
remove(evaluame)

############################################################################################################


# 2) recat_anio (B)

# La guardamos
nuevas_columnas[[2]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var002_B.R")
remove(evaluame)

############################################################################################################


# 3) recat_nombre_hospital (C)

# La guardamos
nuevas_columnas[[3]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var003_C.R")
remove(evaluame)

############################################################################################################



# 4) recat_pais (D)

# La guardamos
nuevas_columnas[[4]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var004_D.R")
remove(evaluame)

############################################################################################################



# 5) recat_codigo_unidades (E)

nuevas_columnas[[5]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var005_E.R")
remove(evaluame)


###########################################################################################################


# 6) recat_grupo (F)
nuevas_columnas[[6]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var006_F.R")
remove(evaluame)
############################################################################################################


# 7) recat_cat_peso (G)
nuevas_columnas[[7]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var007_G.R")
remove(evaluame)
############################################################################################################


# 8) recat_dias_egreso_internacion (H)
nuevas_columnas[[8]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var008_H.R")
remove(evaluame)
############################################################################################################



# 9) recat_apgar1 (I)
nuevas_columnas[[9]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var009_I.R")
remove(evaluame)
############################################################################################################


# 10) recat_apgar5 (J)
nuevas_columnas[[10]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var010_J.R")
remove(evaluame)
###########################################################################################################


cat("Vamos por Recat 10... ", "\n")



# 11) recat_apgar10 (K)
nuevas_columnas[[11]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var011_K.R")
remove(evaluame)
###########################################################################################################


# 12) recat_rangos_eg_inicial (L)
nuevas_columnas[[12]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var012_L.R")
remove(evaluame)
###########################################################################################################


# 13) recat_fiO2 (M)
nuevas_columnas[[13]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var013_M.R")
remove(evaluame)
###########################################################################################################

 
# 14) recat_eco2 (N)
nuevas_columnas[[14]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var014_N.R")
remove(evaluame)
###########################################################################################################


# 15) recat_eg_final (O)
nuevas_columnas[[15]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var015_O.R")
remove(evaluame)
###########################################################################################################


# 16) recat_sexo (P)
nuevas_columnas[[16]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var016_P.R")
remove(evaluame)
###########################################################################################################


# Objetos de uso comunitario 
{
###
  
# La Edad Gestacional Inicial
edad_gestacional_inicial <- BASE_MOD_ORIGINAL[,let2num("C")]

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
pesos_inicial <- BASE_MOD_ORIGINAL[,let2num("B")]


# El peso final
pesos_final <- BASE_MOD_ORIGINAL[,let2num("EX")]


# El Perimetro Cefalico al nacer
PC_inicial <- BASE_MOD_ORIGINAL[,let2num("AW")]



# El Perimetro Cefalico al egreso
PC_final <- BASE_MOD_ORIGINAL[,let2num("EZ")]





###
} # Fin objetos de uso comunitario
###########################################################################################################


# 17) recat_fenton_peso_nacim (Q)
nuevas_columnas[[17]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var017_Q.R")
remove(evaluame)
###########################################################################################################



# 18) recat_fenton_peso_egreso (R)
nuevas_columnas[[18]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var018_R.R")
remove(evaluame)
###########################################################################################################


# 19) recat_fenton_PC_nacim (S)
nuevas_columnas[[19]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var019_S.R")
remove(evaluame)
###########################################################################################################



# 20) recat_fenton_PC_egreso (T)
nuevas_columnas[[20]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var020_T.R")
remove(evaluame)
###########################################################################################################

cat("Vamos por Recat 20... ", "\n")


# 21) recat_Z_peso_nacim (U)
nuevas_columnas[[21]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var021_U.R")
remove(evaluame)
############################################################################################################

# 22) recat_Z_peso_egreso (V)
nuevas_columnas[[22]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var022_V.R")
remove(evaluame)
############################################################################################################

# 23) recat_Z_PC_nacim (W)
nuevas_columnas[[23]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var023_W.R")
remove(evaluame)
############################################################################################################

# 24) recat_Z_PC_egreso (X)
nuevas_columnas[[24]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var024_X.R")
remove(evaluame)
############################################################################################################


# 25) recat_fusion_retino (Y)
nuevas_columnas[[25]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var025_Y.R")
remove(evaluame)

############################################################################################################



# 26) recat_edad3 (Z)
nuevas_columnas[[26]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var026_Z.R")
remove(evaluame)
############################################################################################################


# 27) recat_fusion_arm_cpap (AA)
nuevas_columnas[[27]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var027_AA.R")
remove(evaluame)
############################################################################################################


# 28) recat_fusion_ds_dp (AB)
nuevas_columnas[[28]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var028_AB.R")
remove(evaluame)
############################################################################################################



# 29) recat_eco3 (AC)
nuevas_columnas[[29]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var029_AC.R")
remove(evaluame)
############################################################################################################



# 30) recat_dias_int_fallec (AD)
nuevas_columnas[[30]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var030_AD.R")
remove(evaluame)
############################################################################################################

cat("Vamos por Recat 30... ", "\n")

# 31) recat_control_mas_tres (AE)
nuevas_columnas[[31]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var031_AE.R")
remove(evaluame)
############################################################################################################



# 32) recat_fusion_retino2 (AF)
nuevas_columnas[[32]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var032_AF.R")
remove(evaluame)
############################################################################################################

# 33) recat_criterio_seleccion1 (AG)
nuevas_columnas[[33]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var033_AG.R")
remove(evaluame)
############################################################################################################


# 34) criterio_seleccion2 (AH)
nuevas_columnas[[34]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var034_AH.R")
remove(evaluame)
############################################################################################################


# 35) criterio_seleccion3 (AI)
nuevas_columnas[[35]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var035_AI.R")
remove(evaluame)
############################################################################################################


# 36) criterio_seleccion4 (AJ)
nuevas_columnas[[36]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var036_AJ.R")
remove(evaluame)
############################################################################################################



# 37) criterio_seleccion5 (AK)
nuevas_columnas[[37]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var037_AK.R")
remove(evaluame)
############################################################################################################




# 38) criterio_seleccion6 (AL)
nuevas_columnas[[38]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var038_AL.R")
remove(evaluame)
############################################################################################################

# 39) criterio_seleccion6 (AM)
nuevas_columnas[[39]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var039_AM.R")
remove(evaluame)
############################################################################################################



# 40) recat_rangos_eg_final (AN)
nuevas_columnas[[40]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var040_AN.R")
remove(evaluame)
############################################################################################################

cat("Vamos por Recat 40... ", "\n")


# 41) recat_criterio_inclusion8 (AO)
nuevas_columnas[[41]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var041_AO.R")
remove(evaluame)
############################################################################################################


# 42) recat_criterio_inclusion9 (AP)
nuevas_columnas[[42]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var042_AP.R")
remove(evaluame)
############################################################################################################


# 43) recat_dap (AQ)
nuevas_columnas[[43]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var043_AQ.R")
remove(evaluame)
############################################################################################################


# 44) recat_fusion_retino3 (AR)
nuevas_columnas[[44]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var044_AR.R")
remove(evaluame)
############################################################################################################



# 45) recat_dbp (AS)
nuevas_columnas[[45]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var045_AS.R")
remove(evaluame)
############################################################################################################



# 46) recat_gravedad_dbp (AT)
nuevas_columnas[[46]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var046_AT.R")
remove(evaluame)
############################################################################################################



# 47) recat_criterio_inclusion10 (AU)
nuevas_columnas[[47]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var047_AU.R")
remove(evaluame)
############################################################################################################


# 48) recat_fusion_grado_hemo (AV)
nuevas_columnas[[48]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var048_AV.R")
remove(evaluame)
############################################################################################################


# 49) recat_criterio_inclusion11 (AW)
nuevas_columnas[[49]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var049_AW.R")
remove(evaluame)
############################################################################################################



# 50) recat_criterio_inclusion12 (AX)
nuevas_columnas[[50]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var050_AX.R")
remove(evaluame)
############################################################################################################

cat("Vamos por Recat 50... ", "\n")

# 51) recat_atb_cultivos_sp (AY)
nuevas_columnas[[51]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var051_AY.R")
remove(evaluame)
############################################################################################################



# 52) recat_atb_dias_general (AZ)
nuevas_columnas[[52]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var052_AZ.R")
remove(evaluame)
############################################################################################################



# 53) recat_st_cultivo_general (BA)
nuevas_columnas[[53]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var053_BA.R")
remove(evaluame)
############################################################################################################


# 54) recat_atb_cultivos_st (BB)
nuevas_columnas[[54]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var054_BB.R")
remove(evaluame)
############################################################################################################

# 55) recat_criterio_seleccion13  (BC)
nuevas_columnas[[55]] <- mega(input = "../009_ScriptRecat/002_CadaVarRecat/var055_BC.R")
remove(evaluame)
############################################################################################################



cat("Ultima... Recat 55... ", "\n")
#

#
#
#
#
#



# Reunimos todas las columnas nuevas
rejunte_columnas <- as.data.frame(matrix(NA, nrow(BASE_MOD_ORIGINAL), length(nuevas_columnas)))
for (n in 1:ncol(rejunte_columnas)) rejunte_columnas[,n] <- nuevas_columnas[[n]]
for (n in 1:ncol(rejunte_columnas)) colnames(rejunte_columnas)[n] <- colnames(nuevas_columnas[[n]])





##############################################################################################

# NUEVA_BASE <- cbind(BASE_ORIGINAL, rejunte_columnas)

NUEVA_BASE <- rejunte_columnas
fecha <- date()


# Donde sera guardado el reporte
ubicacion_entrega <- "../006_BaseRecat/003_BaseRecat"

# Detalles intermedios
# numero_entrega <- length(list.files(ubicacion_reporte)) + 1
numero_entrega <- length(list.files(ubicacion_entrega)) + 1
orden_entrega <- GenNum(numero_entrega)


# Version de Entrega SIBEN
carpeta_entrega <- paste0("V",orden_entrega, " - Base Recat - ", date())
dir_entrega <- paste0(ubicacion_entrega, "/", carpeta_entrega)
dir_entrega <- gsub(":", "_", dir_entrega)
dir.create(dir_entrega)

ultima_version_recat <- carpeta_UV(ubicacion_entrega)

# Carpetas XLS y CSV
direccion_carpeta_save_xls <- paste0(ubicacion_entrega, "/", ultima_version_recat, "/", "001_EXCEL")
direccion_carpeta_save_csv <- paste0(ubicacion_entrega, "/", ultima_version_recat, "/", "002_CSV")

# Creamos las carpetas de Excel y CSV
dir.create(direccion_carpeta_save_xls)
dir.create(direccion_carpeta_save_csv)

# # Control de versiones hasta el momento antes de generar la nueva base recat...
# ControlVersionesCarpetas(input_dir1 = direccion_carpeta_save_xls, 
#                          input_dir2 = direccion_carpeta_save_csv, 
#                          input_texto = "Base Recat - Antes de Generar la nueva base")

# # Vemos cuantas versiones hay hasta el momento...
# cantidad_versiones_csv <- length(list.files(direccion_carpeta_save_csv))


cat("Guardamos BASE RECAT - CSV...\n")
# Detallamos un nombre para nuestra nueva base CSV y la guardamos...
nombre_archivo_csv <- "004_Base_RECAT.csv"
este_archivo_nuevo_csv <- paste0(direccion_carpeta_save_csv, "/", nombre_archivo_csv)


write.table(NUEVA_BASE, file = este_archivo_nuevo_csv, row.names = FALSE, na = "",
          sep= ";", dec=".")# fileEncoding = "utf8")


#################################################################


cat("Guardamos BASE RECAT - EXCEL...\n")
#
library(openxlsx)

# Detallamos un nombre para nuestra nueva base CSV y la guardamos...
nombre_archivo_xls <- "004_Base_RECAT.xlsx"
este_archivo_nuevo_xls <- paste0(direccion_carpeta_save_xls, "/", nombre_archivo_xls)

# options("encoding" = "Latin1")

for(k1 in 1:ncol(NUEVA_BASE)){
  
  cambiaso <- as.character(as.vector(NUEVA_BASE[,k1]))
  Encoding(cambiaso) <- "latin1"
  
  NUEVA_BASE[,k1] <- cambiaso
} 

openxlsx::write.xlsx(NUEVA_BASE, file = este_archivo_nuevo_xls)
# openxlsx::write.xlsx(NUEVA_BASE, file = este_archivo_nuevo_xls, encoding="latin1")

# Los warning no son errores y solo se muestran
options(warn=1)

# # # Salida
# 



cat("****  Fin Generacion Base Recat", "\n")




