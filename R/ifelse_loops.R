### FW R Group Meeting 10/23/2020 1 pm
### Victoria Quennessen
### If statements and Loops

##### Boolean objects ##########################################################
#' Logical vectors (R object) store TRUEs and FALSEs. If transferred to numeric 
#' objects, they will become 1s and 0s, respectively. Any time you type T or 
#' TRUE or F or FALSE (in capitals, specifically) R will assume you mean the 
#' logical objects. So don't use them as variable names - it won't work. 

logic <- c(TRUE, FALSE, T, F)
class(logic)
class(T)
sum(logic)

#' if you specify another value for T or F, R can learn that, so better to use 
#' TRUE and FALSE when you mean the logical objects, and still good practice to 
#' avoid using T and F as variable names. 

T <- 500
class(T)

#' R will also provide logicals when presented with comparisons. This can be 
#' useful when working with vectors where you want to know how many elements 
#' meet certain conditions. 

3 > 4
3 > 2
x <- 1:10
x > 3
sum(x > 3)

##### If statements ############################################################
#' basic form as follows:
#' if (statement is TRUE) {do a thing}

x <- 5
if (x < 6) {
  print(paste(x, ' is less than 6'))
} 

#' to add an else statement, basic form as follows:
#' if (statement is TRUE) {do a thing} else {otherwise, do this thing}

x <- 7
if (x < 6) {
  print(paste(x, ' is less than 6'))
} else {print(paste(x, 'is not less than 6'))}

#' ifelse() function
#' this function is a useful shortcut for the whole if(){}else{} thing above
#' basic form as follows:
#' ifelse(if this expression is true, output this, otherwise output this)
#' and note that the output will have the same length as the tested expression

x <- 5
ifelse(x < 6, 'x is < 6', 'x is > 6')

#' you can also use ifelse on vectors more easily than if/else statements
data("mtcars")
if (mtcars$hp < 100) {mtcars$rating = 'lame'} else {mtcars$rating ='cool'}
mtcars$rating <- ifelse(mtcars$hp < 100, 'lame', 'cool')

#' if you wanna get fancy, you can also do nested ifelse() statements:
mtcars$rating <- ifelse(mtcars$hp < 100, 'lame', 
                        ifelse(mtcars$hp < 200, 'kinda cool', 'cool'))

##### While loops ##############################################################
#' while loops don't have a predetermined number of loops, they run while some
#' condition is still true. basic form as follows:
#' while (condition is true) {do some thing(s)}

x <- 0
while (x < 10) {x <- x + 1}
x

#' ALWAYS make sure that your while loop will eventually reach the point where 
#' it will end - in other words, make sure the 'things' your code is doing 
#' affect the condition. Otherwise your computer will be study FOREVER and may 
#' crash.this is no bueno. To stop a loop, hit the "Escape" key, or the little 
#' red stop sign at the top right of the console. But mostly avoid while loops 
#' unless there's literally nothing else that can do what you want to do.

##### For loops ################################################################
#' https://rstudio-education.github.io/hopr/loops.html#for-loops 
#' for loops will run the same code for different values in some vector. Basic 
#' form as follows:
#' for (thing in vector) {do something}

for (i in 1:10) {
  print(i + 2)
}

#' note that you can use anything that is a valid object name instead of 'i':

for (thingamabob in 1:10) {
  print(thingamabob + 2)
}

#' this is an overly simplistic example, and you should never actually use a for
#' loop that does this, since it's easier to just add 2 to the vector:
x <- 1:10
y <- x + 2
y

#' common coding question in interviews (i.e. do you know how to logic?)
#' "Write a program that prints the numbers from 1 to 100. But for multiples of 
#' three print “Fizz” instead of the number and for the multiples of five print 
#' “Buzz”. For numbers which are multiples of both three and five print “
#' FizzBuzz”."

## Kenneth's answer
funky <- function(n = 100, div_1 =3, div_2 = 5){
  
  # assign variables
  x <- 1:n
  y <- x%%div_1 == 0
  z <- x%%div_2 == 0 
  
  # create holders
  tmp1 <- rep("", length(x))
  tmp2 <- rep("", length(x))
  
  tmp1[y] <- "fizz"
  tmp2[z] <- "buzz"
  out <- paste0(tmp1, tmp2)
  out[y == 0 & z == 0] <- as.character(x)[y == 0 & z == 0]
  return(out)
}

funky()


## Marie's answer
for(i in 1:100) 
{
  a <- ""
  b <- ""
  if(i %% 3 == 0)
  {
    a <- "fizz"
  }
  if(i %% 5 == 0)
  {
    b <- "buzz"
  }
  print(paste0(i, " ", a, b))
}

# Vic's not a loop answer
results <- data.frame(x = 1:100, fizzbuzz = rep(NA, length(x)))
results$fizzbuzz <- ifelse(results$x %% 15 == 0, 'FizzBuzz', 
                           ifelse(results$x %% 5 == 0, 'Buzz', 
                                  ifelse(results$x %% 3 == 0, 'Fizz', results$x)))
results

# Ladd's answer
x <- 1:100
temp = which(x%%5==0)
temp2 = which(x%%3==0)
temp3 = which(x%%3==0&x%%5==0)
x[temp2] = "fiz"
x[temp] = "buzz"
x[temp3] = "fizbuzz"
x

# Marie's modification
x <- as.character(1:100)
x[as.numeric(x)%%3==0&as.numeric(x)%%5==0] = "fizbuzz"
x[as.numeric(x)%%3==0] = "fiz"
x[as.numeric(x)%%5==0] = "buzz"
x

# classical loop answer
results <- data.frame(x = 1:100, fizzbuzz = rep(NA, length(x)))

for (i in 1:100) {
  if (i %% 15 == 0) {results$fizzbuzz[i] <- 'FizzBuzz'
  } else if (i %% 5 == 0) {results$fizzbuzz[i] <- 'Buzz'
  } else if (i %% 3 == 0) {results$fizzbuzz[i] <- 'Fizz'
  } else {results$fizzbuzz[i] <- i}
}
results

#' in general, if you can replace a loop with a simpler calculation, like matrix
#' math, you should do that instead. 2d matrix math is faster than for loops, 
#' but 3d matrix math is not. 

#' a population dynamics example
N0 <- 100                     # starting population size
M <- 0.2                      # natural mortality rate 
b <- 0.18                     # birth rate coeffiecient

time <- 100                   # total number of time steps

N <- array(rep(NA, time))     # initialize population size vector (only if you
                              # want to keep track of it over time)
N[1] <- N0                    # set population size at year 1

for (t in 2:time) {
  N[t] <- N[t-1]*exp(-1*M) + b*N[t-1]  # N is now N - deaths + births
}

N

#' Now, say you're more interested in the final population size after 100 time 
#' steps when there's some random variation in the birth rate...
N0 <- 100
M <- 0.2
b_mean <- 0.18
b_sd <- 0.05
time <- 100
reps <- 100
N_final <- array(rep(NA, reps))

for (i in 1:reps) {
  N <- N0
  for (t in 1:time) {
    N <- N*exp(-1*M) + N*rnorm(1, b_mean, b_sd)
  }
  N_final[i] <- N
}

N_final
prop_decline <- sum(N_final < N0)
prop_decline
prop_increase <- sum(N_final > N0)
prop_increase

#' and then, if you were curious, you could loop through different mean birth 
#' rates, or different standard deviations of birth rates, and see how that 
#' affects the proportion of the population that increases vs. declines, and 
#' so on and so forth