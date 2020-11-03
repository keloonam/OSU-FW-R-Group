### FW R Group Meeting 11/2/2020 3 pm
### Victoria Quennessen
### If statements and Loops

#' let's start with our 'fizzbuzz example'
#' common coding question in interviews (i.e. do you know how to logic?)
#'    "Write a program that prints the numbers from 1 to 100. But for multiples 
#'    of three print "Fizz" instead of the number and for the multiples of five 
#'    print "Buzz". For numbers which are multiples of both three and five print 
#'    "FizzBuzz". 
#' You can write a loop to go through and solve it like so:

#' this just initializes a dataframe, so that I can keep track of both inputs
#' and outputs
results <- data.frame(x = 1:100, fizzbuzz = rep(NA, length(x)))

#' then, I iterate through each value (1 through 100), test what it's divisible
#' by, and replace the number with a "FizzBuzz", "Fizz", or "Buzz" as needed
for (i in 1:100) {
  if (i %% 15 == 0) {
    results$fizzbuzz[i] <- 'FizzBuzz'
  } else if (i %% 5 == 0) {
    results$fizzbuzz[i] <- 'Buzz'
  } else if (i %% 3 == 0) {
    results$fizzbuzz[i] <- 'Fizz'
  } else {
    results$fizzbuzz[i] <- i
  }
}

#' then, I have it spit out my dataframe again to check my results
results

#' but what if you want to iterate over more values, or produce "fizz"es and 
#' "buzz"es for different divisors? Then instead of going through and copying 
#' and pasting the loop every time, it makes more sense to write a function. 
#' you could technically write the function inside another script, but then if 
#' you clear your environment while troublshooting, you have to make sure to go 
#' back and run it everytime, so it's easier (and better form) to write it in 
#' its own separate script.
#' 
#' note that the general form for a function is as follows:
#' function_name <- function(parameter1, parameter2, parameter3) {
#'      do some code with parameter1, parameter2, parameter3
#'      calculate some output
#'      return(output)
#' }
#' 
#' create function script (no default parameters, error handling)
#' 
#' Once you've made your function in another script, call it using the source()
#' function. Make sure your working directory is set to the correct location. 

setwd('C://Users/Vic/Box/White Lab Meetings/R tutorials')
source("fizzbuzz.R")

#' note that the function won't work without all the input arguments unless 
#' you've set default values
fizzbuzz()
fizzbuzz(n = 50)
fizzbuzz(divisor1 = 4)
fizzbuzz(divisor2 = 7)

fizzbuzz(divisor1 = 2, divisor2 = 5)
fizzbuzz(n = 50, divisor1 = 4, divisor2 = 5)

#' the really nice part about using functions is that if it doesn't work for 
#' some reason, you only have to troubleshoot / fix the issue in a single spot.
#' what happens if we give non-numerical arguments to fizzbuzz()?

fizzbuzz(n = 'a', divisor1 = c(1, 2, 3), divisor2 = TRUE)
#' we get an error message that isn't super clear. We can add our own error 
#' messages to avoid this mess! This is especially useful if you've written the 
#' function but want other people to be able to use it
#' 
#' add in error handling
#' remember to re-source the function
source('fizzbuzz.R')
fizzbuzz(n = 'a', divisor1 = c(1, 2, 3), divisor2 = TRUE)
fizzbuzz(n = 100, divisor1 = c(1, 2, 3), divisor2 = TRUE)
fizzbuzz(n = 100, divisor1 = c(1, 2, 3), divisor2 = 7)

#' notice here that the second argument being a vector doesn't trigger the error 
#' handling because it's numeric and it gives a less clear error message
#' now, let's go back in to add in error handling for argument lengths
#' remember to re-source the function when you come back
source('fizzbuzz.R')
fizzbuzz(n = 100, divisor1 = c(1, 2, 3), divisor2 = 7)
fizzbuzz(n = 100, divisor1 = 3, divisor2 = 7)

#' other useful arguments/inputs to use
#' if you're not sure how many variables you'll take each time, can use '...'
#' check out ?sum to see an example, or here's one from Wickham's book:

commas <- function(...) {
  stringr::str_c(..., collapse = ", ")
}

commas(letters[1:10])
