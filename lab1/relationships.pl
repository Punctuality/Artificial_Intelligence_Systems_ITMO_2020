% DICTIONARY

% Gender

% First gen males
male(pronin_alexander_ivanovich).
male(plusin_alexander).

% Second gen males
male(fedorov_nicholai).
male(utkin_grigory).
male(pronin_alexander_alexandrovich).

% Third gen males
male(fedorov_sergey_nicholaevich).
male(frolov_valeriy).
male(kasheev_victor).

% Forth gen males
male(pevtsov_evgeniy).
male(fedorov_denis).
male(krasulin_pavel).

% Fitfh gen males
male(fedorov_sergey_denisovich).
male(frolov_alexander).

% First gen females
female(ermolaeva_nina).
female(pronina_anna).
female(plusina_anastasia).

% Second gen females
female(fedorova_lidiya).
female(platonova_tamara).
female(pronina_militina).

% Third gen females
female(fedorova_lybov).
female(frolova_nadezhda).
female(frolova_larisa).

% Forth gen females
female(fedorova_daria).
female(fedorova_natalia).
female(frolova_anna).
female(kasheeva_ekaterina).

% Fitfh gen females
female(fedorova_tatiana).

% Marriage relationships

% First gen
spouse_(pronina_anna, pronin_alexander_ivanovich).
spouse_(plusina_anastasia, plusin_alexander).

% Second gen
spouse_(fedorov_nicholai, fedorova_lidiya).
spouse_(utkin_grigory, platonova_tamara).
spouse_(pronin_alexander_alexandrovich, pronina_militina).

% Third gen
spouse_(fedorov_sergey_nicholaevich, fedorova_lybov).
spouse_(frolova_nadezhda, frolov_valeriy).
spouse_(frolova_larisa, kasheev_victor).

% Forth gen
spouse_(pevtsov_evgeniy, fedorova_daria).
spouse_(fedorov_denis, fedorova_natalia).
spouse_(frolova_anna, krasulin_pavel) :- !.

% Function
spouse_to(X, Y) :- spouse_(X, Y).
spouse_to(X, Y) :- spouse_(Y, X).

spouse(X) :- spouse(X, _).

% Parental relationships

% First gen
parent_(ermolaeva_nina, utkin_grigory).
parent_(pronina_anna, pronin_alexander_alexandrovich).
parent_(plusina_anastasia, pronina_militina).

% Second gen
parent_(fedorova_lidiya, fedorov_sergey_nicholaevich).
parent_(platonova_tamara, fedorova_lybov).
parent_(pronina_militina, frolova_nadezhda).
parent_(pronina_militina, frolova_larisa).

% Third gen
parent_(fedorova_lybov, fedorov_denis).
parent_(fedorova_lybov, fedorov_daria).
parent_(frolova_nadezhda, fedorova_natalia).
parent_(frolova_nadezhda, frolova_anna).
parent_(frolova_larisa, kasheeva_ekaterina).

% Forth gen
parent_(fedorova_natalia, fedorov_sergey_denisovich).
parent_(fedorova_natalia, fedorova_tatiana).
parent_(frolova_anna, frolov_alexander) :- !.

% Function
parent_to(X, Y) :- parent_(X, Y).
parent_to(X, Y) :- spouse_to(X, Z), parent_(Z, Y).

parent(X) :- parent_to(X, _).

% OTHER RULES

husband_to(X, Y) :- male(X), spouse_to(X, Y).
husband(X) :- husband_to(X, _).

wife_to(X, Y) :- female(X), spouse_to(X, Y).
wife(X) :- wife_to(X, _).

father_to(X, Y) :- male(X), parent_to(X, Y).
father(X) :- father_to(X, _).

mother_to(X, Y) :- female(X), parent_to(X, Y).
mother(X) :- mother_to(X, _).

sibling_to(X, Y) :- parent_to(Z, X), parent_to(Z, Y), X \= Y.

brother_to(X, Y) :- male(X), sibling_to(X, Y).
brother(X) :- brother_to(X, _).

sister_to(X, Y) :- female(X), sibling_to(X, Y).
sister(X) :- sister_to(X, _).

grandparent_to(X, Y) :- parent_to(Z, Y), parent_to(X, Z).
grandparent(X) :- grandparent_to(X, _).

grandfather_to(X, Y) :- male(X), grandparent_to(X, Y).
grandfather(X) :- grandfather_to(X, _).

grandmother_to(X, Y) :- female(X), grandparent_to(X, Y).
grandmother(X) :- grandmother_to(X, _).

ancestor_to(X, Y) :- parent_to(X, Y).
ancestor_to(X, Y) :- parent_to(X, Z), related_to(Z, Y).

cousin_to(X, Y) :- parent_to(Z1, X), sibling_to(Z1, Z2), parent_to(Z2, Y).
cousin(X) :- cousin_to(X, _).
