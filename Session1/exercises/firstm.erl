-module(firstm).

-export([add/2, add/3, remove_duplicates/1, index/2]).

add(A, B) ->
    A + B.

add(A, B, C) ->
    A + B + C.

remove_duplicates([]) ->
    [];

remove_duplicates([H|T]) ->
    [H | [ X || X <- remove_duplicates(T), H =/= X]].


index(X, L) -> index(X, L, 1).

index(X, [X|_], I) -> I;

index(X, [_|Tl], I) -> index(X, Tl, I+1).