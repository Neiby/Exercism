-module(raindrops).

-export([convert/1]).



convert(N) ->
    Opts = [{3, "Pling"}, {5, "Plang"}, {7, "Plong"}],
    Sounds = [Sound || {X, Sound} <- Opts, N rem X =:= 0 ],
    case Sounds of
        [] -> integer_to_list(N);
        _ -> lists:flatten(Sounds)
    end.
