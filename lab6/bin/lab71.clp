(deftemplate animal
    (slot nume)
    (slot inaltime)
    (slot gen)
)

(assert(animal(nume soarece)(inaltime 1)(gen masculin)))
(assert(animal(nume soarece)(inaltime 1)(gen feminin)))
(assert(animal(nume veverita)(inaltime 2)(gen masculin)))
(assert(animal(nume veverita)(inaltime 2)(gen feminin)))
(assert(animal(nume pisica)(inaltime 3)(gen masculin)))
(assert(animal(nume pisica)(inaltime 3)(gen feminin)))
(assert(animal(nume caine)(inaltime 4)(gen masculin)))
(assert(animal(nume caine)(inaltime 4)(gen feminin)))
(assert(animal(nume vaca)(inaltime 5)(gen masculin)))
(assert(animal(nume vaca)(inaltime 5)(gen feminin)))
(assert(animal(nume elefant)(inaltime 6)(gen masculin)))
(assert(animal(nume elefant)(inaltime 6)(gen feminin)))

(reset)
(facts)

(defrule afisare
    (Anima))

