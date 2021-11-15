-module(parallel_letter_frequency).

-export([dict/1]).

dict(Strings) ->
    List = lists:foldl(fun(X,Y) -> X ++ Y end, [], Strings),
    dict(List, #{}).

dict([H|T], X) when is_map_key(H, X) ->
    #{ H := N } = X,
    dict(T, X#{ H := N+1 });

dict([H|T], X) ->
    dict(T, X#{H => 1});

dict([], X) -> dict:from_list(maps:to_list(X)).