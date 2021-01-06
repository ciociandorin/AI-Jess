(deftemplate persoana
    (multislot nume)
    (slot culochi)
    (slot culpar)
    (slot nationalitate))

(assert(persoana(nume Julien Alaphilippe)(culochi verzi)(culpar saten)(nationalitate francez)))
(assert(persoana(nume Marcel Kittel)(culochi caprui)(culpar blond)(nationalitate german)))
(assert(persoana(nume Emmanuel Buchmann)(culochi albastrii)(culpar castaniu)(nationalitate german)))
(assert(persoana(nume Enric Mas)(culochi verzi)(culpar negru)(nationalitate spaniol)))
(assert(persoana(nume Richard Carapaz)(culochi aurii)(culpar rosu)(nationalitate ecuadorian)))
(assert(persoana(nume Thibaut Pinot)(culochi verzi)(culpar saten)(nationalitate francez)))
(assert(persoana(nume Patrick Konrad)(culochi albastrii)(culpar saten)(nationalitate german)))


(defrule specif1
    (persoana(nume $? ?n ?pn)(culochi verzi)(culpar saten)(nationalitate francez))
    =>
    (printout t "Persoana " ?n " " ?pn " are caracteristicile specificate la specif1." crlf)
)
(run)


/*
(defrule specif2
    (persoana (nume $? ?n ?pn)(culochi ?co)(culpar ?cp){
    	culochi != albastrii || culpar != negru
    })
    (not(persoana(nume ?n2 & ~?n ?pn2 & ~?pn)(culochi ?co)(culpar ?cp)))
    =>
    (printout t "Persoana " ?n " " ?pn " are caracteristicile specificate la specif2." crlf)
)
(run)


(defrule specif3
    (persoana (nume ?n1 ?pn1)(culochi ?co1)(culpar ?cp1)(nationalitate german){
		(culpar == saten || culochi == albastrii) && culpar != blond
	})
    (persoana (nume ?n2 ?pn2)(culochi ?co2 & verzi)(culpar ?cp2 & ?cp1)(nationalitate ?nt2))
    (test(or(eq ?cp1 saten)(not(eq ?co2 caprui)))) ;nu avem implicatie
    =>
    (printout t "Prima persoana, " ?n1 " " ?pn1 ", are ochi " ?co1 " par " ?cp1 " si este dupa nationalitate german" crlf)
    (printout t "A doua persoana, " ?n2 " " ?pn2 ", are ochi " ?co2 " par " ?cp2 " si este dupa nationalitate " ?nt2 crlf)
    
    )
(run)
*/


