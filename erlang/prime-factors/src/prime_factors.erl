-module(prime_factors).

-export([factors/1]).


factors(1) -> [];
factors(2) -> [2];
factors(3) -> [3];
factors(Value) -> factors(Value, [], 2).

factors(Value, Acc, Current) when Value =:= Current -> lists:reverse([Current|Acc]);
factors(Value, Acc, Current) when Value rem Current =:= 0 ->
    factors(Value div Current, [Current|Acc], Current);

factors(Value, Acc, Current) when Value rem Current /= 0 ->
    if
        Current =:= 2 -> factors(Value, Acc, 3);
        Current >= 3 -> factors(Value, Acc, Current + 2)
    end.

