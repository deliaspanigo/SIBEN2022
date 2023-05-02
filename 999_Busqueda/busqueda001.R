# https://blog.revolutionanalytics.com/2017/10/office-charts.html

 

library(rvg)
library(ggplot2)
library(officer)


codigo_graf <- 
'
sorteo <- sample(1:20,10)
Da.... carry o supp Lion?
maximo <- max(tabla)*1.1

xx <- barplot(sorteo,xlab="Day",ylab="Widgets", ylim=c(0, maximo))
text(xx, sorteo+0.05*maximo, "A")
'

eval(parse(text=codigo_graf))

doc <- read_pptx()
doc <- add_slide(doc, layout = "Title and Content", master = "Office Theme")
doc <- ph_with_vg(doc, code = eval(parse(text=codigo_graf)),
                  type = "body")
print(doc, target = "my_plot.pptx")