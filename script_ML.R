

####Fit the data with a 
#ML analysis
mod=lm(values~ind,data=Data)
summary(mod)
#or

options(contrasts=rep("contr.sum",2))

mods=lm(values~ind,data=Data)
summary(mods)
