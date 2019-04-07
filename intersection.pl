inter([], _, []).

inter([H1|T1], L2, [H1|Res]) :-
    member(H1, L2),
    inter(T1, L2, Res).

inter([_|T1], L2, Res) :-
    inter(T1, L2, Res).

test(X):-
        inter([1,3,5,2,4], [6,1,2], X).