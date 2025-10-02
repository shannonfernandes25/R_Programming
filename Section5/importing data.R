

?read.csv

#method 1: Select the file manually
stats <- read.csv(file.choose())     #file.choose - to select the file
stats

#method 2: set working directory and read data
rm(stats)
getwd()                  #to check current working directory
setwd("C:\\Users\\shann\\OneDrive\\Desktop\\R\\udemy\\section 5")     
#add double slash for windows.
#for mac this / is used.
getwd()
stats <- read.csv("P2-Demographic-Data.csv")
stats


#----------------Exploring data-----------------------------------------

nrow(stats)            #no of rows
ncol(stats)            #no of cols
head(stats)
tail(stats)
head(stats, n=10)
tail(stats, n=8)
str(stats)             #structure
summary(stats)



#----------------------using the $ sign----------------------------------

stats
head(stats)
stats[3,3]
stats[3,'Birth.rate']
stats$Internet.users                #gives the entire column as vectors
stats$Internet.users[2]             #gives the 2nd item of the vector
stats[,"Internet.users"]            #same operation
levels(stats$Income.Group)
#levels(stats[,"Income.Group"])



#---------------------Basic operations with a dataframe------------------------


stats[1:10,]              #subsetting
stats[3:9,]
stats[c(4,100),]

stats[1,]
is.data.frame(stats[1,])             #no need for drop=F

stats[,1]
is.data.frame(stats[,1])
stats[,1,drop=F]                     #converted to vector so drop is needeed
is.data.frame(stats[,1,drop=F])

#multiply columns
stats$Birth.rate*stats$Internet.users
stats$Birth.rate+stats$Internet.users

#add coloumns
head(stats)
stats$Mycalc <- stats$Birth.rate*stats$Internet.users
head(stats)

#test of knowledge
stats$xyz <- 1:5
head(stats,n=10)

stats$xyz <- 1:4     #not possible because 195 obs is not a multiple of 4

#removing a column
stats$Mycalc <- NULL
stats$xyz <- NULL
head(stats)



#-------------------Filtering dataframes--------------------------------------


head(stats)
stats$Internet.users < 2
filter <- stats$Internet.users < 2    #vectors are stored in filter variable
stats[1:100,]
stats[filter,]                        #shows only true values 

stats[stats$Birth.rate > 40,]
stats[stats$Birth.rate > 40 & stats$Internet.users < 2,]
stats[stats[,"Income.Group"]=="Low income",]
stats[stats$Income.Group == "High income",]
levels(stats$Income.Group)
stats[stats$Country.Name == "Malta",]

#------------------Introduction to qplot-------------------------------------

library("ggplot2")
?qplot
qplot(data=stats,x=Internet.users)
qplot(data=stats,x=Income.Group,y=Birth.rate)

qplot(data=stats,x=Income.Group,y=Birth.rate,size=3)
qplot(data=stats,x=Income.Group,y=Birth.rate,size=10)    
#no changes so I is introduced
qplot(data=stats,x=Income.Group,y=Birth.rate,size=I(10))
qplot(data=stats,x=Income.Group,y=Birth.rate,size=I(5))

qplot(data=stats,x=Income.Group,y=Birth.rate,size=I(3),
      colour="blue")
#its not blue so again I() is introduced
qplot(data=stats,x=Income.Group,y=Birth.rate,size=I(3),
      colour=I("blue"))
qplot(data=stats,x=Income.Group,y=Birth.rate,size=I(3),
      color=I("blue"))     #colour or color.....both same
qplot(data=stats,x=Income.Group,y=Birth.rate,geom="boxplot")

#--------------------Visualization with qplot-------------------------------


qplot(data=stats, x=Internet.users, y=Birth.rate)
qplot(data=stats, x=Internet.users, y=Birth.rate,
      size=I(4))
qplot(data=stats, x=Internet.users, y=Birth.rate,
      size=I(4), color="red")
qplot(data=stats, x=Internet.users, y=Birth.rate,
      size=I(2), color=Income.Group)
#----------------------Building dataframes-----------------------------------


