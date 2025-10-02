

x <- rnorm(5)
x

#R specific programming loop
for (i in x){
  print(i)
}

#conventional loop
for (j in 1:5){
  print(j)
}


#--------------2nd part




N <- 100
a <- rnorm(N)
b <- rnorm(N)

#vectorized approach
c <- a*b

#de-vectorized approach
d <- rep(NA,N)                 #replicate null 100 times
for (i in 1:N){
  d[i] <- a[i]*b[i]
}

d















