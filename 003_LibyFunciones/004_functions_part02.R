
# IN-Sobrevida-FD-Vivo

# Cargamos archivos para ser ejecutados...




mega <- function(input = NULL){

  source(input, encoding = "UTF-8")
  
  # "input" es un script
  # dentro debe contener un objeto llamado "evaluame".
  # que es quien contiene el codigo
  # El remate final es un objeto llamado "data_salida" 
  # que sera un data frame de una columna con la info nueva de la variable
  
  # En definitiva...  Es un source dentro de una funcion!!!!!!
  # Y esto lo hice para que cada recategorizacion sea estanca.
  # Cada vez que hago una recategorizacion genero objetos algun detalle, como son:
  # los "n" o "k" en bucles for...
  # o algun objeto para poder cortar la variable en pedazos.
  # De esta forma, todos esos objetos que genero son solo tenidos en cuenta
  # dentro del contexto de ese source, y luego son borrados.
  
  # Solo se quede con "data_salida" que sera guardado en algun objeto en particular, y tambien borrado.
  
  eval(parse(text = evaluame))  
  return(data_salida)
  
  remove(evaluame)

}




# Generamos los numeros para guardar archivos...
# Ejemplo... 001... 002... 014, etc.
GenNum <- function(input_numero = NULL, input_digitos = NULL) {
  
  if (is.null(input_digitos)) input_digitos <- 3
  
  cifras_total <- input_digitos
  estas_cifras <- strsplit(as.character(input_numero), "")[[1]]
  esta_cantidad <- length(estas_cifras)
  faltan_cifras <- cifras_total - esta_cantidad
  
  detalle <- paste0(paste0(rep(0, faltan_cifras), collapse=""),  input_numero)
  
  return(detalle)
  
} # Fin Function
####################################################################################


