-module(rna_transcription).

-export([to_rna/1]).

to_rna([]) -> [];
to_rna(Strand) ->
    RNAmap = dict:from_list([{"G", "C"}, {"C", "G"}, {"T", "A"}, {"A", "U"}]),
    io:format("~p~n", [dict:fetch_keys(RNAmap)]),
    Result = [dict:fetch([X],RNAmap) || X <- Strand],
    lists:flatten(Result).
