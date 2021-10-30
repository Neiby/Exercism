-module(true).
-export([qsort/1]).

qsort([]) -> [];
qsort([Pivot|Rest]) ->
    qsort([Smaller || Smaller <- Rest, Smaller =< Pivot])
    ++ [Pivot] ++
    qsort([Larger || Larger <- Rest, Larger >= Pivot]).