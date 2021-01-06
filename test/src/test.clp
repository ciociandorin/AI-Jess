(assert(cifra 0)(cifra 1)(cifra 2)(cifra 3)(cifra 4)(cifra 5)(cifra 6)(cifra 7)
    (cifra 8)(cifra 9)(litera S)(litera P)(litera R)(litera I)(litera N)(litera G)(litera A)
    (litera L)(litera E)(litera Y))

(deftemplate cripto 
    (slot litera)
    (slot cifra)
    )

(defrule init
    (litera ?l)
    (cifra ?c)
    =>
    (assert(cripto(litera ?l)(cifra ?c)))

    )

(defrule solutie
    (cripto(litera S)(cifra ?s &~0))
    (cripto(litera A)(cifra ?a &~ ?s &~0))
    (cripto(litera P)(cifra ?p &~ ?a &~ ?s))
    (cripto(litera R)(cifra ?r &~ ?p &~ ?a &~ ?s))
    (cripto(litera I)(cifra ?i &~?r &~ ?p &~ ?a &~ ?s))
    (cripto(litera N)(cifra ?n &~ ?i &~?r &~ ?p &~ ?a &~ ?s))
    (cripto(litera G)(cifra ?g &~?n &~ ?i &~?r &~ ?p &~ ?a &~ ?s))
    (cripto(litera L)(cifra ?l &~?g &~?n &~ ?i &~?r &~ ?p &~ ?a &~ ?s))
    (cripto(litera E)(cifra ?e &~?l &~?g &~?n &~ ?i &~?r &~ ?p &~ ?a &~ ?s))
    (cripto(litera Y)(cifra ?y &~?e &~?l &~?g &~?n &~ ?i &~?r &~ ?p &~ ?a &~ ?s))

    /*
    spring
     (+(* ?g 1)(+(* ?n 10)(+(* ?i 100)(+(* ?r 1000)(+ (* ?s 100000)  (* ?p 10000))))))
    allergy
    (+(* ?y 1)(+(* ?g 10)(+(* ?r 100)(+(* ?e 1000)(+(* ?l 10000)(+ (* ?l 100000)(* ?a 1000000)))))))
    */
    
      (test
        (eq(+ (+(* ?g 1)(+(* ?n 10)(+(* ?i 100)(+(* ?r 1000)(+ (* ?s 100000)  (* ?p 10000)))))) (+(* ?g 1)(+(* ?n 10)(+(* ?i 100)(+(* ?r 1000)(+ (* ?s 100000)  (* ?p 10000))))))) (+(* ?y 1)(+(* ?g 10)(+(* ?r 100)(+(* ?e 1000)(+(* ?l 10000)(+ (* ?l 100000)(* ?a 1000000))))))))
        )
    
    =>
    (printout t " "?s ?p ?r ?i ?n ?g crlf)
    (printout t " "?s ?p ?r ?i ?n ?g crlf)
    (printout t " "?a ?l ?l ?e ?r ?g ?y crlf)
    )
    
(run)
(reset)