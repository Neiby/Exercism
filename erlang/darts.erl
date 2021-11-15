-module(darts).

-export([score/2]).


score(X, Y) -> 
    case Target = (X*X) + (Y*Y) of
        Target when Target =< 1 -> 10;
        Target when Target =< 25 -> 5;
        Target when Target =< 100 -> 1;
        _ -> "Missed target"
    end.
