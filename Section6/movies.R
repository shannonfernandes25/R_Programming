#---------------------------------factor-------------------------------------

getwd()
setwd("C:\\Users\\shann\\OneDrive\\Desktop\\R\\udemy\\section 6")
getwd()

movies <- read.csv(file.choose())
head(movies)
#the colnames are not proper so lets fix it

colnames(movies) <- c("Film","Genre","CriticRating","AudienceRating","BudgetMillions","Year")
head(movies)
tail(movies)
str(movies)
summary(movies)

factor(movies$Year)
movies$Year <- factor(movies$Year)
summary(movies)
str(movies)


#-----------------------------aesthetics---------------------------------------


library(ggplot2)

ggplot(data=movies, aes(x=CriticRating,y=AudienceRating))
ggplot(data=movies, aes(x=CriticRating,y=AudienceRating))+geom_point()

#adding color
ggplot(data=movies, aes(x=CriticRating,y=AudienceRating,color=Genre))+geom_point()

#add size
ggplot(data=movies, aes(x=CriticRating,y=AudienceRating,
                        color=Genre,size = Genre))+geom_point()

#add size - make it better
ggplot(data=movies, aes(x=CriticRating,y=AudienceRating,
                        color=Genre,size = BudgetMillions))+geom_point()



#---------------------------Plotting with layers--------------------------------



p <- ggplot(data=movies, aes(x=CriticRating,y=AudienceRating,
                             color=Genre,size = BudgetMillions))

#points
p + geom_point()

#lines
p + geom_line()

#multiple layers
p + geom_point() + geom_line()  
p + geom_line() + geom_point()    #now it is better



#-----------------------overriding aesthetics-----------------------------------



q <- ggplot(data=movies, aes(x=CriticRating,y=AudienceRating,
                             color=Genre,size = BudgetMillions))

#add geom layers
q + geom_point()

#overriding aes
#ex-1
q + geom_point(aes(size=CriticRating))

#ex-2
q + geom_point(aes(color=BudgetMillions))

q + geom_point()

#ex-3
q + geom_point(aes(x=BudgetMillions))
q + geom_point(aes(x=BudgetMillions)) + xlab("BudgetMillions")

#ex-4
q + geom_line() + geom_point()
#reducing size
q + geom_line(size=0.5) + geom_point()
q + geom_line(size=0.5) + geom_point(size=1)



#---------------------------Mapping vs Setting---------------------------------


q + geom_point(aes(x=BudgetMillions)) + xlab("BudgetMillions")

r <- ggplot(data=movies,aes(x=CriticRating,y=AudienceRating))
r + geom_point()

#1.mapping (which we have already done)
r + geom_point(aes(color=Genre))
#2.setting
r + geom_point(color="Darkgreen")
#ERROR
r + geom_point(aes(color="Darkgreen"))    #shows red, error

#1.mapping (which we have already done)
r + geom_point(aes(size=BudgetMillions))
#2.setting
r + geom_point(size=3)
#ERROR
r + geom_point(aes(size=3))



#---------------------Histogram and Density charts------------------------------


#histogram
s <- ggplot(data=movies,aes(x=BudgetMillions))
s + geom_histogram()
s + geom_histogram(binwidth = 10)

#add color
s + geom_histogram(binwidth = 10, color="green")
s + geom_histogram(binwidth = 10, fill="green")
s + geom_histogram(binwidth = 10, aes(fill=Genre))

#add border
s + geom_histogram(binwidth = 10, aes(fill=Genre), color="black")

#Density chart
s + geom_density()
s + geom_density(aes(fill=Genre))
s + geom_density(aes(fill=Genre),position="stack")



#--------------------------------Starting layer tips---------------------------


t <- ggplot(data=movies,aes(x=AudienceRating))
t + geom_histogram(binwidth = 10,color="blue",fill="white")

#another way
t <- ggplot(data=movies)
t + geom_histogram(binwidth = 10,aes(x=AudienceRating),
                   fill="white",color="blue")

t + geom_histogram(binwidth = 10,aes(x=CriticRating),
                   fill="white",color="blue")

t <- ggplot()



#------------------------Statistical Transformation----------------------------


?geom_smooth

u <- ggplot(data = movies,aes(x=CriticRating,y=AudienceRating,color=Genre))
u + geom_point()
u + geom_point() + geom_smooth()
u + geom_point() + geom_smooth(fill=NA)

#boxplots
u <- ggplot(data=movies,aes(x=Genre,y=AudienceRating,color=Genre))
u + geom_boxplot()
u + geom_boxplot(size=1.2)
u + geom_boxplot(size=1.2) + geom_point()

#tip/hack
u + geom_boxplot(size=1.2) + geom_jitter()

#another hack
u + geom_jitter() + geom_boxplot()
u + geom_jitter() + geom_boxplot(size=1.2)
u + geom_jitter() + geom_boxplot(size=1.2,alpha=0.5)


#----------------------------using facets-------------------------------------


v <- ggplot(data=movies,aes(x=BudgetMillions))
v + geom_histogram(binwidth=10,aes(fill=Genre),colour="Black" )

#facets
v + geom_histogram(binwidth=10,aes(fill=Genre),colour="Black" ) +
  facet_grid(Genre~.)  #Genre is the rows and columns is nothing
