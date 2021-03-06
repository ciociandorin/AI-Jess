(assert(cifra 0)(cifra 1)(cifra 2)(cifra 3)(cifra 4)(cifra 5)(cifra 6)(cifra 7)
    (cifra 8)(cifra 9)(litera S)(litera E)(litera R)(litera O)(litera Z)(litera N)(litera B)
    (litera I)(litera A)(litera Y))
(deftemplate cripto(slot litera)(slot cifra))

(defrule init
    (litera ?l)(cifra ?c)
    =>
    (assert(cripto(litera ?l)(cifra ?c)))
    )

(defrule solutie
    (cripto(litera E)(cifra ?e&:(= ?e 9)))
    (cripto(litera Z)(cifra ?z&:(= ?z 6)))
    (cripto(litera O)(cifra ?o&:(= ?o 3)))
    (cripto(litera S)(cifra ?s&:(= ?s 2)))
    (cripto(litera B)(cifra ?b&~?o&~?s&~?z&~?e&:(=(+ ?z 1) ?b)))
    (cripto(litera R)(cifra ?r&~?o&~?s&~?b&~?z&~?e&:(=(mod (+ ?e ?e) 10) ?r)))
    (cripto(litera Y)(cifra ?y&~?r&~?o&~?s&~?b&~?z&~?e&:(=(+ ?s ?s) ?y)))
    (cripto(litera N)(cifra ?n&~?y&~?r&~?o&~?s&~?b&~?z&~?e&:(=(mod (+ ?r ?o) 10) ?n)))    
    (cripto(litera A)(cifra ?a&~?n&~?y&~?r&~?o&~?s&~?b&~?z&~?e&:(=(+ (+ ?o ?n) (mod(/ (+ ?e ?e) 10)10)) ?a)))
    (cripto(litera I)(cifra ?i&~?a&~?n&~?y&~?r&~?o&~?s&~?b&~?z&~?e&:(= (mod(+ (mod(/ (+ ?r ?o)10)10)?e)10) ?i)))
    
    =>
   (printout t "" ?z ?e ?r ?o ?e ?s " +"crlf)
    (printout t "    " ?o ?n ?e ?s crlf)
    (printout t "-----------" crlf)
    (printout t ?b ?i ?n ?a ?r ?y crlf)
    
   )

(run)