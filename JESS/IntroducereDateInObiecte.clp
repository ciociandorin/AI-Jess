/*(deftemplate Animal(slot specie)(slot inaltime)) */
/*si cu deffacts fa*/

/*
(assert(Animal(specie soarece)(inaltime 10)))
(assert(Animal(specie veverita)(inaltime 20)))
(assert(Animal(specie pisica)(inaltime 35)))
(assert(Animal(specie vaca)(inaltime 125)))
(assert(Animal(specie elefant)(inaltime 405)))

(facts)
*/

(deftemplate arca(slot specie)(slot gen)(slot inaltime))
(foreach ?s (create$ soarece veverita pisica caine vaca elefant)
    (foreach ?g (create$ M F)
    	(printout t "Animalul  " ?s " de genul " ?g "are inaltimea ")
        (bind ?i (read))
        (assert(arca(specie ?s)(gen ?g)(inaltime ?i)))    
        
    )
)	    
(defrule afisare
        ?in <- (arca(specie ?s)(gen ?g)(inaltime ?i))
        =>
        (printout t ?in.specie ", " ?in.gen ", " ?in.inaltime crlf)
    )
(run)