'''
syntax
function(){

}
'''
myplot <- function(){
  Data <- MinutesPlayed[2:3,,drop=F]
  matplot(t(Data),type="b",pch=15:18,col=c(1:4,6))
  legend("bottomleft",inset=0.01,legend=Players[2:3],col=c(1:4,6),pch=15:18,horiz=F)
}

myplot()
#-----------------------------------------------------------------------------------

myplot <- function(rows){
  Data <- MinutesPlayed[rows,,drop=F]
  matplot(t(Data),type="b",pch=15:18,col=c(1:4,6))
  legend("bottomleft",inset=0.01,legend=Players[rows],col=c(1:4,6),pch=15:18,horiz=F)
}

myplot(1:5)           #rows=1:5
#------------------------------------------------------------------------------------

myplot <- function(data,rows){
  Data <- data[rows,,drop=F]
  matplot(t(Data),type="b",pch=15:18,col=c(1:4,6))
  legend("bottomleft",inset=0.01,legend=Players[rows],col=c(1:4,6),pch=15:18,horiz=F)
}

myplot(Salary,1:5)        #data=Salary  rows=1:5
#------------------------------------------------------------------------------------


myplot <- function(data,rows=1:10){
  Data <- data[rows,,drop=F]
  matplot(t(Data),type="b",pch=15:18,col=c(1:4,6))
  legend("bottomleft",inset=0.01,legend=Players[rows],col=c(1:4,6),pch=15:18,horiz=F)
}

myplot(MinutesPlayed)
#------------------------------------------------------------------------------------


myplot <- function(data,rows=1:10){
  Data <- data[rows,,drop=F]
  matplot(t(Data),type="b",pch=15:18,col=c(1:4,6))
  legend("bottomleft",inset=0.01,legend=Players[rows],col=c(1:4,6),pch=15:18,horiz=F)
}

myplot(MinutesPlayed/Games, 3)    


