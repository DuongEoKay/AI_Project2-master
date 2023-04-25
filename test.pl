father(john, jim).
father(john, ann).
father(john, mary).
mother(jane, jim).
mother(jane, ann).
mother(jane, mary).
parent(X, Y) :- father(X, Y).
parent(X, Y) :- mother(X, Y).
