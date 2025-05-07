library(metafor)
library(dplyr)


# Transformation functions (I only used the 2nd one because I went with PLN measure)
mytransf <- function(x) {
  return(plogis(x) * 100) 
}
mytransf2 <- function(x) {
  exp(x) * 100
}

mlabfun <- function(text, res) {
  list(bquote(paste(.(text),
                    " (Q = ", .(formatC(res$QE, digits=2, format="f")),
                    ", df = ", .(res$k - res$p),
                    ", p ", .(metafor:::.pval(res$QEp, digits=2, showeq=TRUE, sep=" ")), "; ",
                    I^2, " = ", .(formatC(res$I2, digits=1, format="f")), "%, ",
                    tau^2, " = ", .(formatC(res$tau2, digits=2, format="f")), ")")))
}

# Proportional analysis



ict<-ict[complete.cases(ict[ c("Event")]), ]





dat <- escalc(measure="PLN", xi = Event, ni=Total, slab = paste(Study),  data=ict,)
dat <- dat %>% arrange(Drug)

#Subgroups
res_PD1 <- rma(yi, vi, data = dat, control = list(stepadj=0.5, maxiter=1000),method = "REML", subset = (Drug == "Anti PD-1"))
res_PDL1 <- rma(yi, vi, data = dat, control = list(stepadj=0.5, maxiter=1000),method = "REML", subset = (Drug == "Anti PD-L1"))
res_CTLA4 <- rma(yi, vi, data = dat, control = list(stepadj=0.5, maxiter=1000),method = "REML" ,subset = (Drug == "Anti CTLA-4"))
res_combination <- rma(yi, vi, data = dat, control = list(stepadj=0.5, maxiter=1000), method = "REML",subset = (Drug == "Combination"))
#Full Model
res <- rma(yi, vi, data=dat, control = list(stepadj=0.5, maxiter=1000), method = "REML")




#Subgrouping automated (because different outcomes have different study counts)

subgroups <- split(dat, dat$Drug)
subgroup_order <- c("Anti CTLA-4", "Anti PD-1", "Anti PD-L1", "Combination")  
subgroups <- subgroups[subgroup_order]


n_studies <- sapply(subgroups, nrow)
start_rows <- cumsum(c(4, n_studies[-4] + 3)) 


rows <- unlist(mapply(function(start, n) seq(start, length.out = n),
                      start_rows, n_studies))

forest(res, xlim=c(-15, 5), ylim = c(-2, max(rows) + 3), 
       atransf=mytransf2, at = c(-8,-6,-4,-2,0),
       ilab = cbind(dat$Drug, dat$Total,dat$Event), ilab.xpos = c(-11, -10, -9),
       cex=0.8, xlab="Incidence Percentage (%)", 
       rows = rows,refline = NULL,
       mlab=mlabfun("REML Model for All Studies Hyponatremia", res),
       header="Author(s) and Year")


polygon_rows <- start_rows - 2 
addpoly(res_CTLA4, col = "lightcoral", row = polygon_rows[1], 
        mlab=mlabfun("REML Model for CTLA4 Subgroup", res_CTLA4))
addpoly(res_PD1, col = "lightgreen", row = polygon_rows[2],
        mlab=mlabfun("REML Model for Anti PD-1 Subgroup", res_PD1))
addpoly(res_PDL1, col = "purple", row = polygon_rows[3],
        mlab=mlabfun("REML Model for Anti PD-L1Subgroup", res_PDL1))
addpoly(res_combination, col = "lightyellow", row = polygon_rows[4],
        mlab=mlabfun("REML Model for Combitnation Subgroup", res_combination))


abline(h = polygon_rows - 1, col="black", lty=2)


text(c(-11,-10,-9), max(rows) + 3, c("Treatment", "Total","Events"), cex = 0.8)












#Copy the res




#reporter(res, forest = FALSE,dir = "C:/college/research/Systematic Reviews/زين يحتل العالم", filename = "res2", format = "word")

