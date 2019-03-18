element([]).
element([X|Y]) :-
	write(X),
	element(Y).
