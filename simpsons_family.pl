% ARTI 303 - Lab 5
% Simpsons Family Tree

% Gender facts

male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

% Parent facts

parent(abraham, herb).
parent(mona, herb).

parent(abraham, homer).
parent(mona, homer).

parent(clancy, marge).
parent(jackie, marge).

parent(clancy, patty).
parent(jackie, patty).

parent(clancy, selma).
parent(jackie, selma).

parent(homer, bart).
parent(marge, bart).

parent(homer, lisa).
parent(marge, lisa).

parent(homer, maggie).
parent(marge, maggie).

parent(selma, ling).

% Father
father(X, Y) :-
    parent(X, Y),
    male(X).

% Mother
mother(X, Y) :-
    parent(X, Y),
    female(X).

% Son
son(X, Y) :-
    parent(Y, X),
    male(X).

% Daughter
daughter(X, Y) :-
    parent(Y, X),
    female(X).

% Brother
brother(X, Y) :-
    parent(P, X),
    parent(P, Y),
    male(X),
    X \= Y.

% Sister
sister(X, Y) :-
    parent(P, X),
    parent(P, Y),
    female(X),
    X \= Y.

% Grandfather
grandfather(X, Y) :-
    parent(X, Z),
    parent(Z, Y),
    male(X).

% Aunt
aunt(X, Y) :-
    sister(X, P),
    parent(P, Y).

% Uncle
uncle(X, Y) :-
    brother(X, P),
    parent(P, Y).

% Cousin
cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    P1 \= P2,
    (
        brother(P1, P2)
        ;
        sister(P1, P2)
    ),
    X \= Y.

% Ancestor - base case
ancestor(X, Y) :-
    parent(X, Y).

% Ancestor - recursive case
ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).