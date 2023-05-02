
num2let <- function(input_numeros=NULL)
{  
  ###
  
  library(openxlsx)
  
   cambio <- openxlsx::int2col(input_numeros)
  
   return(cambio)
   
   

###
} # Fin funcion num2let
#################################################################



if (1 == 2) {
# # # MUESTRA

 AVER <-  num2let(c(1024))
 AVER
 
 num2let(133479)
 
 
 num2let(0)
# 
# # codigo2 <- c(2, 4, 16, 12, 44, 76, 77)
# # AVER <- num2let(codigo2)
# 
# 
# # codigo2 <- c(2, 4, 16, 12, 44, 76, 77)
# # num2let(codigo2)
  
}