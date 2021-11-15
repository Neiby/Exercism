-module(diamond).

-export([rows/1]).

spc(X) -> lists:duplicate(X, 32).

rows([L]) -> 
    First = rows($A, L - $A, 0),
    Second = build_reverse(First),
    First ++ Second.

rows($A, 0, _J) -> [[$A]];
rows(L, 0, J) -> [[L|spc(J)] ++ [L]];

rows($A, I, J) when I > 0 ->
    [spc(I) ++ [$A|spc(J)] ++ spc(I)] ++ rows($A+1, I-1, J+1);
rows(L, I, J) -> 
    [spc(I) ++ [L|spc(J)] ++ [L|spc(I)]] ++ rows(L+1, I-1, J+2).

%% Reverse the previous results, ignoring the last (largest) element
build_reverse(L) -> build_reverse(L, []).

build_reverse([_], Acc) -> Acc;
build_reverse([A,B|Rest], Acc) ->
    build_reverse([B|Rest], [A|Acc]).

