-module(difference_of_squares2).

-export([difference_of_squares/1, square_of_sum/1, sum_of_squares/1, sum/1]).

sum(L) -> sum(L, 0).
sum([], Acc) -> Acc;
sum([H|T], Acc) -> 
    sum(T, Acc + H).

square(X) -> X*X.

seq(N) -> seq(N, []).
seq(0, Acc) -> Acc;
seq(N, Acc) ->
    seq(N-1, [N|Acc]).

difference_of_squares(N) -> 
    Sum = sum_of_squares(N),
    Squared = square_of_sum(N),
    Squared - Sum.

square_of_sum(N) -> 
    Sum = sum(seq(N)),
    Sum * Sum.

sum_of_squares(N) -> 
    Squared = [square(X) || X <- seq(N)],
    sum(Squared).
