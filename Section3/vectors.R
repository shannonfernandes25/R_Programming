

Myfirstvector <- c(3, 45, 76, 654)  #c is a function for vectors
Myfirstvector
is.numeric(Myfirstvector)   #to check if its numeric
is.integer(Myfirstvector)
is.double(Myfirstvector)

V2 <- c(3L,45L,32L,678L)
V2
is.numeric(V2)
is.integer(V2)
is.double(V2)

V3 <- c("a","B23","hello")
V3
is.character(V3)
is.numeric(V3)

#vectors can include only one type of data 
a1 <- c("a","B23","hello",77)
a1

#seq()    sequence - like ':'
seq(1,15)
1:15     #both are same....anyone can be used
seq(1,15,2)    #step can not be achieved with colon function
z <- seq(1,15,4)
z

rm(a1)

#rep()    replicate
rep(3,10)    #3 is written 10 times
d <- rep(3,50)
d
rep("a",20)

#replication of vectors
x <- c(80,20)
y <- rep(x,15)    #80 and 20 are repeated 15 times together
y










