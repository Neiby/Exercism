-module(hamming).

-export([distance/2]).


distance(Strand1, Strand2) -> 
    case length(Strand1) == length(Strand2) of
        true -> distance(Strand1, Strand2, 0);
        false -> {error, "left and right strands must be of equal length"}
    end.

distance([], _, Acc) -> Acc;
distance([X|Xs], [Y|Ys], Acc) ->
        case X =:= Y of
            true -> distance(Xs, Ys, Acc);
            false -> distance(Xs, Ys, Acc + 1)
        end.