#Execute below code to generate three new vectors
Countries_2012_Dataset <- c("Aruba","Afghanistan","Angola","Albania","United Arab Emirates","Argentina","Armenia","Antigua and Barbuda","Australia","Austria","Azerbaijan","Burundi","Belgium","Benin","Burkina Faso","Bangladesh","Bulgaria","Bahrain","Bahamas, The","Bosnia and Herzegovina","Belarus","Belize","Bermuda","Bolivia","Brazil","Barbados","Brunei Darussalam","Bhutan","Botswana","Central African Republic","Canada","Switzerland","Chile","China","Cote d'Ivoire","Cameroon","Congo, Rep.","Colombia","Comoros","Cabo Verde","Costa Rica","Cuba","Cayman Islands","Cyprus","Czech Republic","Germany","Djibouti","Denmark","Dominican Republic","Algeria","Ecuador","Egypt, Arab Rep.","Eritrea","Spain","Estonia","Ethiopia","Finland","Fiji","France","Micronesia, Fed. Sts.","Gabon","United Kingdom","Georgia","Ghana","Guinea","Gambia, The","Guinea-Bissau","Equatorial Guinea","Greece","Grenada","Greenland","Guatemala","Guam","Guyana","Hong Kong SAR, China","Honduras","Croatia","Haiti","Hungary","Indonesia","India","Ireland","Iran, Islamic Rep.","Iraq","Iceland","Israel","Italy","Jamaica","Jordan","Japan","Kazakhstan","Kenya","Kyrgyz Republic","Cambodia","Kiribati","Korea, Rep.","Kuwait","Lao PDR","Lebanon","Liberia","Libya","St. Lucia","Liechtenstein","Sri Lanka","Lesotho","Lithuania","Luxembourg","Latvia","Macao SAR, China","Morocco","Moldova","Madagascar","Maldives","Mexico","Macedonia, FYR","Mali","Malta","Myanmar","Montenegro","Mongolia","Mozambique","Mauritania","Mauritius","Malawi","Malaysia","Namibia","New Caledonia","Niger","Nigeria","Nicaragua","Netherlands","Norway","Nepal","New Zealand","Oman","Pakistan","Panama","Peru","Philippines","Papua New Guinea","Poland","Puerto Rico","Portugal","Paraguay","French Polynesia","Qatar","Romania","Russian Federation","Rwanda","Saudi Arabia","Sudan","Senegal","Singapore","Solomon Islands","Sierra Leone","El Salvador","Somalia","Serbia","South Sudan","Sao Tome and Principe","Suriname","Slovak Republic","Slovenia","Sweden","Swaziland","Seychelles","Syrian Arab Republic","Chad","Togo","Thailand","Tajikistan","Turkmenistan","Timor-Leste","Tonga","Trinidad and Tobago","Tunisia","Turkey","Tanzania","Uganda","Ukraine","Uruguay","United States","Uzbekistan","St. Vincent and the Grenadines","Venezuela, RB","Virgin Islands (U.S.)","Vietnam","Vanuatu","West Bank and Gaza","Samoa","Yemen, Rep.","South Africa","Congo, Dem. Rep.","Zambia","Zimbabwe")
Codes_2012_Dataset <- c("ABW","AFG","AGO","ALB","ARE","ARG","ARM","ATG","AUS","AUT","AZE","BDI","BEL","BEN","BFA","BGD","BGR","BHR","BHS","BIH","BLR","BLZ","BMU","BOL","BRA","BRB","BRN","BTN","BWA","CAF","CAN","CHE","CHL","CHN","CIV","CMR","COG","COL","COM","CPV","CRI","CUB","CYM","CYP","CZE","DEU","DJI","DNK","DOM","DZA","ECU","EGY","ERI","ESP","EST","ETH","FIN","FJI","FRA","FSM","GAB","GBR","GEO","GHA","GIN","GMB","GNB","GNQ","GRC","GRD","GRL","GTM","GUM","GUY","HKG","HND","HRV","HTI","HUN","IDN","IND","IRL","IRN","IRQ","ISL","ISR","ITA","JAM","JOR","JPN","KAZ","KEN","KGZ","KHM","KIR","KOR","KWT","LAO","LBN","LBR","LBY","LCA","LIE","LKA","LSO","LTU","LUX","LVA","MAC","MAR","MDA","MDG","MDV","MEX","MKD","MLI","MLT","MMR","MNE","MNG","MOZ","MRT","MUS","MWI","MYS","NAM","NCL","NER","NGA","NIC","NLD","NOR","NPL","NZL","OMN","PAK","PAN","PER","PHL","PNG","POL","PRI","PRT","PRY","PYF","QAT","ROU","RUS","RWA","SAU","SDN","SEN","SGP","SLB","SLE","SLV","SOM","SRB","SSD","STP","SUR","SVK","SVN","SWE","SWZ","SYC","SYR","TCD","TGO","THA","TJK","TKM","TLS","TON","TTO","TUN","TUR","TZA","UGA","UKR","URY","USA","UZB","VCT","VEN","VIR","VNM","VUT","PSE","WSM","YEM","ZAF","COD","ZMB","ZWE")
Regions_2012_Dataset <- c("The Americas","Asia","Africa","Europe","Middle East","The Americas","Asia","The Americas","Oceania","Europe","Asia","Africa","Europe","Africa","Africa","Asia","Europe","Middle East","The Americas","Europe","Europe","The Americas","The Americas","The Americas","The Americas","The Americas","Asia","Asia","Africa","Africa","The Americas","Europe","The Americas","Asia","Africa","Africa","Africa","The Americas","Africa","Africa","The Americas","The Americas","The Americas","Europe","Europe","Europe","Africa","Europe","The Americas","Africa","The Americas","Africa","Africa","Europe","Europe","Africa","Europe","Oceania","Europe","Oceania","Africa","Europe","Asia","Africa","Africa","Africa","Africa","Africa","Europe","The Americas","The Americas","The Americas","Oceania","The Americas","Asia","The Americas","Europe","The Americas","Europe","Asia","Asia","Europe","Middle East","Middle East","Europe","Middle East","Europe","The Americas","Middle East","Asia","Asia","Africa","Asia","Asia","Oceania","Asia","Middle East","Asia","Middle East","Africa","Africa","The Americas","Europe","Asia","Africa","Europe","Europe","Europe","Asia","Africa","Europe","Africa","Asia","The Americas","Europe","Africa","Europe","Asia","Europe","Asia","Africa","Africa","Africa","Africa","Asia","Africa","Oceania","Africa","Africa","The Americas","Europe","Europe","Asia","Oceania","Middle East","Asia","The Americas","The Americas","Asia","Oceania","Europe","The Americas","Europe","The Americas","Oceania","Middle East","Europe","Europe","Africa","Middle East","Africa","Africa","Asia","Oceania","Africa","The Americas","Africa","Europe","Africa","Africa","The Americas","Europe","Europe","Europe","Africa","Africa","Middle East","Africa","Africa","Asia","Asia","Asia","Asia","Oceania","The Americas","Africa","Europe","Africa","Africa","Europe","The Americas","The Americas","Asia","The Americas","The Americas","The Americas","Asia","Oceania","Middle East","Oceania","Middle East","Africa","Africa","Africa","Africa")


