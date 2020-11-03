### fizzbuzz solves the classical FizzBuzz problem for any number of values and
### for any two divisors

#' if you want to set default values, set the parameters equal to a value in 
#' first line where you define the function
fizzbuzz <- function(n = 100, divisor1 = 3, divisor2 = 5) {
  
  if(is.numeric(n) == FALSE) {stop('n must be numeric')}
  if(is.numeric(divisor1) == FALSE) {stop('divisor1 must be numeric')}
  if(is.numeric(divisor2) == FALSE) {stop('divisor2 must be numeric')}
  if(length(n) > 1) {stop('n must be a single value')}
  if(length(divisor1) > 1) {stop('divisor1 must be a single value')}
  if(length(divisor2) > 1) {stop('divisor2 must be a single value')}
  
  stopifnot(is.numeric(n), length(n) == 1)
  stopifnot(is.numeric(divisor1), length(divisor1) == 1)
  stopifnot(is.numeric(divisor2), length(divisor2) == 1)
  
  
  results <- data.frame(X = 1:n, FizzBuzz = rep(NA, n))
  
  for (i in 1:n) {
    if (i %% (divisor1*divisor2) == 0) {
      results$FizzBuzz[i] <- 'FizzBuzz'
    } else if (i %% divisor2 == 0) {
      results$FizzBuzz[i] <- 'Buzz'
    } else if (i %% divisor1 == 0) {
      results$FizzBuzz[i] <- 'Fizz'
    } else {
      results$FizzBuzz[i] <- i
    }
  }
  
  #' make sure that you've replaced all instances of hard numbers with the 
  #' appropriate variables named in the function inputs/arguments
  
  return(results)
  #' always make sure to return whatever it was you wanted your function to make
  
}

#' general notes from Hadley Wickham's chapter on functions: 
#' https://r4ds.had.co.nz/functions.html
#' 
#' you should name the R file the same as the function name, to reduce confusion
#' make sure the function name isn't the name of a function that already exists
#'      in R
#' make the function name clear (usually a verb) so you remember what it does
#' if you make a few functions with similar outputs, give them a family name 
#'      that comes first, so autofill can help you remember which one you want
#' ALWAYS COMMENT YOUR CODE
#' separate long chunks of code with visual aids - lines of ==== or ---- or ####
#'      I like #### personally because then you can fold up your code as well
#' R doesn't care about spacing, but it makes the code more readable and easier 
#'      to understand and troubleshoot - go here to have RStudio do it for you:
#'      > Code > Reindent Lines 
#' default input/argument values should be the most common ones