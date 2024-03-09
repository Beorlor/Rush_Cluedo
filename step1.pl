% Definition of genders
homme(jean).
homme(marc).
homme(jules).
homme(leon).
homme(luc).
homme(loic).
homme(gerard).
homme(paul).
femme(anne).
femme(lisa).
femme(sylvie).
femme(betty).
femme(eve).
femme(valerie).
femme(julie).

% Definition of marital status
mari_de(marc, anne).
mari_de(jules, lisa).
mari_de(leon, sylvie).
mari_de(loic, eve).
mari_de(paul, julie).
mari_de(luc, betty).
femme_de(anne, marc).
femme_de(lisa, jules).
femme_de(sylvie, leon).
femme_de(eve, loic).
femme_de(julie, paul).
femme_de(betty, luc).

% Definition of parent-child relationships according to the corrected information
parent_de(marc, jean).
parent_de(anne, jean).
parent_de(marc, jules).
parent_de(anne, jules).
parent_de(marc, leon).
parent_de(anne, leon).
parent_de(luc, lisa).
parent_de(betty, lisa).
parent_de(luc, loic).
parent_de(betty, loic).
parent_de(luc, gerard).
parent_de(betty, gerard).
parent_de(jules, jacques).
parent_de(lisa, jacques).
parent_de(leon, herve).
parent_de(sylvie, herve).
parent_de(leon, julie).
parent_de(sylvie, julie).
parent_de(loic, paul).
parent_de(eve, paul).
parent_de(loic, valerie).
parent_de(eve, valerie).

% Definitions of in-law relationships based on the current knowledge
beaupere_de(BeauPere, Enfant) :- homme(BeauPere), mari_de(BeauPere, Mere), parent_de(Mere, Enfant).
bellemere_de(BelleMere, Enfant) :- femme(BelleMere), femme_de(BelleMere, Pere), parent_de(Pere, Enfant).

% Definition of the child relationship based on the current knowledge
enfant_de(Enfant, Parent) :- parent_de(Parent, Enfant).

% Definition of ancestors (recursive) based on the current knowledge
ancetre_de(Ancetre, Descendant) :- parent_de(Ancetre, Descendant).
ancetre_de(Ancetre, Descendant) :-
    parent_de(Ancetre, Intermediaire),
    ancetre_de(Intermediaire, Descendant).
