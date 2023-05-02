
# Otras funciones
###################


#  Funciones de Control
{
  ###
  
  control_alineado_filas <- function(input_b1 = NULL, input_b2 = NULL, input_speak = T,
                                     input_laststep = NULL, input_myreturn = FALSE){
    
    # Si no hay pedido de encadenamiento con un paso anterior...
    # o si el paso anterior fue todo bien...
    # seguimos ejecutando nuestro codigo.
    
    decision_interna <- input_laststep
    if (is.null(decision_interna)) decision_interna <- TRUE
    
    
    # # Return por defecto, es NULL
    my_final_return <- NULL
    
    
    # Damos inicio
    cat("Inicio: control_alineado_filas() ----------------------------\n")
    #######################################################################
    
    
    
    
    # Una vez tomada la decision de seguir o no...
    # Si efectivamente seguimos...
    if(decision_interna) {
      
      
      
      
      
      # Frases posibles
      frase1 <- "Control Alineación: OKKKK \n"
      frase2 <- "Control Alineacion: ERRORRRRRRRR!!!! DANGEEER!!!! \n"
      
      # Detalle de columnas
      col1 <- as.character(input_b1[,1])
      col2 <- as.character(input_b2[,1])
      
      # Comparacion de las columnas por:
      # 1)  cantidad de filas
      # 2)  contenido de filas en el mismo orden exacto
      
      # # Por cantidad
      dt_cantidad <- length(col1) == length(col2)
      
      # # Por contenido
      dt_contenido <- identical(col1, col2)
      
      
      
      
      # Si fallo en la cantidad
      if (!dt_cantidad) {
        
        cat(frase2)
        cat("Fallo en la cantidad de filas.", "\n", 
            "Los archivos no poseen la misma cantidad de filas.","\n",
            "Hay que verlos y recortar alguno de ellos.", "\n", 
            "Filas Archivo 1: ", length(col1), "\n",
            "Filas Archivo 2: ", length(col2), "\n", 
            "Diferencia en Filas: ", abs(length(col1) - length(col2)), "\n")
        
        # My Final Return
        my_final_return <- FALSE
      }
      
      
      # Si la cantidad esta bien, pero falla en el contenido
      if (dt_cantidad && !dt_contenido) {
        
        cat(frase2)
        cat("Fallo en el contenido.", "\n",
            "La cantidad de filas son las mismas, pero los archivos no tienen ", "\n", 
            "el mismo contenido fila por fila en la columna seleccionada.", "\n")
        
        # My Final Return
        my_final_return <- FALSE
        
      }
      
      
      # Si ambas estan bien...
      if (sum(dt_cantidad, dt_contenido) == 2 ) {
        
        cat(frase1)
        cat("Cantidad de filas y contenido de las filas coincide en ambos archivos.", "\n")
        
        # My Final Return
        my_final_return <- TRUE
      }
      
      
      
    }
    
    
    # Si decidimos no ejecutar la funcion de control de filas...
    if(!decision_interna) {
      
      cat("NO SE EJECUTARA - NO SE EJECUTARA - NO SE EJECUTARA - NO SE EJECUTARA - NO SE EJECUTARA - NO SE EJECUTARA", "\n")
      
      my_final_return <- FALSE
    }
    
    
    # Damos inicio
    cat("Fin: control_alineado_filas() ----------------------------\n\n\n")
    #######################################################################
    
    
    # Return (Detalles)
    if(input_myreturn) {
      
      return(my_final_return)
    }
    
    
    
    
  }
  
  
  
  control_niveles01 <- function(input_base = NULL, input_base_niveles = NULL, mi_archivo = NULL){
    
    #  library(writexl)
    
    # Damos inicio
    cat("Inicio: control_niveles01() ----------------------------\n")
    ########################################################
    
    
    
    
    # 1) Verificamos que ambas bases tengan las mismas columnas
    # en cantidad y en posicion de nombres
    {
      ###
      
      frase1 <- "OKKKK  - Control y Cambio Niveles 1) - Mismo nombre de columnas en ambos archivos\n"
      frase2 <- "DANGER!!! - Control y Cambio Niveles 1) -  Los archivos tienen diferentes columnas\n"
      
      
      nombres1 <- colnames(input_base)
      nombres2 <- colnames(input_base_niveles)
      
      cantidad1 <- length(nombres1)
      cantidad2 <- length(nombres2)
      diferencia <- cantidad1 - cantidad2
      
      dt_cantidad <- cantidad1 == cantidad2
      dt_contenido <- identical(nombres1, nombres2)
      
      if (sum(dt_cantidad, dt_contenido) == 2) decision1 <- TRUE else decision1 <- FALSE
      
      # Si algo esta mal en el control1
      if (!decision1) {
        
        # Caso 1 de 4) Mal la cantidad de columnas y mal el contenido
        ### En realidad, ya por tener mal la cantidad de columnas, el contenido 
        ### tambien estara mal. 
        ### La cantidad puede estar mal de dos formas...
        ### Forma 1 de 2) Menos cantidad de columnas en la base original
        ###     En tal caso, daremos un cartel de aviso de la situacion
        ###     pero no se generaran modificaciones en la base de datos
        ###     original
        if (diferencia < 0) {
          cat("Hay menos columnas en la base de datos original que en", "\n",
              "la base de los niveles. Se deben revisar los archivos originales.", "\n",
              "Aproposito no se genero una automatizacion de este punto.", "\n")
          
          
        }
        
        ### Forma 2 de 2) menos cantidad de columnas en la base de niveles
        ###     Aqui si, lo que haremos sera agregar las columnas que
        ###     se encentran en la base de datos original y no se encuentran
        ###     en la base de niveles.
        if (diferencia > 0) {
          cat("Hay mas columnas en la base de datos original que en", "\n",
              "la base de los niveles. Se agregaran ", diferencia, " a la base", "\n",
              "de niveles.", "\n")
          
          nuevas_posiciones <- (length(nombres2) + 1):length(nombres1)
          columnas_nuevas <- nombres1[nuevas_posiciones]
          
          anexo_nuevo <- as.data.frame(matrix(NA, nrow(input_base_niveles), length(columnas_nuevas)))
          colnames(anexo_nuevo) <- columnas_nuevas 
          
          for (n in 1:length(nuevas_posiciones)) {
            
            esta_variable <- input_base[,nuevas_posiciones[n]]
            
            dt_categorias <- is.character(esta_variable) | is.factor(esta_variable)
            
            vector_agregado <- c("NO", columnas_nuevas[n])
            
            mis_categorias <- c()
            
            if(dt_categorias){
              
              mis_categorias <- names(table(esta_variable))
              
              vector_agregado <- c(vector_agregado, mis_categorias)
              
            }
            
            relleno <- rep(NA, (nrow(input_base_niveles)-length(vector_agregado)))
            vector_agregado <- c(vector_agregado, relleno)
            
            anexo_nuevo[,n] <- vector_agregado
            
            
            
            
            remove(esta_variable, dt_categorias, vector_agregado, mis_categorias, relleno)
            
            
          }
          
          colnames(anexo_nuevo) <- columnas_nuevas 
          # Esta es la base nueva 
          nueva_base_niveles <- cbind(input_base_niveles, anexo_nuevo)
          
          
          # # Guardamos el nuevo archivo
          # write_xlsx(nueva_base_niveles, mi_archivo)
          
          
          # cat("Se agregaron las nuevas columnas y sus niveles a la base de niveles.", "\n",
          #     "Comience una nueva ejecucion de toda la programacion desde el paso inicial.", "\n")
          
          
          
          # Return
          mi_salida <- list(decision1, nueva_base_niveles)
          return(mi_salida)
          
        }
        
        
        # Caso 2 de 4) Bien la cantidad de columnas y mal el contenido
        ### Esto es por que hay diferencia en el nombre de las columnas.
        ### Seria algo muy grave esta situacion como para automatizarla y
        ### no ver los archivos en cuestion. Se dara solo un cartel de aviso
        ### de la situacion.
        if(dt_cantidad & !dt_contenido){
          cat("Si bien la cantidad de columnas el mismo en ambos archivos,", "\n",
              "hay diferencias en el nombre de las columnas de los archivos.", "\n",
              "Este caso es tan grave que merece ser resuelto revisando ambos archivos manualmente.", "\n")
          
          decision1 <- FALSE
        }
        
        
        # Caso 3 de 4) Mal la cantidad de columnas y bien el contenido
        ### Ese caso no es viable. Por eso no se desarrolla.
        ### Si tiene mal la cantidad de columnas, no puede tene bien el contenido.
      }
      
      
      if (decision1)  cat(frase1) else cat(frase2)
      
      
      
      
      
      
      # Si esta todo OK
      if (decision1) {
        # Caso 4 de 4) Bien la cantidad de columnas y bien el contenido
        ### Aqui esta todo OK. Da aviso de que esta todo bien, y permite
        ### pasar a otra instancia.
        
        
        # Return
        mi_salida <- list(decision1)
        return(mi_salida)
      }
      
      
      
      
      
      ###
    } # Fin 1)
    ##################################################################################
    
    
    
  }
  
  
  
  
  control_niveles02 <- function(input_base = NULL, input_base_niveles = NULL, mi_archivo = NULL){
    
    #  library(writexl)
    
    # Damos inicio
    cat("Inicio: control_niveles02() ----------------------------\n")
    ########################################################
    
    
    
    
    
    
    # 1) Verificamos que ambas bases tengan los mismos niveles en las 
    # variables categoricas
    
    {
      ###
      
      frase1 <- "OKKKK  - Control de Niveles 02 1) - Los archivos tienen los mismos niveles\n"
      frase2 <- "DANGER!!! - Control de Niveles 02 1) -  Los archivos tienen diferentes niveles\n"
      
      
      ############
      # Creamos una nueva base, donde realizaremos los cambios
      base_mod <- input_base_niveles
      
      # Tenemos ya detectadas cuales son las variables a las que vamos a realizar cambios.
      propuesta_cambios <- as.vector(as.matrix(input_base_niveles[1,]))
      cantidad_cambios <- sum(as.vector(propuesta_cambios == "SI"))
      
      # Los cambios podran o no realizarse
      # Por defecto, tendra un FALSE. 
      # Si puede realizarse el cambio, cambia a TRUE
      # Luego de todos los cambios, la base de datos modificada
      # saldra de esta funcion solo si "cantidad_cambios" es igual a la suma de "cambios_realizados".
      
      cambios_realizados <- rep(FALSE, length(propuesta_cambios))
      
      # Realizamos el control sobre las columnas que presentan varias categorias, comparando
      # cada columna con una pretabulacion.
      # Pueden ocurrir 3 cosas:
      # 1) Todas las categorias que presenta la columna ya se
      # encuentren tabuladas en la base de niveles en la columna homologa.
      # 2) Alguna categoria pretabulada no esta en la base, no es un error, ya que
      # lo que se tiene son las categorías pretabuladas, pero no necesariamente un paciente
      # cayo en esa categoría.
      # 3) La columna elegida presenta una categoría que no está pretabulada. 
      # Esto es un error ya que no puede caer un paciente en una categoria
      # que no esta preestablecida. No es que este mal el paciente, sino que
      # hay que agregar la nueva categoria al listado.
      
      # Si estamos en 1) o en 2), esta todo OK.        
      # Entonces lo que hacemos es cambiar el orden de los niveles
      # del factor, segun lo indicado en el orden de pretabulados.
      
      # Ahora, el caso 3), debe dar aviso ya que la nueva categoría debe ser ingresada a 
      # archivo de pretabulados.
      
      # Para cada una de las columnas de la base de datos...
      for (n in 1:length(propuesta_cambios)) {
        
        # Si tiene un "SI"...
        if (propuesta_cambios[n] == "SI") {
          
          # Tomamos los niveles pretabulados para la columna de la base
          # y guardamos los niveles
          estas_filas <- c(3:nrow(input_base_niveles))
          niveles_pretabulados <- na.omit(input_base_niveles[estas_filas, n])
          #        niveles_tabulados <- sort(niveles_tabulados)
          
          # Tomamos la columna de la base de datos...
          # y la usamos como factor... y guardamos los niveles.
          mi_factor <- as.factor(as.character(input_base[,n]))
          niveles_base <- levels(mi_factor) 
          #        niveles_base <- sort(niveles_base)
          
          cantidad_pretabulados <- length(niveles_pretabulados)
          cantidad_niveles_base <- length(niveles_base)
          
          
          # Si la base de datos no presenta niveles (ejemplo toda la columna vacia)
          if(cantidad_niveles_base == 0){
            
            decision2 <- TRUE 
            
            cat("Columna ", n, " - Sin niveles en la columna...\n")
          }  
          
          # Vamos a verificar que todos los niveles de la base
          # esten dentro de los niveles tabulados
          
          # Si la base de datos efectivamente presenta al menos 1 nivel
          if (cantidad_niveles_base > 0) {
            
            
            dt_niveles_base <- rep(FALSE, length(niveles_base))  
            for (k in 1:length(niveles_base)) {
              
              if (sum(niveles_base[k] == niveles_pretabulados) == 1) dt_niveles_base[k] <- TRUE
              
            } # Fin for k
            
            
            # La decision2
            # Esta todo OK si los niveles de la BASE de datos
            # estan todos dentro de los niveles pretabulados
            decision2 <- sum(dt_niveles_base) == length(dt_niveles_base)
            
            dt_niveles_nuevos <- !dt_niveles_base
            estos_niveles_nuevos <- niveles_base[dt_niveles_nuevos]
            
            
            
          }
          
          
          # Si esta todo OK para esta columna...
          if (decision2) {
            
            cat("Columna ", n, " - Todos los niveles ya estan pretabulados...\n")
            # si estamso aca... Es que no hay que agregar niveles nuevos.
          }
          
          
          
          # Si hay algun nivel nuevo en la columna...
          if (!decision2) {
            
            # Detallamos que este cambio se puede hacer...
            cambios_realizados[n] <- TRUE
            
            # Agregamos los niveles nuevos luego del listado pretablado
            nuevo_detalle <- c(niveles_pretabulados, estos_niveles_nuevos)
            
            
            # Modificamos los niveles de la columna con los niveles pretabulados
            # agregandolos al final de niveles que ya estan detallados.
            
            torpedo <- c(base_mod[c(1,2),n], nuevo_detalle)
            
            base_mod[,n] <- torpedo
            
            
            cat("Columna ", n, " - Se agregaron ", length(nuevo_detalle), " niveles.\n")
          } 
          
          
          
          
          
          
          
        } # Fin if
        
        
      } # Fin for n
      
      
      decision_salida <- sum(cambios_realizados) > 0
      
      # Return
      if(decision_salida) return(decision_salida) else return(list(decision_salida, base_mod)) 
      
    }
    
    
    
    cambio_niveles <- function(input_base = NULL, input_base_niveles = NULL){
      
      
      
      # Damos inicio
      cat("Inicio: cambio_niveles() ----------------------------\n")
      ########################################################
      
      
      
      
      
      # 1) Control y cambios sobre los niveles de las variables categoricas
      {
        ###  
        
        
        frase3 <- "OKKKK  - Control y Cambio Niveles 2) - Niveles OK! \n"
        frase4 <- "DANGER!!! - Control y Cambio Niveles 2) -  Niveles Extra en 'input_base' \n"
        
        # Creamos una nueva base, donde realizaremos los cambios
        base_mod <- input_base
        
        # Tenemos ya detectadas cuales son las variables a las que vamos a realizar cambios.
        propuesta_cambios <- as.vector(as.matrix(input_base_niveles[1,]))
        cantidad_cambios <- sum(as.vector(propuesta_cambios == "SI"))
        
        # Los cambios podran o no realizarse
        # Por defecto, tendra un FALSE. 
        # Si puede realizarse el cambio, cambia a TRUE
        # Luego de todos los cambios, la base de datos modificada
        # saldra de esta funcion solo si "cantidad_cambios" es igual a la suma de "cambios_realizados".
        
        cambios_realizados <- rep(FALSE, length(propuesta_cambios))
        
        # Realizamos el control sobre las columnas que presentan varias categorias, comparando
        # cada columna con una pretabulacion.
        # Pueden ocurrir 3 cosas:
        # 1) Todas las categorias que presenta la columna ya se
        # encuentren tabuladas en la base de niveles en la columna homologa.
        # 2) Alguna categoria pretabulada no esta en la base, no es un error, ya que
        # lo que se tiene son las categorías pretabuladas, pero no necesariamente un paciente
        # cayo en esa categoría.
        # 3) La columna elegida presenta una categoría que no está pretabulada. 
        # Esto es un error ya que no puede caer un paciente en una categoria
        # que no esta preestablecida. No es que este mal el paciente, sino que
        # hay que agregar la nueva categoria al listado.
        
        # Si estamos en 1) o en 2), esta todo OK.        
        # Entonces lo que hacemos es cambiar el orden de los niveles
        # del factor, segun lo indicado en el orden de pretabulados.
        
        # Ahora, el caso 3), debe dar aviso ya que la nueva categoría debe ser ingresada a 
        # archivo de pretabulados.
        
        # Para cada una de las columnas que haga falta...
        for (n in 1:length(propuesta_cambios)) {
          
          # Si tiene un "SI"...
          if (propuesta_cambios[n] == "SI") {
            
            # Tomamos los niveles pretabulados para la columna de la base
            # y guardamos los niveles
            estas_filas <- c(3:nrow(input_base_niveles))
            niveles_pretabulados <- na.omit(input_base_niveles[estas_filas, n])
            #        niveles_tabulados <- sort(niveles_tabulados)
            
            # Tomamos la columna de la base de datos...
            # y la usamos como factor... y guardamos los niveles.
            mi_factor <- as.factor(as.character(base_mod[,n]))
            niveles_base <- levels(mi_factor) 
            #        niveles_base <- sort(niveles_base)
            
            cantidad_pretabulados <- length(niveles_pretabulados)
            cantidad_niveles_base <- length(niveles_base)
            
            
            # Vamos a verificar que todos los niveles de la base
            # esten dentro de los niveles tabulados
            
            # Si la base de datos efectivamente presenta al menos 1 nivel
            if (cantidad_niveles_base > 0) {
              
              
              dt_niveles_base <- rep(FALSE, length(niveles_base))  
              for (k in 1:length(niveles_base)) {
                
                if (sum(niveles_base[k] == niveles_pretabulados) == 1) dt_niveles_base[k] <- TRUE
                
              } # Fin for k
              
              
              # La decision2
              # Esta todo OK si los niveles de la BASE de datos
              # estan todos dentro de los niveles pretabulados
              decision2 <- sum(dt_niveles_base) == length(dt_niveles_base)
              
            }
            
            # Si la base de datos no presenta niveles (ejemplo toda la columna vacia)
            if (!decision2) if(cantidad_niveles_base == 0) decision2 <- TRUE else decision2 <- FALSE
            
            # Si esta todo OK para esta columna...
            if (decision2) {
              
              # Detallamos que este cambio se puede hacer...
              cambios_realizados[n] <- TRUE
              
              # Modificamos los niveles de la columna con los niveles pretabulados
              # exactamente en el orden que estan pretabulados
              # Pero solo si hay niveles pretabulados
              
              # Si hay al menis 1 niveles pretabulado
              if (cantidad_pretabulados > 0) {
                
                mi_factor_mod <- factor( mi_factor, levels = niveles_pretabulados )
              } else mi_factor_mod <- factor(mi_factor)
              
              base_mod[,n] <- mi_factor_mod
              
              
            } else {
              
              cat("**** DANGER!!!! - Niveles Diferentes!!!", "(", num2let(n), ") - ", colnames(base_mod)[n], " - Columna ", n, "\n\n")
              cat("La columna presenta niveles en La Base de Datos que no están pretabulados.", "\n\n")
              
              mensaje <- paste0("Los siguientes niveles deben ser ingresados a la pretabulacion: ", paste0(niveles_base[!dt_niveles_base], sep=" - ", collapse=""), collapse="")
              cat(mensaje, "\n\n")
            }
            
            
            
            
            
            
          } # Fin if
        } # Fin for n
        
        
        
        decision2 <- cantidad_cambios == sum(cambios_realizados)
        
        if (decision2)  cat(frase3) else cat(frase4)
        
        
      } # Fin if decision1
      
      
      # 2) Salidas
      {
        ###
        
        
        
        frase5 <- "OKKKK  - Cambio Niveles 3) - Variables Categoricas con NIVELES reordenados \n"
        
        frase_cierre <- "Fin:    cambio_niveles() ----------------------------\n\n"
        
        if (decision2) {
          cat(frase5)
          cat("OKKKK  - BASE_MOD_*****  creada\n")
          cat(frase_cierre)
          return(base_mod)
        } else cat(frase_cierre)
        ###
      } # Fin 2) 
      ##################################################################################
      
      
    }
    
    
    
    
    
    
    
    
    
    
    
    
    control_unidades <- function(input_base = NULL, input_ref = NULL){
      
      # Damos inicio
      cat("Inicio: control_unidades() ----------------------------\n")
      ########################################################
      
      
      # columna de hospitales en la base de datos
      pos_col_hospitales <- let2num("FI")
      pos_col_paises <- let2num("FJ")
      
      # Aislamos la columna de hospitales de la base de datos
      columna_hospitales_en_base <- as.character(input_base[,pos_col_hospitales])
      columna_paises_en_base <- as.character(input_base[,pos_col_paises])
      
      # Detallamos los hospitales que estan presentes en la base de datos
      nombres_hospitales_base <- names(table(columna_hospitales_en_base))
      
      # Detallamos los hospitales presentes en la base de referencia
      nombres_hospitales_tabulados <- input_ref[,2]
      codigos_hospitales_tabulados <- input_ref[,3]
      
      
      
      # Paso 1)
      {
        ###
        
        # Vamos a ver que la tabla de referencia este correcta.
        # Esto es... 
        #             A) que no haya un hospital dos veces
        #             B) que ningun numero este dos veces
        #             C) que los numeros esten de corridos desde el 1
        #             D) que tanto los numeros como los nombres tengan la misma cantidad de elementos
        
        
        # A) que no haya un hospital dos veces
        {
          ###
          
          
          frase1 <- "OKKKK - Paso 1 - A) Nombres de Hospitales - OK\n"
          frase2 <- "DANGER!!!! - Paso 1 - A) Hay nombres de hospitales duplicados en la tabla de referencia\n"
          
          
          tabla1 <- table(nombres_hospitales_tabulados)
          
          
          # Detectamos los duplicados
          dt_duplicados1 <- tabla1 != 1
          
          # Nombre de hospitales nuevos
          hospitales_duplicados1 <- names(tabla1)[dt_duplicados1]
          
          accionA <- length(hospitales_duplicados1) == 0
          
          if (accionA) cat(frase1) else {
            
            cat(frase2)
            cat("   ---Inicio listado de hospitales duplicados que deben ser borrados de la tabla de referencia \n")
            cat(paste0(as.vector(as.matrix(hospitales_duplicados1)), "\n"), sep="")
            cat("\n")
            cat("   ---Fin listado de hospitales duplicados que deben ser borrados de la tabla de referencia \n")
          }
          
          ###
        } # Fin A) que no haya un hospital dos veces
        ##################################################################################################################
        
        
        # B) que ningun numero este dos veces
        {
          ###
          
          
          frase3 <- "OKKKK - Paso 1 - B) Codigos de Hospitales - OK\n"
          frase4 <- "DANGER!!!! - Paso 1 - B) Hay codigos de hospitales duplicados en la tabla de referencia\n"
          
          
          tabla2 <- table(codigos_hospitales_tabulados)
          
          
          # Detectamos los duplicados
          dt_duplicados2 <- tabla2 != 1
          
          # Nombre de hospitales nuevos
          hospitales_duplicados2 <- names(tabla1)[dt_duplicados2]
          
          accionB <- length(hospitales_duplicados2) == 0
          
          if (accionB) cat(frase3) else {
            
            cat(frase4)
            cat("   ---Inicio listado de codigos de hospitales duplicados que deben ser borrados de la tabla de referencia\n")
            as.matrix(hospitales_duplicados2)
            cat("\n")
            cat("   ---Fin  listado de codigos de hospitales duplicados que deben ser borrados de la tabla de referencia\n")
          }
          
          ###
        } # Fin B) que ningun numero este dos veces
        ##################################################################################################################
        
        
        # C) que los numeros esten de corridos desde el 1
        {
          ###
          
          
          frase5 <- "OKKKK - Paso 1 - C) Codigos de Hospitales Consecutivos - OK\n"
          frase6 <- "DANGER!!!! - Paso 1 - C) Hay codigos de hospitales mal ordenados o salteados en la tabla de referencia\n"
          
          
          orden_ref <- c(1:length(codigos_hospitales_tabulados))
          
          accionC <- identical(as.character(orden_ref), as.character(as.vector(codigos_hospitales_tabulados)))
          
          
          if (accionC) cat(frase5) else {
            
            cat(frase6)
          }
          
          ###
        } # Fin C) que los numeros esten de corridos desde el 1
        ##################################################################################################################
        
        
        # D) que tanto los numeros como los nombres tengan la misma cantidad de elementos
        {
          ###
          
          
          frase7 <- "OKKKK - Paso 1 - D) Misma cantidad de Nombres y Codigos de Hospitales - OK\n"
          frase8 <- "DANGER!!!! - Paso 1 - D) Algun hospital sin codigo o un codigo sin hospital en la base referencia\n"
          
          accionD <- length(nombres_hospitales_tabulados) == length(codigos_hospitales_tabulados)
          
          
          if (accionD) cat(frase7) else {
            
            cat(frase8)
          }
          
          ###
        } # Fin D) que tanto los numeros como los nombres tengan la misma cantidad de elementos
        ##################################################################################################################
        
        
        ###
      } # Fin Paso 1)
      ##################################################################################################################
      
      
      # Paso 2)
      {
        ###
        
        
        # Juntamos todo
        # Los hospitales que estan en la base de datos y en la base de referencia,
        # en una tabla de frecuencia tendran un dos.
        # Los que no tienen un dos, es que estan en la base y no en la referencia, 
        # o estan en la referencia y no en la base.
        
        rejunte <- c(nombres_hospitales_base, nombres_hospitales_tabulados)
        tabla_rejunte <- table(rejunte)
        
        # Detectamos los nuevos
        dt_solitarios <- tabla_rejunte <= 1
        estos_solitarios <- names(tabla_rejunte)[dt_solitarios]
        
        rejunte2 <- c(nombres_hospitales_tabulados, estos_solitarios)
        tabla_rejunte2 <- table(rejunte2)
        
        dt_nuevos <- rep(FALSE, length(estos_solitarios))
        
        if (length(estos_solitarios) > 0) {
          for (h in 1:length(dt_nuevos)) {
            
            if(sum(nombres_hospitales_tabulados == estos_solitarios[h]) == 0) dt_nuevos[h] <- TRUE
            
          }
        }
        
        # Los hospitales nuevos
        hospitales_nuevos <- estos_solitarios[dt_nuevos]
        
        # El pais de cada hospital nuevo
        pais_nuevo <- rep(NA, length(hospitales_nuevos))
        
        for (interno in 1:length(hospitales_nuevos)) {
          
          dt_hospital <-  columna_hospitales_en_base == hospitales_nuevos[interno]
          pais_nuevo[interno] <- columna_paises_en_base[dt_hospital][1]
          remove(dt_hospital)
        }
        
        # Nombre de hospitales nuevos
        
        
        
        accion <- length(hospitales_nuevos) == 0
        
        frase9 <- "OKKKK - Paso 2) Unidades Hospitalarias OKKKK\n"
        frase10 <- "DANGER!!!! - Paso 2) Unidades Nuevas deben ser agregadas\n"
        if (accion) cat(frase9) else {
          
          
          cat(frase10)
          cat("   ---Inicio listado para ser agregado", "\n")
          for (h in 1:length(dt_nuevos))  cat("   ", hospitales_nuevos[h], " --- ", pais_nuevo[h], "\n") 
          cat("   ---Fin listado para ser agregado", "\n")
        }
        
        ###
      } # Fin Paso 2)
      ############################################################################################
      
      
      # Damos Fin
      cat("Fin:    control_unidades() ----------------------------\n")
      ########################################################
      
    }
    
    ###    
  }
  ################################################################################################
  
  
  
  
  
  cambio_niveles <- function(input_base = NULL, input_base_niveles = NULL){
    
    
    
    # Damos inicio
    cat("Inicio: cambio_niveles() ----------------------------\n")
    ########################################################
    
    
    
    
    
    # 1) Control y cambios sobre los niveles de las variables categoricas
    {
      ###  
      
      
      frase3 <- "OKKKK  - Control y Cambio Niveles 2) - Niveles OK! \n"
      frase4 <- "DANGER!!! - Control y Cambio Niveles 2) -  Niveles Extra en 'input_base' \n"
      
      # Creamos una nueva base, donde realizaremos los cambios
      base_mod <- input_base
      
      # Tenemos ya detectadas cuales son las variables a las que vamos a realizar cambios.
      propuesta_cambios <- as.vector(as.matrix(input_base_niveles[1,]))
      cantidad_cambios <- sum(as.vector(propuesta_cambios == "SI"))
      
      # Los cambios podran o no realizarse
      # Por defecto, tendra un FALSE. 
      # Si puede realizarse el cambio, cambia a TRUE
      # Luego de todos los cambios, la base de datos modificada
      # saldra de esta funcion solo si "cantidad_cambios" es igual a la suma de "cambios_realizados".
      
      cambios_realizados <- rep(FALSE, length(propuesta_cambios))
      
      # Realizamos el control sobre las columnas que presentan varias categorias, comparando
      # cada columna con una pretabulacion.
      # Pueden ocurrir 3 cosas:
      # 1) Todas las categorias que presenta la columna ya se
      # encuentren tabuladas en la base de niveles en la columna homologa.
      # 2) Alguna categoria pretabulada no esta en la base, no es un error, ya que
      # lo que se tiene son las categorías pretabuladas, pero no necesariamente un paciente
      # cayo en esa categoría.
      # 3) La columna elegida presenta una categoría que no está pretabulada. 
      # Esto es un error ya que no puede caer un paciente en una categoria
      # que no esta preestablecida. No es que este mal el paciente, sino que
      # hay que agregar la nueva categoria al listado.
      
      # Si estamos en 1) o en 2), esta todo OK.        
      # Entonces lo que hacemos es cambiar el orden de los niveles
      # del factor, segun lo indicado en el orden de pretabulados.
      
      # Ahora, el caso 3), debe dar aviso ya que la nueva categoría debe ser ingresada a 
      # archivo de pretabulados.
      
      # Para cada una de las columnas que haga falta...
      for (n in 1:length(propuesta_cambios)) {
        
        # Si tiene un "SI"...
        if (propuesta_cambios[n] == "SI") {
          
          # Tomamos los niveles pretabulados para la columna de la base
          # y guardamos los niveles
          estas_filas <- c(3:nrow(input_base_niveles))
          niveles_pretabulados <- na.omit(input_base_niveles[estas_filas, n])
          #        niveles_tabulados <- sort(niveles_tabulados)
          
          # Tomamos la columna de la base de datos...
          # y la usamos como factor... y guardamos los niveles.
          mi_factor <- as.factor(as.character(base_mod[,n]))
          niveles_base <- levels(mi_factor) 
          #        niveles_base <- sort(niveles_base)
          
          cantidad_pretabulados <- length(niveles_pretabulados)
          cantidad_niveles_base <- length(niveles_base)
          
          
          # Vamos a verificar que todos los niveles de la base
          # esten dentro de los niveles tabulados
          
          # Si la base de datos efectivamente presenta al menos 1 nivel
          if (cantidad_niveles_base > 0) {
            
            
            dt_niveles_base <- rep(FALSE, length(niveles_base))  
            for (k in 1:length(niveles_base)) {
              
              if (sum(niveles_base[k] == niveles_pretabulados) == 1) dt_niveles_base[k] <- TRUE
              
            } # Fin for k
            
            
            # La decision2
            # Esta todo OK si los niveles de la BASE de datos
            # estan todos dentro de los niveles pretabulados
            decision2 <- sum(dt_niveles_base) == length(dt_niveles_base)
            
          }
          
          # Si la base de datos no presenta niveles (ejemplo toda la columna vacia)
          if (!decision2) if(cantidad_niveles_base == 0) decision2 <- TRUE else decision2 <- FALSE
          
          # Si esta todo OK para esta columna...
          if (decision2) {
            
            # Detallamos que este cambio se puede hacer...
            cambios_realizados[n] <- TRUE
            
            # Modificamos los niveles de la columna con los niveles pretabulados
            # exactamente en el orden que estan pretabulados
            # Pero solo si hay niveles pretabulados
            
            # Si hay al menis 1 niveles pretabulado
            if (cantidad_pretabulados > 0) {
              
              mi_factor_mod <- factor( mi_factor, levels = niveles_pretabulados )
            } else mi_factor_mod <- factor(mi_factor)
            
            base_mod[,n] <- mi_factor_mod
            
            
          } else {
            
            cat("**** DANGER!!!! - Niveles Diferentes!!!", "(", num2let(n), ") - ", colnames(base_mod)[n], " - Columna ", n, "\n\n")
            cat("La columna presenta niveles en La Base de Datos que no están pretabulados.", "\n\n")
            
            mensaje <- paste0("Los siguientes niveles deben ser ingresados a la pretabulacion: ", paste0(niveles_base[!dt_niveles_base], sep=" - ", collapse=""), collapse="")
            cat(mensaje, "\n\n")
          }
          
          
          
          
          
          
        } # Fin if
      } # Fin for n
      
      
      
      decision2 <- cantidad_cambios == sum(cambios_realizados)
      
      if (decision2)  cat(frase3) else cat(frase4)
      
      
    } # Fin if decision1
    
    
    # 2) Salidas
    {
      ###
      
      
      
      frase5 <- "OKKKK  - Cambio Niveles 3) - Variables Categoricas con NIVELES reordenados \n"
      
      frase_cierre <- "Fin:    cambio_niveles() ----------------------------\n\n"
      
      if (decision2) {
        cat(frase5)
        cat("OKKKK  - BASE_MOD_*****  creada\n")
        cat(frase_cierre)
        return(base_mod)
      } else cat(frase_cierre)
      ###
    } # Fin 2) 
    ##################################################################################
    
    
  }
  
  
  
  
  
  
  
  
  
  
  
  
  control_unidades <- function(input_base = NULL, input_ref = NULL){
    
    # Damos inicio
    cat("Inicio: control_unidades() ----------------------------\n")
    ########################################################
    
    
    # columna de hospitales en la base de datos
    pos_col_hospitales <- let2num("FI")
    pos_col_paises <- let2num("FJ")
    
    # Aislamos la columna de hospitales de la base de datos
    columna_hospitales_en_base <- as.character(input_base[,pos_col_hospitales])
    columna_paises_en_base <- as.character(input_base[,pos_col_paises])
    
    # Detallamos los hospitales que estan presentes en la base de datos
    nombres_hospitales_base <- names(table(columna_hospitales_en_base))
    
    # Detallamos los hospitales presentes en la base de referencia
    nombres_hospitales_tabulados <- input_ref[,2]
    codigos_hospitales_tabulados <- input_ref[,3]
    
    
    
    # Paso 1)
    {
      ###
      
      # Vamos a ver que la tabla de referencia este correcta.
      # Esto es... 
      #             A) que no haya un hospital dos veces
      #             B) que ningun numero este dos veces
      #             C) que los numeros esten de corridos desde el 1
      #             D) que tanto los numeros como los nombres tengan la misma cantidad de elementos
      
      
      # A) que no haya un hospital dos veces
      {
        ###
        
        
        frase1 <- "OKKKK - Paso 1 - A) Nombres de Hospitales - OK\n"
        frase2 <- "DANGER!!!! - Paso 1 - A) Hay nombres de hospitales duplicados en la tabla de referencia\n"
        
        
        tabla1 <- table(nombres_hospitales_tabulados)
        
        
        # Detectamos los duplicados
        dt_duplicados1 <- tabla1 != 1
        
        # Nombre de hospitales nuevos
        hospitales_duplicados1 <- names(tabla1)[dt_duplicados1]
        
        accionA <- length(hospitales_duplicados1) == 0
        
        if (accionA) cat(frase1) else {
          
          cat(frase2)
          cat("   ---Inicio listado de hospitales duplicados que deben ser borrados de la tabla de referencia \n")
          cat(paste0(as.vector(as.matrix(hospitales_duplicados1)), "\n"), sep="")
          cat("\n")
          cat("   ---Fin listado de hospitales duplicados que deben ser borrados de la tabla de referencia \n")
        }
        
        ###
      } # Fin A) que no haya un hospital dos veces
      ##################################################################################################################
      
      
      # B) que ningun numero este dos veces
      {
        ###
        
        
        frase3 <- "OKKKK - Paso 1 - B) Codigos de Hospitales - OK\n"
        frase4 <- "DANGER!!!! - Paso 1 - B) Hay codigos de hospitales duplicados en la tabla de referencia\n"
        
        
        tabla2 <- table(codigos_hospitales_tabulados)
        
        
        # Detectamos los duplicados
        dt_duplicados2 <- tabla2 != 1
        
        # Nombre de hospitales nuevos
        hospitales_duplicados2 <- names(tabla1)[dt_duplicados2]
        
        accionB <- length(hospitales_duplicados2) == 0
        
        if (accionB) cat(frase3) else {
          
          cat(frase4)
          cat("   ---Inicio listado de codigos de hospitales duplicados que deben ser borrados de la tabla de referencia\n")
          as.matrix(hospitales_duplicados2)
          cat("\n")
          cat("   ---Fin  listado de codigos de hospitales duplicados que deben ser borrados de la tabla de referencia\n")
        }
        
        ###
      } # Fin B) que ningun numero este dos veces
      ##################################################################################################################
      
      
      # C) que los numeros esten de corridos desde el 1
      {
        ###
        
        
        frase5 <- "OKKKK - Paso 1 - C) Codigos de Hospitales Consecutivos - OK\n"
        frase6 <- "DANGER!!!! - Paso 1 - C) Hay codigos de hospitales mal ordenados o salteados en la tabla de referencia\n"
        
        
        orden_ref <- c(1:length(codigos_hospitales_tabulados))
        
        accionC <- identical(as.character(orden_ref), as.character(as.vector(codigos_hospitales_tabulados)))
        
        
        if (accionC) cat(frase5) else {
          
          cat(frase6)
        }
        
        ###
      } # Fin C) que los numeros esten de corridos desde el 1
      ##################################################################################################################
      
      
      # D) que tanto los numeros como los nombres tengan la misma cantidad de elementos
      {
        ###
        
        
        frase7 <- "OKKKK - Paso 1 - D) Misma cantidad de Nombres y Codigos de Hospitales - OK\n"
        frase8 <- "DANGER!!!! - Paso 1 - D) Algun hospital sin codigo o un codigo sin hospital en la base referencia\n"
        
        accionD <- length(nombres_hospitales_tabulados) == length(codigos_hospitales_tabulados)
        
        
        if (accionD) cat(frase7) else {
          
          cat(frase8)
        }
        
        ###
      } # Fin D) que tanto los numeros como los nombres tengan la misma cantidad de elementos
      ##################################################################################################################
      
      
      ###
    } # Fin Paso 1)
    ##################################################################################################################
    
    
    # Paso 2)
    {
      ###
      
      
      # Juntamos todo
      # Los hospitales que estan en la base de datos y en la base de referencia,
      # en una tabla de frecuencia tendran un dos.
      # Los que no tienen un dos, es que estan en la base y no en la referencia, 
      # o estan en la referencia y no en la base.
      
      rejunte <- c(nombres_hospitales_base, nombres_hospitales_tabulados)
      tabla_rejunte <- table(rejunte)
      
      # Detectamos los nuevos
      dt_solitarios <- tabla_rejunte <= 1
      estos_solitarios <- names(tabla_rejunte)[dt_solitarios]
      
      rejunte2 <- c(nombres_hospitales_tabulados, estos_solitarios)
      tabla_rejunte2 <- table(rejunte2)
      
      dt_nuevos <- rep(FALSE, length(estos_solitarios))
      
      if (length(estos_solitarios) > 0) {
        for (h in 1:length(dt_nuevos)) {
          
          if(sum(nombres_hospitales_tabulados == estos_solitarios[h]) == 0) dt_nuevos[h] <- TRUE
          
        }
      }
      
      # Los hospitales nuevos
      hospitales_nuevos <- estos_solitarios[dt_nuevos]
      
      # El pais de cada hospital nuevo
      pais_nuevo <- rep(NA, length(hospitales_nuevos))
      
      for (interno in 1:length(hospitales_nuevos)) {
        
        dt_hospital <-  columna_hospitales_en_base == hospitales_nuevos[interno]
        pais_nuevo[interno] <- columna_paises_en_base[dt_hospital][1]
        remove(dt_hospital)
      }
      
      # Nombre de hospitales nuevos
      
      
      
      accion <- length(hospitales_nuevos) == 0
      
      frase9 <- "OKKKK - Paso 2) Unidades Hospitalarias OKKKK\n"
      frase10 <- "DANGER!!!! - Paso 2) Unidades Nuevas deben ser agregadas\n"
      if (accion) cat(frase9) else {
        
        
        cat(frase10)
        cat("   ---Inicio listado para ser agregado", "\n")
        for (h in 1:length(dt_nuevos))  cat("   ", hospitales_nuevos[h], " --- ", pais_nuevo[h], "\n") 
        cat("   ---Fin listado para ser agregado", "\n")
      }
      
      ###
    } # Fin Paso 2)
    ############################################################################################
    
    
    # Damos Fin
    cat("Fin:    control_unidades() ----------------------------\n")
    ########################################################
    
  }
}