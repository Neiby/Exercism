-module(ip).
-export([dots_to_commas/1, ip_to_binary/1]).


no_dots(X) ->
    case X of
        $. -> $,;
        _ -> X
    end.

dots_to_commas(Ip) ->
    [no_dots(X) || X <- Ip].

ip_to_binary(Ip) ->
    list_to_binary(dots_to_commas(Ip)).