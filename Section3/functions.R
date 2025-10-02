'''
rnorm()

c()
seq()
rep()

is.numeric()
is.integer()
is.character()
is.double()

typeof()

sqrt()
paste()
'''
?rnorm
rnorm(5,10,8)            #10 is mean and 8 is std dev
rnorm(n=5,mean=10,sd=8)
rnorm(sd=8,n=5,mean=10)     #you can interchange as well
rnorm(n=5,sd=8)             #mean is zero

?c()

?seq()
seq(from=1,to=10,by=2)
seq(from=10,to=40,length.out=100)     #gives 100 numbers between 10 to 40
x <- c("a","b","c")
seq(from=10,to=40,along.with=x)    #output length = x length

?rep()
rep(5,10)
rep(5:6,10)
rep(5:6,times=10)    #both 5 and 6 printed 10 times
rep(5:6,each=10)     #each numbers are printed 10 times
rep(x,each=5)
rep(x,times=5)

A <- seq(from=10,to=40,along.with=x)
B <- sqrt(A)
B











