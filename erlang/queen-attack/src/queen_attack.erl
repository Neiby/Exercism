-module(queen_attack).

-export([can_attack/2]).


can_attack({X, _},{X, _}) -> true;
can_attack({_, Y}, {_, Y}) -> true;
can_attack({X1, Y1}, {X2, Y2}) ->
    case abs((X1 - X2) / (Y1 - Y2)) of
        1.0 -> true;
        _ -> false
    end. 
