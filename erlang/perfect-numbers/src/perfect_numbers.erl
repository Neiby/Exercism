-module(perfect_numbers).

-export([classify/1]).



factors(N) -> factors(N, 2).

factors(X, X) -> [];
factors(N, Factor) when N rem Factor =:= 0 -> [Factor | factors(N, Factor + 1)];
factors(N, Factor) -> factors(N, Factor + 1).

classify(1) -> deficient;
classify(N) when N > 0 ->
    AllFactors = [1|factors(N)],
    Sums = lists:sum(AllFactors),
    if
        Sums =:= N -> perfect;
        Sums < N -> deficient;
        Sums > N -> abundant
    end.

