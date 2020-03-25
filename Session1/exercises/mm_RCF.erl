-module(mm_RCF).
-export([mxm/2]).

mxm(M1, M2) -> mxm(M1,M2, []).
mxm([],_,Acc) -> Acc;
mxm([H|T],M2,Acc) ->
	mxm(T,M2,Acc++[mrc(H,M2)]).

%listWithHeadsOfEachListOfAList
lwh([H|T]) -> lwh([H|T], []).
lwh([], Acc) -> Acc;
lwh([H|T], Acc) when length(H)>0 ->
	lwh(T,Acc++[hd(H)]);
lwh([H|_], Acc) when length(H)==0 ->
	lwh([], Acc).

%removeHeadFromEachListOfAList
rh(M1) -> rh(M1, []).
rh([], Acc) -> Acc;
rh([H|T], Acc) when length(H)>0 ->
	rh(T,Acc++[H--[hd(H)]]);
rh([H|_], Acc) when length(H)==0 ->
	rh([],Acc).

%multiplyElements
me(V1, V2) -> me(V1,V2, 0).
me(_,[], Acc) -> Acc;
me([H1|T1],[H2|T2], Acc) ->
	me(T1,T2, Acc+H1*H2).

%multiplyRowByAllColumns
mrc(Row, Cols) -> mrc(Row, Cols, []).
mrc(_, [], Acc) -> Acc;
mrc(Row, Cols, Acc)  when length(hd(Cols))>0 ->
	mrc(Row, rh(Cols), Acc++[me(Row,lwh(Cols))]);
mrc(Row, Cols, Acc)  when length(hd(Cols))==0 ->
	mrc(Row,[], Acc).
