#if statement

# ---- -2 ---- -1 ------ 0 ----- 1 ----- 2

#syntax
#if(condition){
#  body
#}



#rnorm generates random numbers from normal distribution
#rnorm(n, mean = 0, sd = 1)
#n represents the number of random values to generate.
#mean signifies the mean (average) of the distribution, with a default of 0.
#sd denotes the standard deviation, indicating the spread of values, with a default of 1.
rnorm(1) 

rm(answer)        #removes variable answer from the environment
x <- rnorm(1)
if(x>1){
  answer <- "Greater than 1"
}


#if else statement
#rm(answer)        #removes variable answer from the environment
x <- rnorm(1)
if(x>1){
  answer <- "Greater than 1"
}else{
  answer <- "less or equal to 1"
}


#nested-if statement
x <- rnorm(1)
if(x>1){
  answer <- "Greater than 1"
}else{
   if(x>=-1){
     answer <- "Between -1 and 1"
   }else{
     answer <- "Less than -1"
   }
}


#chaining statements
x <- rnorm(1)
if (x>1){
  answer <- "greater than 1"
}else if(x>=-1){
  answer <- "between -1 and 1"
}else{
  answer <- "less than -1"
}



