##########From Darren Wilkinson's research blog#############
#Generate the data
set.seed(1)
Z=matrix(rnorm(1000*8,3.1,0.1),nrow=8)
RE=rnorm(8,0,0.01)
X=t(Z+RE)
colnames(X)=paste("Uni",1:8,sep="")
Data=stack(data.frame(X))
boxplot(exp(values)~ind,data=Data,notch=TRUE)

###################