# Funcion para verificar los filtros de tablas
verificar.filtros <- function(input_ref_interno = NULL, input_columnas_filtro = NULL, input_mix_base = mix_base) {

  # input_ref_interno: es el nombre del objeto que sirve como referencia para ejecutar todos los graficos
  # input_colmnas_filtro: En cada punto del trabajo no siempre ingresan todos los pacientes
  #                       entonces dentro del 'input_ref_interno' hay columnas que sirven para generar subgrupos.
  #                       Este argumento es un vector, en donde cada elemento del vector es el nombre de la columna
  #                       que sirve como filtro para cada base de datos.
  # input_mix_base: es una lista, en donde cada elemento de la lista es una base de datos.
  # HAY QUE TENER CUIDADO DE INGRESAR LAS BASES DE DATOS Y EL NOMBRE DE LOS FILTROS EN EL MISMO ORDEN.
  
  
  # 
 
  
  detalle_subpoblacion <- input_ref_interno$Subpoblacion
  dt_sub <- detalle_subpoblacion == "SI"
  cantidad_sub <- sum(dt_sub)
  
  paso_OK <- list()

  # 1) Que solo un filtro este activo de los 3 posibles.
  # 1) Que todos los filtros empiecen con "IN" o con "EX"
  # 2) Que todos los filtros tengan al menos 4 elementos
  # 3) Que los diferentes filtros de una misma fila sean diferentes entre si
  # 4) Que la columna indicada pertenezca a la base de datos
  # 5) Que todos los niveles del factor indicados pertenezcan a la columna

  
  

    # Hacemos una minibase solo de los filtros
    mini_filtros <- as.matrix(input_ref_interno[, input_columnas_filtro])
    
    # 1) Que solo este activado uno de los 3 filtros o los 3 vacios.
    paso_01 <- rep(FALSE, nrow(mini_filtros)) # Esto es uno solo por fila
    
    for (n in 1:length(paso_01)) {
      
      esta_fila <- as.character(mini_filtros[n,])
      
      if(sum(is.na(esta_fila)) >= 2) paso_01[n] <- TRUE
      
    }
    if (sum(paso_01) == length(paso_01)) paso_OK[[1]] <- TRUE else paso_OK[[1]] <- FALSE
 
       
    # Con los filtros armamos una lista
    lista_filtros <- list()
    for (n in 1:nrow(mini_filtros)) {
      lista_filtros[[n]] <- list()
    
      filtros_fila <- na.omit(mini_filtros[n,])

      if (length(filtros_fila) > 0) {
      for (k in 1:length(filtros_fila)) {
        
        lista_filtros[[n]][[k]] <- strsplit(filtros_fila[k], "-")[[1]]
        
      } # Fin for k
      } # Fin if > 0
            
    } # Fin for n
    
    # 2) Que todos los filtros empiecen con "IN" o con "EX"
    if(paso_OK[[1]] == TRUE) {
    paso_02 <- rep(FALSE, nrow(mini_filtros)) # Esto es uno solo por fila
    for (n in 1:length(lista_filtros)) {
      
      cantidad_filtros <- length(lista_filtros[[n]]) 
      if (cantidad_filtros > 0) {
        
        estado_fila <- rep(NA, cantidad_filtros)
        for (k in 1:cantidad_filtros){
          
          elegido <- lista_filtros[[n]][[k]][1]
          if (elegido == "IN" | elegido == "EX") estado_fila[k] <- TRUE else {
            
            estado_fila[k] <- FALSE
            cat("Problema 1 - IN/EX:", "Fila ", n, " - Filtro ", k, " - Indicado: ", mini_filtros[n,k], "\n")
          } # fin if
        } # Fin for k
        
        if (sum(estado_fila) == length(estado_fila)) paso_02[n] <- TRUE
        
        
      } else paso_02[n] <- TRUE
    } # Fin for n  
    if (sum(paso_02) == length(paso_02)) paso_OK[[2]] <- TRUE else paso_OK[[2]] <- FALSE
    } else paso_OK[[2]] <- FALSE
    
    
    # 3) Que todos los filtros tengan al menos 4 elementos
    if(paso_OK[[2]] == TRUE) {
      paso_03 <- rep(FALSE, nrow(mini_filtros)) # Esto es uno solo por fila
      for (n in 1:length(lista_filtros)) {
        
        cantidad_filtros <- length(lista_filtros[[n]]) 
        if (cantidad_filtros > 0) {
          
          estado_fila <- rep(NA, cantidad_filtros)
          for (k in 1:cantidad_filtros){
            
            elegido <- lista_filtros[[n]][[k]]
            if (length(elegido) >= 4) estado_fila[k] <- TRUE else {
              
              estado_fila[k] <- FALSE
              cat("Problema 2 - Menos de 4 elementos:", "Fila ", n, " - Filtro ", k, " - Indicado: ", mini_filtros[n,k], "\n")
            } # fin if
          } # Fin for k
          
          if (sum(estado_fila) == length(estado_fila)) paso_03[n] <- TRUE
          
          
        } else paso_03[n] <- TRUE
      } # Fin for n  
      if (sum(paso_03) == length(paso_03)) paso_OK[[3]] <- TRUE else paso_OK[[3]] <- FALSE
      
    } else paso_OK[[3]] <- FALSE
    
    
    # 4) Que los diferentes filtros de una misma fila no esten repetidos
    if(paso_OK[[3]] == TRUE) {
      paso_04 <- rep(FALSE, nrow(mini_filtros)) # Esto es uno solo por fila
      for (n in 1:length(lista_filtros)) {
        
        cantidad_filtros <- length(lista_filtros[[n]]) 
        if (cantidad_filtros > 0) {
          
          estos_filtros <- na.omit(mini_filtros[n,])
          orden_estos_filtros <- c(1:length(estos_filtros))
          
          tablita <- table(estos_filtros)
          
          dt_duplicados <- tablita >= 2
          estos_duplicados <- names(tablita)[dt_duplicados]
          
          if (length(estos_duplicados) > 0) {
            estado_fila[k] <- FALSE
            for (t in 1:length(estos_duplicados)) {

              dt_orden_duplicados <- estos_filtros == estos_duplicados[t]
              este_orden <- orden_estos_filtros[dt_orden_duplicados]
              
              if (length(estos_duplicados) == 1) detalle <- "" else detalle <- ", "
              armado <- paste0(este_orden, collapse = detalle)
              
              cat("Problema 3 - Filtros Duplicados:", "Fila ", n, " - Filtro ", armado, " - Indicado: ", mini_filtros[n,este_orden[1]], "\n")
              
            }
          } else paso_04[n] <- TRUE
        } else paso_04[n] <- TRUE
      } # Fin for n

      if (sum(paso_04) == length(paso_04)) paso_OK[[4]] <- TRUE else paso_OK[[4]] <- FALSE
      
    } else paso_OK[[4]] <- FALSE
    

    # 5) Que la columna indicada no pertenezca a la base de datos
    if(paso_OK[[4]] == TRUE) {
       paso_05 <- rep(FALSE, nrow(mini_filtros)) # Esto es uno solo por fila
       
       ncol_bases <- rep(NA, length(input_mix_base))
       for (h in 1:length(input_mix_base)) ncol_bases[h] <- ncol(input_mix_base[[h]])
       
       # bases_mix <- list()
       # bases_mix[[1]] <- input_base1
       # bases_mix[[2]] <- input_base2
       # bases_mix[[3]] <- input_base3
       # 
       
       estado_filtro <- rep(FALSE, length(lista_filtros))
       
      for (n in 1:length(lista_filtros)) {
        

        orden_interno <- c(1:ncol(mini_filtros))
        
        fila_filtro <- as.character(mini_filtros[n,])
        
        dt_filtro <- !is.na(fila_filtro)
        
        este_orden <- orden_interno[dt_filtro]
        
        este_ncol <- ncol_bases[este_orden]
        
        if (length(este_orden) == 1) {
        
          
          elegido <- lista_filtros[[n]][[1]][3]
          numero_del_elegido <- let2num(elegido)
          
          if (numero_del_elegido <= este_ncol) estado_filtro[n] <- TRUE else {
            
            estado_filtro[n] <- FALSE
            cat("Problema 5 - Columna fuera de la Base:", "Fila ", n, " - input_base ", este_orden, " - Indicado: ", mini_filtros[n,este_orden], "\n")
          } # fin if
          
        } else if(length(este_orden) == 0) estado_filtro[n] <- TRUE
      #####
        
  
            
          
            
           
          } # Fin for n
          
       
      if (sum(estado_filtro) == length(estado_filtro)) paso_OK[[5]] <- TRUE else paso_OK[[5]] <- FALSE
      
    } else paso_OK[[5]] <- FALSE
    
        
    # 6) Que todos los niveles del factor indicados pertenezcan a la columna
    if(paso_OK[[5]] == TRUE) {
      
      paso_06 <- rep(FALSE, nrow(mini_filtros)) # Esto es uno solo por fila
      estado_filtro <- rep(FALSE, length(lista_filtros))
        
     
       orden_interno <- c(1:ncol(mini_filtros))
      
      for (n in 1:length(lista_filtros)) {
        
        fila_filtro <- as.character(mini_filtros[n,])
        dt_filtro <- !is.na(fila_filtro)
        
        
        if (sum(dt_filtro) > 0) {
          
        este_orden <- orden_interno[dt_filtro]
        esta_base <- input_mix_base[[este_orden]]
        
            columna <- lista_filtros[[n]][[1]][3]
            numero_columna <- let2num(columna)
            niveles_elegidos <- lista_filtros[[n]][[1]][4:length(lista_filtros[[n]][[1]])]
            
            tablita1 <- table(esta_base[numero_columna])
            nombres1 <- names(tablita1)
            
            dt_elegido <- rep(NA, length(niveles_elegidos))
            
            for (t in 1:length(dt_elegido)) {
              if (sum(nombres1 == niveles_elegidos[t]) > 0) dt_elegido[t] <- TRUE else dt_elegido[t] <- FALSE 
            }
            
            if (sum(dt_elegido) == length(dt_elegido)) estado_filtro[n] <- TRUE else {
              
              estado_filtro[n] <- FALSE
              if (sum(dt_elegido) == 1) detalle <- "" else detalle <- ", "
              armado <- paste0(niveles_elegidos[!dt_elegido], collapse = detalle)
              cat("Problema 6 - Niveles fuera de la variable:", "Fila ", n, " - Filtro ", este_orden, " - No hay: '", armado, "'\n")
            } # fin if
            
            
            remove(esta_base)
            
        } else if (sum(dt_filtro == 0)) estado_filtro[n] <- TRUE
          
     
          
     
      } # Fin for n  
      
      
      
      if (sum(estado_filtro) == length(estado_filtro)) paso_OK[[6]] <- TRUE else paso_OK[[6]] <- FALSE
      
    } else paso_OK[[6]] <- FALSE
    
    
    # Aviso Final
    if (paso_OK[[length(paso_OK)]] == TRUE) cat("CONTROL OKKKKKKKKKKK", "\n") else cat("DANGER!!!", "\n")
      
    
  } # Fin Function
