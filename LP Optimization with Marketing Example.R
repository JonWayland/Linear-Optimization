##################################################################
### This is a linear programming for optimization R program that 
### I created during grad school. Looking back, there's definitely
### a lot of room for improvement but for the time, it worked just
### fine. 
###
### This uses the 'Rglpk' package for linear programming 
### optimization and takes inputs: objective, constraints, right-
### hand side values of linear program, the direction of the 
### (in)equalities and whether it is a maximizing or minimizing
### problem.
##################################################################

### The inspiration for the example problem shown in the code below comes from the following site:
### http://www.marketingdistillery.com/2014/08/30/marketing-optimization-with-linear-programming/






# ***************************************************************
# Code written by Jon Wayland
# Spring of 2014
# ***************************************************************

library(Rglpk)
LE = "<="
GE = ">="
E = "=="
L = "<"
G = ">"
# ***************************************************************
# Type in the coefficients of the objective function variables
# seperated by commas inside the paranthesis ( for all variables)
# ***************************************************************
obj = c(0.09, 0.14, 0.1, 0.05 )
# ***************************************************************
# Remove the hashtag from the front of each constraint you
# are using. Type in the coefficients for each variable in the
# LP for each constraint separated by commas in the parenthesis
#****************************************************************
con1 = c(1,1,1,1 )
con2 = c(-0.6,0.4,0.4,-0.6 )
con3 = c(-0.2, -0.2, -0.2, 0.8 )
con4 = c(1, 0, 0, 0 )
con5 = c(0, 0, 0, 1 )
con6 = c(0, 1, 0, 0 )
con7 = c(0, 1, 0, 0 )
con8 = c(0, -3, 1, 0 )
con9 = c(2.5, 2.1, 0.9, 3.0 )
#con10 = c( )
#con11 = c( )
#con12 = c( )
#con13 = c( )
#con14 = c( )
#con15 = c( )
# ***************************************************************
# Remove the hashtag from the front depending on the
# number of constraints
# ***************************************************************
#mat = matrix(c(con1),nrow=1, byrow=TRUE)  # one constraint
#mat = matrix(c(con1, con2),nrow=2, byrow=TRUE) # two constraints
#mat = matrix(c(con1, con2, con3),nrow=3, byrow=TRUE) # three constraints
#mat = matrix(c(con1, con2, con3, con4),nrow=4, byrow=TRUE) # four constraints
#mat = matrix(c(con1, con2, con3, con4, con5),nrow=5, byrow=TRUE) # five constraints
#mat = matrix(c(con1, con2, con3, con4, con5, con6),nrow=6, byrow=TRUE) # six constraints
#mat = matrix(c(con1, con2, con3, con4, con5, con6, con7),nrow=7, byrow=TRUE) # seven constraints
#mat = matrix(c(con1, con2, con3, con4, con5, con6, con7, con8),nrow=8, byrow=TRUE) # eight constraints
mat = matrix(c(con1, con2, con3, con4, con5, con6, con7, con8, con9),nrow=9, byrow=TRUE) # nine constraints
#mat = matrix(c(con1, con2, con3, con4, con5, con6, con7, con8, con9, con10),nrow=10, byrow=TRUE) # ten constraints
#mat = matrix(c(con1, con2, con3, con4, con5, con6, con7, con8, con9, con10, con11),nrow=11, byrow=TRUE) # eleven constraints
#mat = matrix(c(con1, con2, con3, con4, con5, con6, con7, con8, con9, con10, con11, con12),nrow=12, byrow=TRUE) # twelve constraints
#mat = matrix(c(con1, con2, con3, con4, con5, con6, con7, con8, con9, con10, con11, con12, con13),nrow=13, byrow=TRUE) # thirteen constraints
#mat = matrix(c(con1, con2, con3, con4, con5, con6, con7, con8, con9, con10, con11, con12, con13, con14),nrow=14, byrow=TRUE) # fourteen constraints
#mat = matrix(c(con1, con2, con3, con4, con5, con6, con7, con8, con9, con10, con11, con12, con13, con14, con15),nrow=15, byrow=TRUE) # fifteen constraints
# ***************************************************************
# Type in the directions for each constraint by using LE for less 
# than or equal to, GE for greater than or equal to, E for equal 
# to, L for strictly less than and G for strictly greater than
# Put these in order of their constraint inside the parentheses
# separated by commas
dir = c(E,GE,LE,GE,GE,GE,LE,LE,E )
# ***************************************************************
# Type in the Right Hand Side values of the constraints inside of
# the parentheses separated by commas
rhs = c(1000000, 0,0,200000,80000,60000,220000,0,1300000 )
# ***************************************************************
# ***************************************************************
# Remove that hashtag for the type of optimization. FALSE represents
# a min problem and TRUE represents a max problem
# ***************************************************************
#max = max = FALSE
max = max = TRUE
# ***************************************************************
# The following will execute the linear program that you created. 
# The bounds is set to NULL indicating the variables are bounded 
# by zero and infinity. The types is set to NULL indicating that 
# our solution can be found using continuous parameters. If we want
# only integer solutions we type in "I" in the place of NULL for
# types. 
# ****************************************************************
Rglpk_solve_LP(obj, mat, dir, rhs, bounds=NULL, types= NULL, max)