#(c) Kirill Eremenko, www.superdatascience.com

mydf <- data.frame(Countries_2012_Dataset,Codes_2012_Dataset,
                   Regions_2012_Dataset)
head(mydf)
colnames(mydf) <- c("Countries","Codes","Regions")
head(mydf)

#or
rm(mydf)
mydf <- data.frame(Countries=Countries_2012_Dataset,Codes=Codes_2012_Dataset,
                   Regions=Regions_2012_Dataset)
head(mydf)
tail(mydf)
summary(mydf)

#------------------------------merging dataframes------------------------------


head(stats)
head(mydf)

merged <- merge(stats,mydf,by.x="Country.Code",by.y="Codes")
#x is stats and y is mydf
head(merged)
#R understands that country codes and codes column are same so doesnt print duplicate

merged$Countries <- NULL
str(merged)
tail(merged)

#------------------------------visualization with qplots-2----------------------


qplot(data=merged, x=Internet.users, y=Birth.rate)
qplot(data=merged, x=Internet.users, y=Birth.rate, 
      color=Regions)
qplot(data=merged, x=Internet.users, y=Birth.rate, 
      color=Regions, size=I(2))

#1.shapes
qplot(data=merged, x=Internet.users, y=Birth.rate, 
      color=Regions, size=I(2), shape=I(17))    #google R shape ans see images
qplot(data=merged, x=Internet.users, y=Birth.rate, 
      color=Regions, size=I(2), shape=I(2))
qplot(data=merged, x=Internet.users, y=Birth.rate, 
      color=Regions, size=I(2), shape=I(15))
qplot(data=merged, x=Internet.users, y=Birth.rate, 
      color=Regions, size=I(2), shape=I(23))

#2,Transparecy
qplot(data=merged, x=Internet.users, y=Birth.rate, 
      color=Regions, size=I(2), shape=I(19),
      alpha=0.1)
#alpha value ranges from 0 to 1 for transparecy
qplot(data=merged, x=Internet.users, y=Birth.rate, 
      color=Regions, size=I(2), shape=I(19),
      alpha=0.6)

#3.Title
qplot(data=merged, x=Internet.users, y=Birth.rate, 
      color=Regions, size=I(2), shape=I(19),
      alpha=0.6, main="Birth Rate VS Internet Users")