##################################################################################################################
  

# Creamos los filtros de las bases
crear.filtros <- function(input_ref_interno = NULL, input_columnas_filtro = NULL, input_mix_base = NULL) {
  

  
  # Esto va a dar como resultado una matriz donde cada columna es un filtro para una tabla, grafico o punto de
  # un trabajo.
  # Si una tabla tenia varios filtros, aqui va a obtener el resultado final de aplicar todos
  # esos filtros simultaneamente.
  
  
  detalle_subpoblacion <- input_ref_interno$Subpoblacion
  dt_sub <- detalle_subpoblacion == "SI"
  cantidad_sub <- sum(dt_sub)
  

  
  # Hacemos una minibase solo de los filtros
  mini_filtros <- as.matrix(input_ref_interno[, input_columnas_filtro])
  
  
  # Con los filtros armamos una lista
  lista_filtros <- list()
  for (n in 1:nrow(mini_filtros)) {
    lista_filtros[[n]] <- list()
    
    filtros_fila <- na.omit(mini_filtros[n,])
    
    if (length(filtros_fila) > 0) {
      for (k in 1:length(filtros_fila)) {
        
        lista_filtros[[n]][[k]] <- strsplit(filtros_fila[k], "-")[[1]]
        
      } # Fin for k
    } # Fin if > 0
    
  } # Fin for n
  
  # Creamos la matriz de filtros aplicados
  # Hay una columna por cada tabla o grafico
  filtros_aplicados <- matrix(NA, nrow(input_mix_base[[1]]), nrow(mini_filtros))
  
  rejunte_filtros <- list()
  
  # Por cada tabla o grafico...
  for (n in 1:ncol(filtros_aplicados)) {
  
    rejunte_filtros[[n]] <- list()
      
  # Si es que hace falta aplcar un filtro...
  if(dt_sub[n] == TRUE) {
    
    cantidad_filtros <- length(lista_filtros[[n]])
    
    if (cantidad_filtros > 0) {
      
      matrix_filtros <- matrix(NA, nrow(input_mix_base[[1]]), cantidad_filtros)
      
      
      # Por cada filtro...
      for (t in 1:cantidad_filtros) {
        
        rejunte_filtros[[n]][[t]] <- list()
        
        #######
        orden_interno <- c(1:ncol(mini_filtros))
        
          fila_filtro <- as.character(mini_filtros[n,])
          dt_filtro <- !is.na(fila_filtro)
          este_orden <- orden_interno[dt_filtro]
          esta_base <- input_mix_base[[este_orden]]
            
        ##########
        niveles_filtro <- lista_filtros[[n]][[t]][4:length(lista_filtros[[n]][[t]])]
        esta_columna <- lista_filtros[[n]][[t]][3]
        tipo_filtro <- lista_filtros[[n]][[t]][1]
        
        matrix_niveles <- matrix(NA, nrow(esta_base), length(niveles_filtro))
        
        # Por cada nivel del filtro
        for (h in length(niveles_filtro)) {
          
          base_cortada <- esta_base[,let2num(esta_columna)]
          dt_aplicado <- base_cortada == niveles_filtro[h]
          
          # Si es un criterio de exclusion... los detectados son los
          # que NO tienen que ir.
          if (tipo_filtro == "EX") dt_aplicado <- !dt_aplicado
          
          # A los datos vacios... les damos FALSE para que quite esas filas
          dt_aplicado[is.na(dt_aplicado)] <- FALSE
          
          # Guardamos todo lo anterior en la matrix de los niveles
          matrix_niveles[,h] <- dt_aplicado
          
        } # Fin for h
        
        matrix_filtros[,t] <- rowSums(matrix_niveles) == ncol(matrix_niveles)
          
        
     
        
      } # Fin for t
      
      filtros_aplicados[,n] <- rowSums(matrix_filtros) > 0
      
    } else cat("Falta determinar filtros para Fila", n, "\n", "DANGERRRRRRRRR!!!!")
  
      
  }  
    
  }
  

  return(filtros_aplicados)
  
} # Fin function
########################################################################################################################



