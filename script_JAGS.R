#############Bayesian analysis in JAGS###############################

require(rjags)
n=dim(X)[1]
p=dim(X)[2]
data=list(X=X,n=n,p=p)
init=list(mu=2,tau=1)
modelstring="
  model {
    for (j in 1:p) {
      theta[j]~dnorm(0,0.0001)
      for (i in 1:n) {
        X[i,j]~dnorm(mu+theta[j],tau)
      }
    }
    mu~dnorm(0,0.0001)
    tau~dgamma(1,0.0001)
  }
"
model=jags.model(textConnection(modelstring),data=data,inits=init)
update(model,n.iter=1000)
output=coda.samples(model=model,variable.names=c("mu","tau","theta"),n.iter=100000,thin=10)
print(summary(output))
plot(output)
autocorr.plot(output)
pairs(as.matrix(output))
crosscorr.plot(output)
######################################
