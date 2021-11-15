-module(series).

-export([slices/2]).


%% Take N elements from the start of a list
take(N, List) -> take(N, List, []).
take(0, _, Acc) -> lists:reverse(Acc);
take(N, [H|T], Acc) ->
    take(N - 1, T, [H|Acc]).

slices(SliceLength, Series) when SliceLength =< length(Series) -> 
    slices(SliceLength, Series, []).

slices(Slength, Series, Acc) when Slength > length(Series) -> lists:reverse(Acc);
slices(Slength, Series, Acc) ->
    Slice = take(Slength, Series),
    [_|Next] = Series,
    slices(Slength, Next, [Slice|Acc]).