# Funcion para generar las Minibases de las Tablas y aplicar los filtros...
crear.minibase.tablas <- function(input_ref_interno = NULL, input_mix_base = NULL, input_filtros = NULL){
  
  # input_mix_base <- mix_base
  
  minibase_interno <- list()

  for(n in 1:nrow(input_ref_interno)) {
    
    seleccion1 <- input_ref_interno$"Columnas_Base_Original"[n]
    estas_columnas1 <- NULL
    numero_columnas1 <- NULL
    parte1_mini <- NULL
    if (!is.na(seleccion1)) {
    estas_columnas1 <- strsplit(seleccion1, "-")[[1]]
    numero_columnas1 <- let2num(estas_columnas1)
    if (length(numero_columnas1) == 1) parte1_mini <- input_mix_base[[1]][numero_columnas1]
    if (length(numero_columnas1) > 1) parte1_mini <- input_mix_base[[1]][,numero_columnas1]
    }
    
    seleccion2 <- input_ref_interno$"Columnas_Base_Recategorizada"[n]
    estas_columnas2 <- NULL
    numero_columnas2 <- NULL
    parte2_mini <- NULL
    if (!is.na(seleccion2)) {
      estas_columnas2 <- strsplit(seleccion2, "-")[[1]]
      numero_columnas2 <- let2num(estas_columnas2)
      if (length(numero_columnas2) == 1) parte2_mini <- input_mix_base[[2]][numero_columnas2]
      if (length(numero_columnas2) > 1) parte2_mini <- input_mix_base[[2]][,numero_columnas2]
    }
    
    seleccion3 <- input_ref_interno$"Columnas_Base_IPT"[n]
    estas_columnas3 <- NULL
    numero_columnas3 <- NULL
    parte3_mini <- NULL
    if (!is.na(seleccion3)) {
      estas_columnas3 <- strsplit(seleccion3, "-")[[1]]
      numero_columnas3 <- let2num(estas_columnas3)
      if (length(numero_columnas3) == 1) parte3_mini <- input_mix_base[[3]][numero_columnas3]
      if (length(numero_columnas3) > 1) parte3_mini <- input_mix_base[[3]][,numero_columnas3]
    }  
    
    estado_subpoblacion <- input_ref_interno$Subpoblacion[n]
        
    minibase_interno[[n]] <- list()
   
    todas_columnas_juntas <- c(estas_columnas1, estas_columnas2, estas_columnas3)
    
    dt_reveer <- todas_columnas_juntas == "Reveer"
    dt_no_corresponde <- todas_columnas_juntas == "No Corresponde"
    
    # Si no hay que reveer las columnas
    # y no hay subpoblacion
    if((sum(dt_reveer) == 0) && (sum(dt_no_corresponde) == 0)) {
      
      
      dt_base <- rep(NA, 3)
      
      # Minibase
      if (!is.null(numero_columnas1)) dt_base[1] <- TRUE else dt_base[1] <- FALSE
      if (!is.null(numero_columnas2)) dt_base[2] <- TRUE else dt_base[2] <- FALSE
      if (!is.null(numero_columnas3)) dt_base[3] <- TRUE else dt_base[3] <- FALSE
    
        
      mini <- NULL

      # Carga alguna de las 3
      if(dt_base[1]) mini <- parte1_mini else if(dt_base[2]) mini <- parte2_mini else if(dt_base[3]) mini <- parte3_mini

      # Si la primera ya cargo... y puede cargar la 2da... carga la segunda...
      if(dt_base[1]) if (dt_base[2]) mini <- cbind(mini, parte2_mini)
      
      # Si ya cargo la primera o la segunda, carga la 3ra
      if(dt_base[1] | dt_base[2]) if (dt_base[3]) mini <- cbind(mini, parte3_mini)
                  

          
      if (estado_subpoblacion == "SI" && !is.null(input_filtros)) {
      
      mini_guardado <- mini
      
      este_filtro <- input_filtros[,n]
      mini <- mini[este_filtro, ]
      
      # # # AGREGADO
      if (is.null(dim(mini))){
        dim(mini) <- c(length(mini), 1)
        colnames(mini) <- colnames(mini_guardado)
      }
      
      }
      
      # Aviso!
      if (estado_subpoblacion == "SI" && is.null(input_filtros)) {
      
        cat(" *** Falta agregar los filtros, o hay que poner 'NO' en Subpoblacion en fila ", n, "\n")
      }
      
      # Sacamos las filas vacias que quedan
      mini <- na.omit(mini)
      
      # Guardamos la mini armada
      minibase_interno[[n]] <- mini
      
   
      
    } else  {
   
      # minibase_interno[[n]] <- NULL
      # minibase_interno[[n]] <- n
      minibase_interno[[n]] <- NA
     
    } # Fin else
    
  } # Fin for n

  return(minibase_interno)
  
 
} # Fin function
############################################################################################################################



