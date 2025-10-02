

x <- c("a","b","c","d","e")
x
x[c(1,5)]
x[1]

Games
Games[1:3,6:10]
Games[c(1,10),]                #only 1st and 10th row
Games[,c("2008","2009")]
Games[,c(4,5)]                 #both lines are same
Games[1,]
Games[1,5]

is.matrix(Games[1,])
is.vector(Games[1,])

Games[1,,drop=F]           #it will give a matrix doesnt drop the dimension
Games[1,5,drop=F]
