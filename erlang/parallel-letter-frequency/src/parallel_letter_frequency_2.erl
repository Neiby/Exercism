-module(parallel_letter_frequency_2).

-export([dict/1]).

%% Spawn loop function and iterate over list of strings, sending one
%% at a time to the loop process. Finally, signal to loop process that
%% we are done and wait for the resulting dict to arrive
dict(Strings) ->
    Pid = spawn(fun loop/0),
    lists:foreach(fun(Str) -> Pid ! {string, Str} end, Strings),
    Pid ! {done, self()},
    receive
        Frequencies -> Frequencies
    end.

%% Initialize loop with new map
loop() -> loop(#{}).

%% Upon receipt of each string from the main program, send it to
%% frequency/2 to update running count of letter frequency. When
%% completed, convert the map to a dict, since Exercism tests expect
%% a dict.
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