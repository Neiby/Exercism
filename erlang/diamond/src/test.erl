-module(test).
-export([test/1]).


test(L) -> test( L, #{} ).

test([H|T], X) when is_map_key(X, H) ->
    #{ H := N } = X,
    test(T, X#{ H := N+1 });

test([H|T], X) ->
    test(T, X#{H => 1});

test([], X) -> maps:to_list(X).