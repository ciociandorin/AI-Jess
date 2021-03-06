(deftemplate mapa(slot tara)(slot culoare))

(assert (tara Romania)
	(tara Ungaria)
    (tara Serbia)
    (tara Bulgaria)
    (tara Moldova)
	(tara Ucraina)
    
    (culoare rosu)
    (culoare galben)
    (culoare albastru)
    (culoare verde)
)

(defrule init
    (tara ?t)(culoare ?c)
    =>
    (assert (mapa (tara ?t)(culoare ?c)))
)


(defrule solutie
    (mapa (tara Romania)(culoare ?ro&: (= galben ?ro)))
    (mapa (tara Ungaria)(culoare ?hu &~ ?ro))
    (mapa (tara Serbia)(culoare ?rs &~ ?hu &~ ?ro))
    (mapa (tara Bulgaria)(culoare ?bg &~ ?rs &~ ?ro))
    (mapa (tara Moldova)(culoare ?md &~ ?bg &~?ro))
    (mapa (tara Ucraina)(culoare ?ua &~ ?md &~ ?ro))

    =>
    
    (printout t "Romania = " ?ro ", ")
    (printout t "Ungaria = " ?hu ", ")
    (printout t "Serbia = " ?rs ", ")
    (printout t "Bulgaria = " ?bg ", ")
    (printout t "Moldova = " ?md ", ")
    (printout t "Ucraina = " ?ua "; ")
    (printout t crlf)
)

(run)
