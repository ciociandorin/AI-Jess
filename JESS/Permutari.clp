
(deftemplate number(slot value))

(assert (number(value 1)))
(assert (number(value 2)))
(assert (number(value 3)))
;(assert (number(value 5)))
;(assert (number(value 6)))
;(assert (number(value 7)))
;(assert (number(value 8)))


(defrule some-rule-aranjamente
    (declare (salience 60))
    ?fact1 <- (number (value ?n1))
    ?fact2 <- (number (value ?n2))
    ?fact3 <- (number (value ?n3))
    ;(test (neq ?fact1 ?fact2 ?fact3))
    ;(test (neq ?n1 ?n2))
    ;(test (neq ?n3 ?n2))
    ;(test (neq ?n1 ?n3))
    =>
    (printout t "Aranjamentele pentru 1, 2 si 3 sunt: " ?fact1.value " " ?fact2.value " " ?fact3.value crlf)
)

(defrule some-rule-permutari
    (declare (salience 50))
    ?fact1 <- (number (value ?n1))
    ?fact2 <- (number (value ?n2))
    ?fact3 <- (number (value ?n3))
    (test (neq ?fact1 ?fact2 ?fact3))
    (test (neq ?n1 ?n2))
    (test (neq ?n3 ?n2))
    (test (neq ?n1 ?n3))
    =>
    (printout t "Permutarile sunt: " ?fact1.value " " ?fact2.value " " ?fact3.value crlf)
)

;trebuie facut inca un deftemplate cu numar drept parametru si indicate n fapte pentru care luam k elemente
/*(assert (number(value 4)))
(defrule some-rule-combinari
    (declare (salience 45))
    ?fact1 <- (number (value ?n1))
    ?fact2 <- (number (value ?n2))
    ?fact3 <- (number (value ?n3))
    (test (neq ?fact1 ?fact2 ?fact3))
    (test (neq ?n1 ?n2))
    (test (neq ?n3 ?n2))
    (test (neq ?n1 ?n3))
    =>
    (printout t "Combinarile de 4 luate cate 3 sunt: " ?fact1.value " " ?fact2.value " " ?fact3.value crlf)
)*/

(facts)
(run)