# Funcion para modificar las minibases de acuerdo a los filtros que se  crearon
# (((NO SE SI LA ESTOY USANDO O NO...)))
modificar.minibase.tablas <- function(ref_interno = NULL, input_base = BASE_MOD) {
  
  modificar <- ref_interno$Subpoblacion
  
  for (n in 1:length(modificar)) {
    
    if (modificar == "SI") {
      
      dt_f1 <- colnames(tabla_ref) == "Filtro1"
      num_f1 <- c(1:ncol(tabla_ref))[dt_f1]
      
      estas_columnas <- num_f1:ncol(tabla_ref)
      
      estos_filtros <- na.omit(ref_interno[n, estas_columnas])
      
      matrix_filtro <- matrix(NA, nrow(BASE_MOD), length(estos_filtros))
      
      
      
    }
    
  }
  
  
  
}
#############################################################################################

# Funcion para generar las naval de las Minibases
# # # REVISION!!!!!
crear.naval.tablas <- function(input_ref_interno = NULL, 
                               input_mix_base = NULL,
                               input_detalle_base = NULL, 
                               input_columnas_var = NULL,
                               input_columnas_filtro = NULL){
  

  
  
  seleccion_var <- list()
  seleccion_filtro <- list()
  
  
  # Por cada fila del archivo de referencia
  for(n in 1:nrow(input_ref_interno)) {

    seleccion_var[[n]] <- list()
    seleccion_filtro[[n]] <- list()
    
    # Por cada set de columnas de cada base de datos...
    for (k in 1:length(input_columnas_var)) {
      
      seleccion_var[[n]][[k]] <- input_ref_interno[,input_columnas_var[k]][n]
      seleccion_filtro[[n]][[k]] <- input_ref_interno[,input_columnas_filtro[k]][n]
    
    } # Fin for k
  } # Fin for n

  
  # Por cada fila del archivo de referencia
  for(n in 1:nrow(input_ref_interno)) {
  
    # Por cada set de columnas de cada base de datos...
    for (k in 1:length(input_columnas_var)) {
      
      if (!is.na(seleccion_var[[n]][[k]])) {
      
        seleccion_var[[n]][[k]] <- strsplit(seleccion_var[[n]][[k]], "-")[[1]]
      }
      
      if (!is.na(seleccion_filtro[[n]][[k]])) {
        
        seleccion_filtro[[n]][[k]] <- strsplit(seleccion_filtro[[n]][[k]], "-")[[1]][3]
      }
      
    } # Fin for k
  } # Fin for n 
  

  naval_tablas <- list()
  #  numero   si es var o filtro
  nombre_general <- c("Orden", "Detalle", "Base", "Nombre Columna", "Letra Columna", "Numero de Columna", "Observacion")
  
  
  # Por cada fila del archivo
  for(n in 1:nrow(input_ref_interno)) {
    
    
    naval_tablas[[n]] <- as.data.frame(matrix(NA, 1, length(nombre_general)))
    colnames(naval_tablas[[n]]) <- nombre_general
    
    contador_externo <- 0
      
      # Por cada set de columnas 'variables' de una fila...
      for (k in 1:length(seleccion_var[[n]])) {
        
        estas_columnas <- seleccion_var[[n]][[k]]
        
        # Si hay algo anotado...
        if(!is.na(estas_columnas[1])) {
          
          # Por cada variable anotada...
          for (p in 1:length(estas_columnas)) {
        
        # Aumentamos el contador    
        contador_externo <- contador_externo + 1
        
        esta_letra_columna <- estas_columnas[p]  
        este_numero_columna <- let2num(esta_letra_columna)
        este_nombre_columna <- colnames(input_mix_base[[k]])[este_numero_columna]
        
        vector_salida <- c(contador_externo, paste0("Variable", contador_externo, sep=""), 
                           input_detalle_base[k], este_nombre_columna, esta_letra_columna, este_numero_columna, "-----")
             
        naval_tablas[[n]] <- rbind(naval_tablas[[n]], vector_salida)
        remove(vector_salida)
                      
          } # Fin for p
        }
      } # Fin for k
      

    # Por cada set de columnas 'filtro' de una fila...
    for (k in 1:length(seleccion_filtro[[n]])) {
      
      estas_columnas <- seleccion_filtro[[n]][[k]]
      
      # Si hay algo anotado...
      if(!is.na(estas_columnas[1])) {
        
        # Por cada filtro anotado...
        for (p in 1:length(estas_columnas)) {
          
          # Aumentamos el contador    
          contador_externo <- contador_externo + 1
          
          esta_letra_columna <- estas_columnas[p]  
          este_numero_columna <- let2num(esta_letra_columna)
          este_nombre_columna <- colnames(input_mix_base[[k]])[este_numero_columna]
          
          vector_salida <- c(contador_externo, "Filtro", 
                             input_detalle_base[k], este_nombre_columna, esta_letra_columna, este_numero_columna,
                             input_ref_interno[,input_columnas_filtro[k]][n])
          
          naval_tablas[[n]] <- rbind(naval_tablas[[n]], vector_salida)
          remove(vector_salida)
          
        } # Fin for p
      }
    } # Fin for k
    
    
    naval_tablas[[n]] <- na.omit(naval_tablas[[n]])
    rownames(naval_tablas[[n]]) <- c(1:nrow(naval_tablas[[n]]))
  } # Fin for n
 
  
  
   
    
  
      
  # 'Reveer' o 'No Corresponde
  for (n in 1:length(naval_tablas)) {
    
    dime <- naval_tablas[[n]][,5]
    
    dt1 <- dime == "Reveer"
    dt2 <- dime == "No Corresponde"
    
    if (sum(dt1)> 0) {
      
      neutral1 <- matrix("Reveer", nrow(naval_tablas[[n]]), ncol(naval_tablas[[n]]))
      colnames(neutral1) <- colnames(naval_tablas[[n]])
      naval_tablas[[n]] <- neutral1
    } 
     
    
    if (sum(dt2)> 0) {
      
      neutral2 <- matrix("No Corresponde", nrow(naval_tablas[[n]]), ncol(naval_tablas[[n]]))
      colnames(neutral2) <- colnames(naval_tablas[[n]])
      naval_tablas[[n]] <- neutral2
    } 
      
      
    } # Fin for n
    
  
  # Salida
  return(naval_tablas)
  
  
  }
