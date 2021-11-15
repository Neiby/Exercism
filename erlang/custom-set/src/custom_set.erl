-module(custom_set).

-export([add/2, contains/2, difference/2, disjoint/2, empty/1, equal/2, from_list/1, intersection/2, subset/2,
	 union/2]).


add(Elem, Set) -> 
	Test = lists:member(Elem, Set),
	case Test of
		true -> Set;
		false -> lists:sort([Elem|Set])
	end.

contains(Elem, Set) -> lists:member(Elem, Set).

difference(Set1, Set2) ->
	Test = fun(X) -> not lists:member(X, Set2) end,
	lists:sort(lists:filter(Test, Set1)).

disjoint(_, []) -> true;
disjoint(Set1, [H|T]) ->
	Test = lists:member(H, Set1),
	case Test of
		true -> false;
		false -> disjoint(Set1, T)
	end.

empty([]) -> true;
empty(_) -> false.

equal(Set1, Set2) -> lists:sort(Set1) =:= lists:sort(Set2).

from_list(List) -> lists:sort(List).

intersection(Set1, Set2) ->
	Test = fun(X) -> lists:member(X, Set2) end,
	lists:sort(lists:filter(Test, Set1)).


subset([],[]) -> true;
subset([],_) -> true;
subset(_,[]) -> false;
subset(Set1, Set2) ->
	intersection(Set1, Set2) =:= Set1 orelse intersection(Set2, Set1) =:= Set2.

union(Set1, []) -> lists:sort(Set1);
union(Set1, [H|T]) -> union(add(H,Set1), T).
