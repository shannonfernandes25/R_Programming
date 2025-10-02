#test the law of large numbers for N random normally distributed numbers 
#with mean=0 and std dev=1
N <- 1000000                       #specify sample size
counter <- 0                   #reset counter
for (i in rnorm(N)) {          #iterate over vector of numbers
  if(i>-1 & i<1){              #check where iterated variable falls
    counter <- counter + 1     #increase counter if condition is met
  }
}
answer <- counter/N            #calculate hit ratio(% of values within 1 std dev)
answer                         #print answer in console