################################################################################


# Funcion para generar tablas que muentras los criterion "IN" y "EX" de cada tabla o grafico
crear.tabla.filtro <- function(ref_interno = NULL, input_base = NULL){
  
  primera_col <- c(1:ncol(ref_interno))[colnames(ref_interno) == "Filtro1"]
  ultima_col <- ncol(ref_interno)
  
  mini_filtros <- ref_interno[c(primera_col:ultima_col)]
  
  detalle_filtros <- list()
  
  
  
  
  for (n in 1:nrow(mini_filtros)) {
    
    detalle_filtros[[n]] <- list()
    detalle_filtros[[n]][[1]] <- list()
    detalle_filtros[[n]][[2]] <- list()
  
    matrix_filtros_in <- matrix(NA, 3, 2)
    colnames(matrix_filtros_in) <- c("Orden", "Filtro")
    matrix_filtros_ex <- matrix_filtros_in
      
    
    estos_filtros <- na.omit(as.matrix(mini_filtros[n,]))
        
    salida_general_in <- matrix("No se aplicó filtro de inclusión", 1, 2)
    salida_general_ex <- matrix("No se aplicó filtro de exclusión", 1, 2)
    colnames(salida_general_in) <- c("Orden", "Filtro")
    colnames(salida_general_ex) <- c("Orden", "Filtro")
    
    # Si hay filtros
    if (length(estos_filtros) > 0) {
    contador_in <- 0
    contador_ex <- 0
    
    for(k in 1:length(estos_filtros)) {
      
      este_filtro <- estos_filtros[k]
      
      metralla <- strsplit(este_filtro, "-")[[1]]
    
      if(metralla[1] == "IN") {
        contador_in <- contador_in + 1
        matrix_filtros_in <- rbind(c(contador_in, este_filtro), matrix_filtros_in)
      }  
      
      if(metralla[1] == "EX") {
        contador_ex <- contador_ex + 1
        matrix_filtros_ex <- rbind(c(contador_ex, este_filtro), matrix_filtros_ex)
      }
      
      
      
      
      
    }
    
    matrix_filtros_in <- na.omit(matrix_filtros_in)
    matrix_filtros_ex <- na.omit(matrix_filtros_ex)
    
    if (nrow(matrix_filtros_in) == 0) matrix_filtros_in <- salida_general_in
    if (nrow(matrix_filtros_ex) == 0) matrix_filtros_ex <- salida_general_ex
    
    } else {
      matrix_filtros_in <- salida_general_in
      matrix_filtros_ex <- salida_general_ex
      
    }
    
    colnames(matrix_filtros_in)[2] <- "Filtro Inclusión"
    colnames(matrix_filtros_ex)[2] <- "Filtro Exclusión"
    
    detalle_filtros[[n]][[1]] <- matrix_filtros_in
    detalle_filtros[[n]][[2]] <- matrix_filtros_ex
    
  } # Fin for n
  
  return(detalle_filtros)
  
}

