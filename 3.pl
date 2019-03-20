% is the first argument a member of the second argument.
member(X, [X|_]).
member(X, [_|Y]) :-
    member(X,Y).

% Is the first argument an subset of the second argument.
subset([],L).
subset([X|L1],L) :-
    member(X, L),
    subset(L1,L).

path(X, X, Graph, Visited, Path) :-
    % We need to reverse the list as we append to the front.
    reverse(Path, [X|Visited]).
path(From, To, Graph, Visited, Path) :-
    % Networks is bi-directional so we need the disjuntion.
    (member(edge(From, X), Graph); member(edge(X, From), Graph)),
    % We want to use an edge at most 1 time.
    not(member(X, Visited)),
    % Recursion into the next node.
    path(X, To, Graph, [From|Visited], Path).  
    
      