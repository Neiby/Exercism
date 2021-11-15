-module(triangle).

-export([kind/3]).


kind(A, B, C) when A =< 0; B =< 0; C =< 0 ->
    {error, "all side lengths must be positive"};
kind(A, B, C) when (A + B) < C orelse (A + C) < B orelse (B + C) < A -> 
    {error, "side lengths violate triangle inequality"};
kind(A, A, A) ->  equilateral;
kind(A, A, _) -> isosceles;
kind(A, _, A) -> isosceles;
kind(_, B, B) -> isosceles;
kind(_, _, _) -> scalene.

