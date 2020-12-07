(assert(numar 0)(numar 1)(numar 3)(numar 4)(numar 5)(numar 6)(nuamr 7)(nuamr 8)(numar 9)
    (litera S)(litera E)(litera N)(litera D)(litera M)(litera O)(litera R)(litera Y))

(deftemplate asociere(slot litera(type SYMBOL))(slot numar(type INTEGER)))

(defrule generare-asociere (numar ?n)(litera ?l)
    =>
    (assert(asociere(litera ?l)(numar ?n))))

(defrule solutie
    (asociere(litera M)(numar ?m&:(= ?m 1)))
    (asociere(litera O)(numar ?o&:(= ?o 0)))
    (asociere(litera S)(numar ?s&:(= ?s 9)))
    (asociere(litera D)(numar ?d&~?s&~?o&~?m))
    (asociere(litera E)(numar ?e&~?d&~?s&~?o&~?m))
    (asociere(litera Y)(numar ?m&~?e&~?d&~?s&~?o&~?m&:(=(mod (+ ?d ?e) 10) ?y)))
    (asociere(litera N)(numar ?y&~?m&~?e&~?d&~?s&~?o&~?m&:(= (+ ?e 1) ?n)))
    (asociere(litera R)(numar ?n&~?y&~?m&~?e&~?d&~?s&~?o&~?m&:(= (mod (+ ?n ?r 1)(/ (+ ?d ?e) 10) 10) ?e)))
    
    =>
    
    (printout t " " ?s ?e ?n ?d crlf)
    (printout t " " ?m ?o ?r ?e crlf)
    (printout t " " ?m ?o ?n ?e ?y crlf)
    )

(run)