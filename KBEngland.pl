%Utility
not(P) :- P, !P, fail , true.
different(X, Y) :- X = Y, !, fail ; true.

%Rule
husband(Person,Wife):- (married(Person,Wife);married(Wife,Person)), male(Person).
wife(Person,Husband):- (married(Person,Husband);married(Husband,Person)), female(Person).
father(Parent,Child):- parent(Parent,Child), male(Parent).
mother(Parent,Child):- parent(Parent,Child), female(Parent).
child(Child,Parent):- parent(Parent,Child).
son(Child,Parent):- child(Child,Parent), male(Child).
daughter(Child,Parent):- child(Child,Parent), female(Child).
grandparent(GP,GC):- parent(GP,Parent), parent(Parent, GC).
grandmother(GM,GC):- grandparent(GM,GC), female(GM).
grandfather(GF,GC):- grandparent(GF,GC), male(GF).
grandchild(GC,GP):- grandparent(GP,GC).
grandson(GS,GP):- grandparent(GP,GS), male(GS).
granddaughter(GD,GP):- grandparent(GP,GD), female(GD).
sibling(Person1,Person2):- mother(Parent,Person1),mother(Parent,Person2), different(Person1,Person2).
brother(Person,Sibling):- sibling(Person,Sibling), male(Person).
sister(Person,Sibling):- sibling(Person,Sibling), female(Person).
aunt(Person,NieceNephew):- child(NieceNephew,Parent), (sibling(Person,Parent);sibling(Uncle,Parent), married(Uncle,Person)), female(Person).
uncle(Person,NieceNephew):- child(NieceNephew,Parent), (sibling(Person,Parent);sibling(Aunt,Parent), married(Person,Aunt)), male(Person).
niece(Person,AuntUncle):- (aunt(AuntUncle,Person);uncle(AuntUncle,Person)), female(Person).
nephew(Person,AuntUncle):- (aunt(AuntUncle,Person);uncle(AuntUncle,Person)), male(Person).

%KB
%Queen Elizabeth II
married(prince_phillip,queen_elizabeth_II).
female(queen_elizabeth_II).
parent(queen_elizabeth_II,prince_charles).
parent(queen_elizabeth_II,princess_annie).
parent(queen_elizabeth_II,prince_andrew).
parent(queen_elizabeth_II,prince_edward).
male(prince_phillip).
parent(prince_phillip,prince_charles).
parent(prince_phillip,princess_annie).
parent(prince_phillip,prince_andrew).
parent(prince_phillip,prince_edward).

%%Prince Charles
male(prince_charles).
female(princess_diana).
female(camilla_parker_bowler).
married(prince_charles,camilla_parker_bowler).
divorced(prince_charles,princess_diana).
parent(prince_charles,prince_william).
parent(prince_charles,prince_harry).
parent(princess_diana,prince_william).
parent(princess_diana,prince_harry).

%%%Prince Harry
male(prince_harry).

%%%Prince William
male(prince_william).
male(prince_george).
female(princess_charlotte).
female(kate_middleton).
married(prince_william,kate_middleton).
parent(prince_william,prince_george).
parent(prince_william,princess_charlotte).
parent(kate_middleton,prince_george).
parent(kate_middleton,princess_charlotte).

%%Princess Annie
female(princess_annie).
male(captain_mark_phillips).
male(timothy_laurence).
divorced(princess_annie,captain_mark_phillips).
married(timothy_laurence,princess_annie).
parent(princess_annie,peter_phillips).
parent(princess_annie,zara_phillips).
parent(captain_mark_phillips,peter_phillips).
parent(captain_mark_phillips,zara_phillips).

%%%Peter Phillips
male(peter_phillips).
female(autumn_kelly).
female(savannah_phillips).
female(isla_phillips).
married(peter_phillips,autumn_kelly).
parent(peter_phillips,savannah_phillips).
parent(peter_phillips,isla_phillips).
parent(autumn_kelly,savannah_phillips).
parent(autumn_kelly,isla_phillips).

%%%Zara Phillips
female(zara_phillips).
male(mike_tindall).
female(mia_grace_tindall).
married(mike_tindall,zara_phillips).
parent(zara_phillips,mia_grace_tindall).
parent(mike_tindall,mia_grace_tindall).

%%Prince Andrew
male(prince_andrew).
female(sarah_ferguson).
female(princess_beatrice).
female(princess_eugenie).
divorced(prince_andrew,sarah_ferguson).
parent(prince_andrew,princess_beatrice).
parent(prince_andrew,princess_eugenie).
parent(sarah_ferguson,princess_beatrice).
parent(sarah_ferguson,princess_eugenie).

%%Prince Edward
male(prince_edward).
female(sophie_rhys-jones).
male(james_viscount_serven).
female(lady_louise_mountbatten-winsor).
married(prince_edward,sophie_rhys-jones).
parent(prince_edward,james_viscount_serven).
parent(prince_edward,lady_louise_mountbatten-winsor).
parent(sophie_rhys-jones,james_viscount_serven).
parent(sophie_rhys-jones,lady_louise_mountbatten-winsor).


