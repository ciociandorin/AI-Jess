

(deftemplate dama(slot x)(slot y)(slot folosit(allowed-values TRUE FALSE)))

(foreach ?x (create$ 1 2 3 4)
    (foreach ?y (create$ 1 2 3 4)
        (assert(dama(x ?x)(y ?y)(folosit FALSE)))
        ))

(defrule solutie
    ?d1 <- (dama(x ?x1)(y ?y1)(folosit FALSE))
    ?d2 <- (dama(x ?x2&~?x1)(y ?y2&~?y1)(folosit FALSE))
    ?d3 <- (dama(x ?x3&~?x2&~?x1)(y ?y3&~?y2&~?y1)(folosit FALSE))
    ?d4 <- (dama(x ?x4&~?x3&~?x2&~?x1)(y ?y4&~?y3&~?y2&~?y1)(folosit FALSE))
    (test(neq(abs(- ?x1 ?x2))(abs(- ?y1 ?y2))))
    (test(neq(abs(- ?x1 ?x3))(abs(- ?y1 ?y3))))
    (test(neq(abs(- ?x1 ?x4))(abs(- ?y1 ?y4))))
    (test(neq(abs(- ?x2 ?x3))(abs(- ?y2 ?y3))))
    (test(neq(abs(- ?x2 ?x4))(abs(- ?y2 ?y4))))
    (test(neq(abs(- ?x3 ?x4))(abs(- ?y3 ?y4))))
    =>
    (printout t "Dama 1 -> x: "?x1 ", y: "?y1 crlf)
    (printout t "Dama 2 -> x: "?x2 ", y: "?y2 crlf)
    (printout t "Dama 3 -> x: "?x3 ", y: "?y3 crlf)
    (printout t "Dama 4 -> x: "?x4 ", y: "?y4 crlf)
    (modify ?d1 (folosit TRUE))
    (modify ?d2 (folosit TRUE))
    (modify ?d3 (folosit TRUE))
    (modify ?d4 (folosit TRUE))
    )
(run)

















