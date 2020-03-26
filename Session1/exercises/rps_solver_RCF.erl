-module(rps_solver_RCF).
-export([rps/2]).

rps([H1|T1],[H2|T2]) when length([H1|T1]) =:= length([H2|T2]) -> rps([H1|T1], 0, [H2|T2], 0);
rps([H1|T1],[H2|T2]) when length([H1|T1]) =/= length([H2|T2]) -> io:format("Input length must match!~n").


rps([], Acc1, [], Acc2) ->
	case Acc1 == Acc2 of
		true -> io:format("Draw! ~p:~p~n", [Acc1, Acc2]);
		false when Acc1 > Acc2 -> io:format("Winner is Player1 with a score of ~p:~p~n", [Acc1,Acc2]); 	
	    false when Acc1 < Acc2 -> io:format("Winner is Player2 with a score of ~p:~p~n", [Acc1,Acc2])
	end;
rps([H1|T1], Acc1, [H2|T2], Acc2) when H1 =:= paper,     H2 =:= rock     -> rps(T1, Acc1+1, T2, Acc2);
rps([H1|T1], Acc1, [H2|T2], Acc2) when H1 =:= paper,     H2 =:= paper    -> rps(T1, Acc1+1, T2, Acc2+1);
rps([H1|T1], Acc1, [H2|T2], Acc2) when H1 =:= paper,     H2 =:= scissors -> rps(T1, Acc1, T2, Acc2+1);
rps([H1|T1], Acc1, [H2|T2], Acc2) when H1 =:= rock ,     H2 =:= rock     -> rps(T1, Acc1+1, T2, Acc2+1);
rps([H1|T1], Acc1, [H2|T2], Acc2) when H1 =:= rock ,     H2 =:= paper    -> rps(T1, Acc1, T2, Acc2+1);
rps([H1|T1], Acc1, [H2|T2], Acc2) when H1 =:= rock ,     H2 =:= scissors -> rps(T1, Acc1+1, T2, Acc2);
rps([H1|T1], Acc1, [H2|T2], Acc2) when H1 =:= scissors , H2 =:= rock     -> rps(T1, Acc1, T2, Acc2+1);
rps([H1|T1], Acc1, [H2|T2], Acc2) when H1 =:= scissors , H2 =:= paper    -> rps(T1, Acc1+1, T2, Acc2);
rps([H1|T1], Acc1, [H2|T2], Acc2) when H1 =:= scissors , H2 =:= scissors -> rps(T1, Acc1+1, T2, Acc2+1).