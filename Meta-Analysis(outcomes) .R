library(metafor)

options(digits = 2)
extract <- read_excel("extract.xlsx", sheet = "Outcomes")
View(extract)
#Outcomes:


pssL8 <- extract[complete.cases(extract[, c("pm.L8.1", "pm.L8.2", "pv.L8.1", "pv.L8.2")]), ]

pssL8 <- escalc(measure ="MD", m1i=`pm.L8.1`, m2i=`pm.L8.2`
, sd1i=`pv.L8.1`, sd2i=`pv.L8.2`, n1i=n1, n2i=n2, slab = paste(study), data =pssL8)

respssL8 <- rma(yi, vi , data = pssL8)
respssL8


forest(respssL8, addpred = TRUE, showweights = TRUE,shade = "zebra",xlim = c(-18, 7),
       ilab = cbind(pssL8$`pm.L8.1`, pssL8$`pv.L8.1`,pssL8$n1,
                    pssL8$`pm.L8.2`, pssL8$`pv.L8.2`, pssL8$n2),
       ilab.xpos = c(-15, -14, -13, -11.5, -10.5, -9.5), 
       cex = 0.8, header = "Author and Year")

text(c(-15, -14, -13, -11.5, -10.5, -9.5), respssL8$k+2,
     c("Mean", "SD", "Total", "Mean", "SD", "Total"), cex = 0.8)
text(c(-14, -10.5), respssL8$k+3, c("Intervention", "control"), cex = 0.8)

reporter(respssL8, format = "word")


pss8 <- extract[complete.cases(extract[, c("pm.8.1", "pm.8.2", "pv.8.1", "pv.8.2")]), ]

pss8 <- escalc(measure ="MD", m1i=`pm.8.1`, m2i=`pm.8.2`
               , sd1i=`pv.8.1`, sd2i=`pv.8.2`, n1i=n1, n2i=n2, slab = paste(study), data =pss8)

respss8 <- rma(yi, vi , data = pss8)
respss8


forest(respss8, addpred = TRUE, showweights = TRUE,shade = "zebra",xlim = c(-30, 10), at = c(-16, -12, -8, -4, 0, 2, 5), 
       ilab = cbind(pss8$`pm.8.1`, pss8$`pv.8.1`,pss8$n1,
                    pss8$`pm.8.2`, pss8$`pv.8.2`, pss8$n2),
       ilab.xpos = c(-25, -23.5, -22, -20.5, -19, -17.5), 
       cex = 0.8, header = "Author and Year")

text(c(-25, -23.5, -22, -20.5, -19, -17.5), respss8$k+2,
     c("Mean", "SD", "Total", "Mean", "SD", "Total"), cex = 0.8)
text(c(-23.5, -19), respss8$k+3, c("Intervention", "control"), cex = 0.8)

reporter(respss8, format = "word")

##########################################################################



haml8 <- extract[complete.cases(extract[, c("hm.L8.1", "hm.L8.2", "hv.L8.1", "hv.L8.2")]), ]

haml8 <- escalc(measure ="MD", m1i=`hm.L8.1`, m2i=`hm.L8.2`
                , sd1i=`hv.L8.1`, sd2i=`hv.L8.2`, n1i=n1, n2i=n2, slab = paste(study), data =haml8)

reshaml8 <- rma(yi, vi , data = haml8)
reshaml8


forest(reshaml8, addpred = TRUE, showweights = TRUE,shade = "zebra",xlim = c(-30, 10), at = c(-16, -12, -8, -4, 0, 2, 5), 
       ilab = cbind(haml8$`hm.L8.1`, haml8$`hv.L8.1`,haml8$n1,
                    haml8$`hm.L8.2`, haml8$`hv.L8.2`, haml8$n2),
       ilab.xpos = c(-25, -23.5, -22, -20.5, -19, -17.5), 
       cex = 0.8, header = "Author and Year")

text(c(-25, -23.5, -22, -20.5, -19, -17.5), reshaml8$k+2,
     c("Mean", "SD", "Total", "Mean", "SD", "Total"), cex = 0.8)
text(c(-23.5, -19), reshaml8$k+3, c("Intervention", "control"), cex = 0.8)

reporter(reshaml8, format = "word")



ham8 <- extract[complete.cases(extract[, c("hm.8.1", "hm.8.2", "hv.8.1", "hv.8.2")]), ]

ham8 <- escalc(measure ="MD", m1i=`hm.8.1`, m2i=`hm.8.2`
               , sd1i=`hv.8.1`, sd2i=`hv.8.2`, n1i=n1, n2i=n2, slab = paste(study), data =ham8)

resham8 <- rma(yi, vi , data = ham8)
resham8