v + geom_histogram(binwidth=10,aes(fill=Genre),colour="Black" ) +
  facet_grid(Genre~.,scales="free" )    #independent scales for y axis

#scatterplots
w <- ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,color=Genre))
w + geom_point(size=2)

#facets
w + geom_point(size=2) + facet_grid(Genre~.)           #row is Genre
w + geom_point(size=2) + facet_grid(.~Year)            #column is Year  
w + geom_point(size=2) + facet_grid(Genre~Year)        #row is genre, col is Year
w + geom_point(size=2) + geom_smooth() + 
  facet_grid(Genre~Year)  
w + geom_point(aes(size=BudgetMillions)) + geom_smooth() + 
  facet_grid(Genre~Year)
w + geom_point(size=0.5,aes(size=BudgetMillions)) + geom_smooth() + 
  facet_grid(Genre~Year)



#-------------------------------Coordinates------------------------------------



m <- ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,
                            size = BudgetMillions,
                            color=Genre))
m + geom_point()

m + geom_point() + xlim(50,100)
m + geom_point() + xlim(50,100) + ylim(50,100)

#wont work well always
n <- ggplot(data=movies,aes(x=BudgetMillions))
n + geom_histogram(binwidth=10,aes(fill=Genre),color="black")

n + geom_histogram(binwidth=10,aes(fill=Genre),color="black") +
  ylim(0,100)

#instead - zoom:
n + geom_histogram(binwidth=10,aes(fill=Genre),color="black") + 
  coord_cartesian(ylim=c(0,50))    #rows are not removed they are there

#improve
w + geom_point(size=0.5,aes(size=BudgetMillions)) + geom_smooth() + 
  facet_grid(Genre~Year)
w + geom_point(size=0.5,aes(size=BudgetMillions)) + geom_smooth() + 
  facet_grid(Genre~Year) + coord_cartesian(ylim=c(0,150))


#------------------------adding themes-------------------------------------


o <- ggplot(data=movies,aes(x=BudgetMillions))
h <- o + geom_histogram(binwidth=10,aes(fill=Genre),colour="black")
h

?theme

#axes labels
h + xlab("Money Axis") + ylab("Number of Movies")

#label formatting
h + xlab("Money Axis") + ylab("Number of Movies") +
  theme(axis.title.x=element_text(color="Darkgreen",size=20),
        axis.title.y=element_text(color="red",size=20))

#tick mark formatting
h + xlab("Money Axis") + ylab("Number of Movies") +
  theme(axis.title.x=element_text(color="DarkGreen",size=20),
        axis.title.y=element_text(color="red",size=20),
        axis.text.x = element_text(size=15),
        axis.text.y = element_text(size=15))

#legend formatting
h + xlab("Money Axis") + ylab("Number of Movies") +
  theme(axis.title.x=element_text(color="Darkgreen",size=20),
        axis.title.y=element_text(color="red",size=20),
        axis.text.x = element_text(size=15),
        axis.text.y = element_text(size=15),
        
        legend.title = element_text(size=30))


h + xlab("Money Axis") + ylab("Number of Movies") +
  theme(axis.title.x=element_text(color="Darkgreen",size=20),
        axis.title.y=element_text(color="red",size=20),
        axis.text.x = element_text(size=15),
        axis.text.y = element_text(size=15),
        
        legend.title = element_text(size=30),
        legend.text = element_text(size=20))


h + xlab("Money Axis") + ylab("Number of Movies") +
  theme(axis.title.x=element_text(color="Darkgreen",size=20),
        axis.title.y=element_text(color="red",size=20),
        axis.text.x = element_text(size=15),
        axis.text.y = element_text(size=15),
        
        legend.title = element_text(size=30),
        legend.text = element_text(size=20),
        legend.position = c(1,1))


h + xlab("Money Axis") + ylab("Number of Movies") +
  theme(axis.title.x=element_text(color="Darkgreen",size=20),
        axis.title.y=element_text(color="red",size=20),
        axis.text.x = element_text(size=15),
        axis.text.y = element_text(size=15),
        
        legend.title = element_text(size=20),
        legend.text = element_text(size=10),
        legend.position = c(1,1),
        legend.justification = c(1,1))


#title
h + xlab("Money Axis") + ylab("Number of Movies") + ggtitle("Movie Budget Distribution") +
  theme(axis.title.x=element_text(color="Darkgreen",size=20),
        axis.title.y=element_text(color="red",size=20),
        axis.text.x = element_text(size=15),
        axis.text.y = element_text(size=15),
        
        legend.title = element_text(size=20),
        legend.text = element_text(size=10),
        legend.position = c(1,1),
        legend.justification = c(1,1))


h + xlab("Money Axis") + ylab("Number of Movies") + ggtitle("Movie Budget Distribution") +
  theme(axis.title.x=element_text(color="Darkgreen",size=20),
        axis.title.y=element_text(color="red",size=20),
        axis.text.x = element_text(size=15),
        axis.text.y = element_text(size=15),
        
        legend.title = element_text(size=20),
        legend.text = element_text(size=10),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        
        plot.title = element_text(size=20,color="Darkblue",
                                  family = "Courier"))       #family - diff text style
        
        
  