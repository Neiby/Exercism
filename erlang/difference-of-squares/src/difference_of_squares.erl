-module(difference_of_squares).

-export([difference_of_squares/1, square_of_sum/1, sum_of_squares/1]).

sum(X) -> lists:sum(X).
square(X) -> X*X.

difference_of_squares(N) -> 
    Sum = sum_of_squares(N),
    Squared = square_of_sum(N),
    Squared - Sum.

square_of_sum(N) -> 
    Sum = lists:sum(lists:seq(1,N)),
    Sum * Sum.

sum_of_squares(N) -> 
    Squared = [square(X) || X <- lists:seq(1,N)],
    sum(Squared).