# Funcion para cre
tabla_FAP <- function(input_fa = NULL, input_p = NULL){
  
  
  salida <- input_fa
  salida <- as.matrix(salida)
  
  porcentaje <- as.matrix(input_p)
  for (n in 1:ncol(porcentaje)) { porcentaje[,n] <- paste0("(", porcentaje[,n], ")")}
  
  
  for (n in 1:nrow(salida)) {
    for (k in 1:ncol(salida)) {
      
      salida[n,k] <- paste0(salida[n,k], porcentaje[n,k])
      
    }
    
    
  }
  
  salida <- as.data.frame(salida)
  
  
  return(salida)
  
  habla_general <- TRUE
  
  # Cargamos herramientas
  source("../003_Carga_MOD_BASE/003_Carga_MOD_BASE.R", encoding = "UTF-8")
  
  # Objetos iniciales de partes, tablas y graficos
  source("../005_PARTES/005_Partes - 001_Objetos Iniciales.R", encoding = "UTF-8")  # Carga ref_interno  y ref_graficos
  source("../006_TABLAS/006_Tablas - 001_Objetos Iniciales.R", encoding = "UTF-8")
  source("../007_GRAFICOS/007_Graficos - 001_Objetos Iniciales.R", encoding = "UTF-8")
  
  # Borramos los graficos anteriores de la carpeta "graf"
  source("../007_GRAFICOS/007_Graficos - 002_Carpeta Grafica.R", encoding = "UTF-8")
  
  # Generamos todas las minibases de cada Parte
  source("../005_PARTES/005_Partes - 002_Creacion de Partes.R", encoding = "UTF-8")
  
  # Generamos todas las tablas en R
  source("../006_TABLAS/006_Tablas - 002_Crear Tablas.R", encoding = "UTF-8")
  
  # Generamos y guardamos todos los graficos en todos los formatos
  source("../007_GRAFICOS/007_Graficos - 003_Crear Graficos.R", encoding = "UTF-8")
  
  # Generamos y guardamos todas las tablas en todos los formatos
  source("../006_TABLAS/006_Tablas - 003_Guardar Tablas.R", encoding = "UTF-8")
  
  #list.files("../007_GRAFICOS")
  # Levantamos todos los titulos de cada tabla y cada grafico, notas y otros detalles
  
  
  
  
  
  
}



armado.graf.tortas <- function(input_tabla = NULL) {
  
  mini_armado <- list()
  
  # Detalles
  mini_armado[[1]] <- input_tabla[,1]  # Nombre de categorias
  mini_armado[[2]] <- input_tabla[,6]  # Porcentajes
  mini_armado[[3]] <- input_tabla[,2]  # Frecuencia Absoluta
  
  # # Porcentaje + (Frecuencia)
  mini_armado[[4]] <- paste0(input_tabla[,6], "\n", paste0("(", input_tabla[,2], ")"))
  
  # # Categoria + Porcentaje + (Frecuencia)
  mini_armado[[5]] <- paste0(input_tabla[,1], "\n", input_tabla[,6], "\n", paste0("(", input_tabla[,2], ")"))
  
  return(mini_armado)
  
}

tortas2_SIBEN <- function(input_tabla = NULL, 
                          input_detalle = NULL, 
                          input_referencia = NULL, 
                          input_colores = NULL,
                          input_main = NULL) {
  
  if(is.null(input_detalle)) input_detalle <- 4
  if(is.null(input_referencia)) input_referencia <- 1
  if(is.null(input_colores)) input_colores <- c("blue", "orange", "red", "green", "yellow")
  if(is.null(input_main)) input_main <- ""
  
  mini_armado <- list()
  
  # Detalles
  mini_armado[[1]] <- input_tabla[,1]  # Nombre de categorias
  mini_armado[[2]] <- input_tabla[,6]  # Porcentajes
  mini_armado[[3]] <- input_tabla[,2]  # Frecuencia Absoluta
  
  # # Porcentaje + (Frecuencia)
  mini_armado[[4]] <- paste0(input_tabla[,6], "\n", paste0("(", input_tabla[,2], ")"))
  
  # # Categoria + Porcentaje + (Frecuencia)
  mini_armado[[5]] <- paste0(input_tabla[,1], "\n", input_tabla[,6], "\n", paste0("(", input_tabla[,2], ")"))
  
  
 
  
  frecuencias <- input_tabla[,2]
  names(frecuencias) <- mini_armado[[input_detalle]]
  
   pie(frecuencias, border="white", clockwise=TRUE, col = input_colores, main= input_main, cex=1.5)
   
  legend("bottom", input_tabla[,1], cex = 0.8, 
         fill = input_colores, 
         legend=mini_armado[[input_referencia]], horiz = T)
  
  
  #return(grafico_tortas)
  
  
  
  
  
}




GenNameGraf <- function(input_numero = NULL, input_carpeta = NULL, input_digitos = NULL) {
  
  if (is.null(input_carpeta)) input_carpeta <- "graf"
  if (is.null(input_digitos)) input_digitos <- 3
  
  cifras_total <- input_digitos
  estas_cifras <- strsplit(as.character(input_numero), "")[[1]]
  esta_cantidad <- length(estas_cifras)
  faltan_cifras <- cifras_total - esta_cantidad
  
  detalle <- paste0(paste0(rep(0, faltan_cifras), collapse=""),  input_numero)
  nombre_grafico <- paste0("Grafico ", detalle)
  direccion_completa <- paste0(input_carpeta, "/", nombre_grafico, ".png")
  
  return(direccion_completa)
  
  # if (input_plot == "tortas") {
  # library(png)
  # png(filename = direccion_completa, width = 480, height = 480)
  # tortas2_SIBEN(tabla_fa, input_main = titulo_grafico)
  # dev.off()
  # }
}




