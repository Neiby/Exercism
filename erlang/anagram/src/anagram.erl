-module(anagram).

-export([find_anagrams/2]).

lower(Word) -> string:lowercase(Word).
sort(List) -> lists:sort(List).

find_anagrams(Subject, Candidates) ->
    [A || A <- Candidates, sort(lower(A)) =:= sort(lower(Subject)) andalso lower(A) /= lower(Subject)].
