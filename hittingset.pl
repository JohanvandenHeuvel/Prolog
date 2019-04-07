use_module(library(lists)).

% Is the first argument an subset of the second argument.
subset([],L).
subset([X|L1],L) :-
    member(X, L),
    subset(L1,L).




% Is there a non-empty intersection between two lists.
nonemptyintersection(X, []).
nonemptyintersection(X, [L1|L2]) :-
    % Either X is a member of L1, or Y has a non-empty intersection with L1
    (member(X, L1); nonemptyintersection(Y,[L1|L2])),
    % Continue for the rest of the set
    nonemptyintersection([X|Y], L2).

% Get list from L that doesn't intersect with X
emptyintersection(X, [Y|L], Result) :-
    nonemptyintersection(X, Y) 
    -> 
    emptyintersection(X, L, Result); Result = Y.

% Is hitting set if it has a non-empty intersection with all conflictsets
hittingset(X, []).
hittingset(X, [A|B]) :-
    nonemptyintersection(X, A),
    hittingset(X, B).

makeNodes([X|Y], F, Result) :-
    % Do X
    (% Is the Node X a hitting set?
    hittingset(X, F)
    ->
    % Node X is completed
    Result = X; 
    % Node X needs to be expanded more
    emptyintersection(X, F, Z), makeNodes([X|Z], F, Result)),
    % Do Y
    makeNodes(Y, F, Result).

makeHittingTree(F) :-
    % Get the smallest list from F
    min_member(Min, F), 
    makeNodes(Min, F, Result).