barras2_SIBEN <- function(input_tablas_varias = NULL, 
                          input_colores = NULL,
                          input_main = NULL,
                          input_columna = NULL) {
  
  if(is.null(input_colores)) input_colores <- c("blue", "orange", "red", "green", "yellow")
  if(is.null(input_main)) input_main <- ""
  if(is.null(input_columna)) input_columna <- 2
  
  tablas_varias <- input_tablas_varias
  tabla_fa <- tablas_varias[[1]]
  tabla_fr <- tablas_varias[[3]]
  tabla_p <- tablas_varias[[4]]
  valores_porcentajes <- as.character(as.vector(as.matrix(tabla_p[2])))
  for (n in 1:length(valores_porcentajes)) valores_porcentajes[n] <- strsplit(valores_porcentajes[n], "%")[[1]]
  valores_porcentajes <- as.numeric(valores_porcentajes)
  names(valores_porcentajes) <- rownames(tabla_fa)
  
  inscriptos <- as.vector(as.matrix(tabla_p[,input_columna]))
  
   valores_x <- barplot(valores_porcentajes, col="red", 
                        ylim=c(0,100), ylab="Porcentaje",
                        main = input_main, 
                        names.arg="")
  text(valores_x, -3.7, srt = 60, adj= 1, xpd = TRUE, labels = names(valores_porcentajes) , cex=1.2)
   
   
  text(valores_x, valores_porcentajes + 5, inscriptos)
  
  
  
  
  
  
}



barras100_SIBEN <- function(input_tabla = NULL, input_colores = NULL, input_main=NULL) {
  
  # Para tablas de doble entrada donde solo quiero graficar una de las categorias...
  # por ejemplo... solo los VIVOS, las categorias de peso que hay.
  # input columna me permite elegir qué columna es la que grafico de la tabla.
  
  if(is.null(input_main)) input_main = ""
  if(is.null(input_colores)) input_colores <- rainbow(nrow(input_tabla))
  
  tabla_interna <- input_tabla
  total_col <- colSums(tabla_interna)
  for(n in 1:ncol(tabla_interna)) {
    tabla_interna[,n] <- tabla_interna[,n]/total_col[n]
    tabla_interna[,n] <- round2(tabla_interna[,n], 2)
    tabla_interna[,n] <- tabla_interna[,n]*100
  }
  
  barplot(tabla_interna, main=input_main, col=input_colores, ylab="Porcentaje")
  
}

barras3_SIBEN <- function(input_tablas_varias = NULL, input_seleccion = NULL, input_main = NULL) {
  
  if (is.null(input_seleccion)) input_seleccion <- c(1:13)
  if (is.null(input_main)) input_main <- NULL
  
  tabla_fa <- input_tablas_varias[[1]]
  tabla_fr <- input_tablas_varias[[3]]
  tabla_p <- input_tablas_varias[[4]]
  unidades <- rownames(tabla_fa)
  
  orden_uni <- order(as.character(unidades), decreasing = F)
  orden_vivos <- order(as.numeric(as.character(tabla_fr[,2])), decreasing = T)
  
  tabla_fa <- tabla_fa[orden_vivos, ]
  tabla_fr <- tabla_fr[orden_vivos, ]
  tabla_p <- tabla_p[orden_vivos, ]
  unidades <- unidades[orden_vivos]
  
  # Ordenamos para que las instituciones aparezcan en el ordne
  # de mayor a menor sobrevida
  sizes <- factor(unidades,
                  levels = unidades[orden_vivos])
  
  
  # Vamos con la seleccion1...
  # Esto es por que hay muchas instituciones... y no entran todas en el grafico
  # de barras. Solo ponemos las mejores 13 en este caso.
  
  seleccion1 <- input_seleccion
  
  tabla_fa1 <- tabla_fa[seleccion1, ]
  tabla_fr1 <- tabla_fr[seleccion1, ]
  tabla_p1 <- tabla_p[seleccion1, ]
  sizes1 <- factor(sizes[seleccion1],
                   levels = sizes[seleccion1])
  
  
  valores_porcentajes1 <- as.character(as.vector(as.matrix(tabla_p1[2])))
  for (n in 1:length(valores_porcentajes1)) valores_porcentajes1[n] <- strsplit(valores_porcentajes1[n], "%")[[1]]
  valores_porcentajes1 <- as.numeric(valores_porcentajes1)
  names(valores_porcentajes1) <- rownames(tabla_p1)
  
  inscriptos1 <- as.vector(as.matrix(tabla_p1[,2]))
  
  
  valores_x <- barplot(valores_porcentajes1, col="red", 
                       ylim=c(0,100), ylab="Porcentaje",
                       main = input_main)
 # text(valores_x, -3.7, srt = 60, adj= 1, xpd = TRUE, labels = names(valores_porcentajes1) , cex=1.2)
  
  
  text(valores_x, valores_porcentajes1 + 5, inscriptos1)
  
  
  
}



  


tabla_naval <- function(input_base = NULL, input_letras = NULL) {
  
  
  filas_maxima <- nrow(input_base)
  
  num_col <- let2num(input_letras)
  
  mini_base <- input_base[num_col]
  
  filas_var <- rep(NA, ncol(mini_base))
  for (n in 1:ncol(mini_base)) filas_var[n] <- length(na.omit(mini_base[,n]))
  
  filas_mini <- nrow(na.omit(mini_base))
  
  n_faltante <- filas_maxima - filas_mini
  
  pos_detalle <- c(input_letras, "---", "---", "---")
  filas_detalle <- c(filas_var, filas_mini, filas_maxima, n_faltante)
  porcentaje_detalle <- paste0(round2(filas_detalle/filas_maxima, 4)*100, "%")
  col_detalle <- c(colnames(mini_base), "---Minibase", "---Base", "---Pacientes Incompletos")
  
  salida <- cbind(pos_detalle, col_detalle, filas_detalle, porcentaje_detalle)
  
  colnames(salida) <- c("Letra Excel", "Nombre Columna", "n", "Porcentaje")
  return(salida)
}
  


