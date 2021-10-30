-module(strain).

-export([keep/2, discard/2]).

keep(_,[]) -> [];
keep(Fn, List) -> keep(Fn, List, []).

keep(_, [], Acc) -> lists:reverse(Acc);
keep(Fn, [X|Xs], Acc) ->
  case Fn(X) of
    true -> keep(Fn, Xs, [X|Acc]);
    false -> keep(Fn, Xs, Acc)
  end.

discard(_,[]) -> [];
discard(Fn, List) -> discard(Fn, List, []).

discard(_, [], Acc) -> lists:reverse(Acc);
discard(Fn, [X|Xs], Acc) ->
  case Fn(X) of
    false -> discard(Fn, Xs, [X|Acc]);
    true -> discard(Fn, Xs, Acc)
  end.
