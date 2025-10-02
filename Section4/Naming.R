#namedvectors
Charlie <- 1:5
Charlie

#give names
names(Charlie) <- c("a","b","c","d","e")
Charlie
Charlie["c"]
names(Charlie)

#clear names
names(Charlie) <- NULL
Charlie

#--------------------------------------------------------

#Naming Matrix dimensions 1
temp.vec <- rep(c("a","b","zZ"),each=3)
temp.vec

Bravo <- matrix(temp.vec,3,3)
Bravo

rownames(Bravo) <- c("how","are","you")
Bravo

colnames(Bravo) <- c("x","y","z")
Bravo

Bravo["are","y"]
Bravo["are",2]      #both are same

Bravo["are","y"] <- 0
Bravo

rownames(Bravo) <- NULL
Bravo
