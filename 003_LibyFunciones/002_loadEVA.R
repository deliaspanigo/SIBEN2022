
#helper function (convert vector to named list)
namel<-function (vec){
  tmp<-as.list(vec)
  names(tmp)<-as.character(unlist(vec))
  tmp
}


#
# Buscador de carpetas hacia arriba...
GoUp <- function (up=NULL){
  
  # up <- "data"
  step <- "../"
  
  candado <- FALSE
  contador_candado <- 0
  
  while(candado == FALSE) {
    
    
    contador_candado <- contador_candado + 1
    
    ja <- rep(step, contador_candado)
    
    for (p in 1:length(ja)) {
      
      if (p == 1) look <- ja[1]
      if (p > 1) look <- paste0(look, ja[p])
    }
    
    
    my_files <- list.files(look)
    
    dt <- my_files == up
    
    if (sum(dt) == 1 | contador_candado == 15) candado <- TRUE
    
  }
  
  my_way <- paste0(look, up)
  return(my_way)
}




# EVA01 (Funcion que carga funciones)
library('stringr')

EVA01 <- function(root){
    stopifnot(root != NULL)
    root_content <- list.files(root)
    
    for (n in 1:length(root_content)) {
        fst_level <- paste(root, "/", root_content[n], sep="")
        fst_level_content <- list.files(fst_level)
        
        for (i in 1:length(fst_level_content)){
            snd_level <- paste(fst_level, "/", fst_level_content[i], sep="")
            snd_level_content <- list.files(snd_level)
            
            for (j in 1:length(snd_level_content)) {
                if ( any(grepl('.*\\.R$', snd_level_content[j]))) {
                    final_path <- paste(snd_level, "/", snd_level_content[j], sep="")
                    source(final_path)
                }
            }
        }
        
    }
}



