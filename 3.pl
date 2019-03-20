use_module(library(lists)).

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

lists_of_length([], N, Lists, Result) :-
    Result = Lists.
lists_of_length([X|Y], N, Lists, Result) :-
    (length(X, M), M == N) -> lists_of_length(Y, N, [X|Lists], Result); lists_of_length(Y, N, Lists, Result).

longest_paths(From, To, Graph, Paths) :-
    findall(
        Path, 
        path(From, To, Graph, [], Path),
        Paths),
    % Get the length of the longest Path
    max_member(Max, Paths), length(Max, N),
    % Get all paths of longest length
    lists_of_length(Paths, N, [], Result),
    write(Result).
    
