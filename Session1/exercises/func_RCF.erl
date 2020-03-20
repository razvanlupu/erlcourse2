-module(func_RCF).

-compile(export_all).

remove_duplicates([]) -> [];
remove_duplicates([H|T]) ->
	[H | [X || X<-remove_duplicates(T), H=/=X]].


first_not_duplicate([]) -> [];
first_not_duplicate(X) ->
	Y = remove_duplicates(X) -- X -- remove_duplicates(X),
	{hd(Y), index(hd(Y), X)}.

index(X, L) -> index(X, L , 1).
index(X, [X|_], I) -> I;
index(X, [_|T], I) -> index(X, T, I+1).
	