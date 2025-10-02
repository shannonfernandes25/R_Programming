


Salary
Games
MinutesPlayed

#matrix()
?matrix
my.data <- 1:20
my.data

A <- matrix(my.data, 4, 5)   #rows=4  cols=5
A
A[2,3]
A[,3]

B <- matrix(my.data, 4, 5, byrow = T)
B
B[2,5]


#rbind          -row bind
?rbind
r1 <- c("I","am","Happy")
r2 <- c("yes","I","am")
r3 <- c(1,2,3)                     #this line will be converted to characters
C <- rbind(r1,r2,r3)
C
C[3,2]


#cbind          -column bind
c1 <- 1:5
c2 <- -1:-5
D <- cbind(c1,c2)
D