forest(resham8, addpred = TRUE, showweights = TRUE,shade = "zebra",xlim = c(-18, 7), 
       ilab = cbind(ham8$`hm.8.1`, ham8$`hv.8.1`,ham8$n1,
                    ham8$`hm.8.2`, ham8$`hv.8.2`, ham8$n2),
       ilab.xpos = c(-15, -14, -13, -11.5, -10.5, -9.5), 
       cex = 0.8, header = "Author and Year")

text(c(-15, -14, -13, -11.5, -10.5, -9.5), resham8$k+2,
     c("Mean", "SD", "Total", "Mean", "SD", "Total"), cex = 0.8)
text(c(-14, -10.5), resham8$k+3, c("Intervention", "control"), cex = 0.8)

reporter(resham8, format = "word")
#############################################################################



qoll8 <- extract[complete.cases(extract[, c("qm.L8.1", "qm.L8.2", "qv.L8.1", "qv.L8.2")]), ]

qoll8 <- escalc(measure ="MD", m1i=`qm.L8.1`, m2i=`qm.L8.2`
                , sd1i=`qv.L8.1`, sd2i=`qv.L8.2`, n1i=n1, n2i=n2, slab = paste(study), data =qoll8)

resqoll8 <- rma(yi, vi , data = qoll8)
resqoll8


forest(resqoll8, addpred = TRUE, showweights = TRUE,shade = "zebra",xlim = c(-18, 11), 
       ilab = cbind(qoll8$`qm.L8.1`, qoll8$`qv.L8.1`,qoll8$n1,
                    qoll8$`qm.L8.2`, qoll8$`qv.L8.2`, qoll8$n2),
       ilab.xpos = c(-15, -14, -13, -11.5, -10.5, -9.5), 
       cex = 0.8, header = "Author and Year")

text(c(-15, -14, -13, -11.5, -10.5, -9.5), resqoll8$k+2,
     c("Mean", "SD", "Total", "Mean", "SD", "Total"), cex = 0.8)
text(c(-14, -10.5), resqoll8$k+3, c("Intervention", "control"), cex = 0.8)


reporter(resqoll8, format = "word")
######################################################################




cortl8 <- extract[complete.cases(extract[, c("cm.L8.1", "cm.L8.2", "cv.L8.1", "cv.L8.2")]), ]

cortl8 <- escalc(measure ="MD", m1i=`cm.L8.1`, m2i=`cm.L8.2`
                , sd1i=`cv.L8.1`, sd2i=`cv.L8.2`, n1i=n1, n2i=n2, slab = paste(study), data =cortl8)

rescortl8 <- rma(yi, vi , data = cortl8)
rescortl8


forest(rescortl8, addpred = TRUE, showweights = TRUE,shade = "zebra",xlim = c(-18, 7), 
       ilab = cbind(cortl8$`cm.L8.1`, cortl8$`cv.L8.1`,cortl8$n1,
                    cortl8$`cm.L8.2`, cortl8$`cv.L8.2`, cortl8$n2),
       ilab.xpos = c(-15, -14, -13, -11.5, -10.5, -9.5), 
       cex = 0.8, header = "Author and Year")

text(c(-15, -14, -13, -11.5, -10.5, -9.5), rescortl8$k+2,
     c("Mean", "SD", "Total", "Mean", "SD", "Total"), cex = 0.8)
text(c(-14, -10.5), rescortl8$k+3, c("Intervention", "control"), cex = 0.8)
reporter(rescortl8, format = "word")


cort8 <- extract[complete.cases(extract[, c("cm.8.1", "cm.8.2", "cv.8.1", "cv.8.2")]), ]

cort8 <- escalc(measure ="MD", m1i=`cm.8.1`, m2i=`cm.8.2`
               , sd1i=`cv.8.1`, sd2i=`cv.8.2`, n1i=n1, n2i=n2, slab = paste(study), data =cort8)

rescort8 <- rma(yi, vi , data = cort8)
rescort8


forest(rescort8, addpred = TRUE, showweights = TRUE,shade = "zebra",xlim = c(-18, 7), 
       ilab = cbind(cort8$`cm.8.1`, cort8$`cv.8.1`,cort8$n1,
                    cort8$`cm.8.2`, cort8$`cv.8.2`, cort8$n2),
       ilab.xpos = c(-15, -14, -13, -11.5, -10.5, -9.5), 
       cex = 0.8, header = "Author and Year")

text(c(-15, -14, -13, -11.5, -10.5, -9.5), rescort8$k+2,
     c("Mean", "SD", "Total", "Mean", "SD", "Total"), cex = 0.8)
text(c(-14, -10.5), rescort8$k+3, c("Intervention", "control"), cex = 0.8)
reporter(rescort8, format = "word")
