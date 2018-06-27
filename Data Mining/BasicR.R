#to create a vector of numbers, we use the functionc() (for concatenate).
x <- c(1,3,2,5)
x

x = c(1,6,2)
x
y = c(1,4,3)

#?funcname will always cause R toopen a new help file window with additional information about the function funcname.

#We can check their length using the length() function.
length(x)
length(y)

#add two sets of numbers together
x+y

#ls() function allows us to look at a list of all of the objects
ls()

#The rm() function can be used to delete any that we don't want.
rm(x,y)
ls()

#It's also possible to remove all objects at once:
rm(list=ls())
ls()

#The matrix() function can be used to create a matrix of numbers.
x <- matrix (data=c(1,2,3,4) , nrow=2, ncol =2)
#x=matrix (c(1,2,3,4) ,2,2)

#byrow=TRUE option can be used to populate the matrix in order of the rows.
matrix (c(1,2,3,4) ,2,2,byrow =TRUE)

#sqrt() function returns the square root of each element of a vector or matrix.
sqrt(x)

#for any power
x^2

#The rnorm() function generates a vector of random normal variables with first argument n the sample size.
#By default, rnorm() creates standard normal random variables with a mean of 0 and a standard deviation of 1
x=rnorm (50)
y=x+rnorm (50, mean=50, sd=.1)

# the cor() function to compute the correlation
cor(x,y)

#Sometimes we want our code to reproduce the exact same set of random numbers; we can use the set.seed() function to do this.
# The set.seed() function takes an (arbitrary) integer argument.
set.seed(1309)
rnorm(50)

set.seed (3)

y=rnorm (100)

mean(y)

var(y)

sqrt(var(y))

sd(y)
 
#The plot() function is the primary way to plot data
#plot(x,y) produces a scatterplot
x=rnorm (100)
y=rnorm (100)
plot(x,y)
plot(x,y, xlab=" this is the x-axis", ylab=" this is the y-axis", main=" Plot of X vs Y")

#The function seq() can be used to create a sequence of numbers. For instance, seq(a,b) makes a vector of integers between a and b.
x <- seq (1 ,10)
x

seq(0,1,length=10)
#makes a sequence of10 numbers that are equally spaced between 0 and 1

#Typing 3:11 is a shorthand for seq(3,11) for integer arguments.
1:10

#examine part of a set of data
A <- matrix(1:16, 4 ,4)
A

#select the element corresponding to the second row and the third column
A[2,3]

#The first number after the open-bracket symbol [ always refers to the row, and the second number always refers to the column. 
#We can also select multiple rows and columns at a time, by providing vectors as the indices.
A[c(1,3) ,c(2,4) ]

A[1:3 ,2:4]

A[1:2 ,]

A[ ,1:2]

#R treats a single row or column of a matrix as a vector.
A[1,]

#The use of a negative sign - in the index tells R to keep all rows or columns except those indicated in the index.
A[-c(1,3) ,]

A[-c(1,3) ,-c(1,3,4)]

#The dim() function outputs the number of rows followed by the number of columns of a given matrix.
dim(A)

#read.table() function to import dataset
#Auto <- read.table("C:/Users/Arti/Desktop/SecondSemester/Big Data/Firstpart/Assignment/Auto.txt")

#fix() function can be used to view it in a spreadsheet like window
#fix(Auto)

#Using the option header=TRUE in the read.table() function tells R that the first line of the file contains the variable names
#na.strings tells R that any time it sees a particular character or set of characters (such as a question mark),it should be treated as a missing element of the data matrix.
#Auto=read.table ("C:/Users/Arti/Desktop/SecondSemester/Big Data/Firstpart/Assignment/Auto.txt", header =T,na.strings ="?")
#fix(Auto)

Auto <- read.csv("C:/Users/Arti/Desktop/SecondSemester/Big Data/Firstpart/Assignment/Auto.csv", header =T,na.strings ="?")
fix(Auto)
#The dim() function tells us that the data has 397 observations, or rows, and nine variables
dim(Auto)

Auto[1:4,]

# na.omit() function to simply remove missing value rows
Auto=na.omit(Auto)
dim(Auto)

#names() to check the variable names
names(Auto)

plot(Auto$cylinders , Auto$mpg )

#attach() function in order to tell R to make the variables in this data frame available by name.
attach (Auto)

plot(cylinders , mpg)

#The as.factor() function converts quantitative variables into qualitative variable
cylinders =as.factor (cylinders )

plot(cylinders , mpg)
plot(cylinders , mpg , col ="red ")
plot(cylinders , mpg , col ="red", varwidth =T)

plot(cylinders , mpg , col ="red", varwidth =T,horizontal =T)
plot(cylinders , mpg , col ="red", varwidth =T, xlab=" cylinders ", ylab ="MPG ")

#The hist() function can be used to plot a histogram.
hist(mpg)
hist(mpg ,col =2)
hist(mpg ,col =2, breaks =15)

#The pairs() function creates a scatterplot matrix
pairs(Auto)

pairs(~mpg + displacement + horsepower + weight + acceleration , Auto)

plot(horsepower ,mpg)
#identify (horsepower ,mpg ,name)

#The summary() function produces a numerical summary of each variable
summary(Auto)

summary(mpg)

