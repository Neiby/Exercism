-module(parallel_letter_frequency_2).

-export([dict/1]).

dict(Strings) ->
    Pid = spawn(fun loop/0),
    lists:foreach(fun(Str) -> Pid ! {string, Str} end, Strings),
    Pid ! {done, self()},
    receive
        Frequencies -> Frequencies
    end.

loop() -> loop(#{}).

loop(Dict) -> 
    receive
        {string, String} -> 
            NewDict = frequency(String, Dict),
            loop(NewDict);
        {done, SenderPid} -> 
            SenderPid ! dict:from_list(maps:to_list(Dict))
    end.

frequency([H|T], X) when is_map_key(H, X) ->
    #{ H := N } = X,
    frequency(T, X#{ H := N+1 });

frequency([H|T], X) ->
    frequency(T, X#{H => 1});

frequency([], Dict) -> Dict.