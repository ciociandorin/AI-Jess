(deftemplate RelatiiCalculatoareComponente(slot tip)(slot copil)(slot parinte))

(assert (RelatiiCalculatoareComponente (tip "ako")(copil "Mainframe")(parinte "Supercalculator")))
(assert (RelatiiCalculatoareComponente (tip "is-a")(copil "Microcalculator")(parinte "Supercalculator")))
(assert (RelatiiCalculatoareComponente (tip "is-a")(copil "Sisteme de calcul")(parinte "Supercalculator")))
(assert (RelatiiCalculatoareComponente (tip "is-a")(copil "Sisteme cu scop general")(parinte "Supercalculator")))
(assert (RelatiiCalculatoareComponente (tip "is-a")(copil "Sisteme dedicate")(parinte "Mainframe")))
(assert (RelatiiCalculatoareComponente (tip "is-a")(copil "Minicalculator")(parinte "Mainframe")))
(assert (RelatiiCalculatoareComponente (tip "ako")(copil "Microcalculator")(parinte "Minicalculator")))
(assert (RelatiiCalculatoareComponente (tip "is-a")(copil "Procesor multiplu")(parinte "Sisteme cu scop generale")))
(assert (RelatiiCalculatoareComponente (tip "is-a")(copil "Procesor simplu")(parinte "Sisteme dedicate")))
(assert (RelatiiCalculatoareComponente (tip "is-a")(copil "Procesor simplu")(parinte "Sisteme de calcul")))
(assert (RelatiiCalculatoareComponente (tip "ako")(copil "Procesor simplu")(parinte "Procesor multiplu")))


(defrule Relatie-AKO
    (declare(salience 100))
    (RelatiiCalculatoareComponente(copil ?c))
    ?w<-(RelatiiCalculatoareComponente(tip "ako")(copil ?c)(parinte ?p))
    =>
    (assert(RelatiiCalculatoareComponente(parinte ?p)))
    (retract ?w)
)

(defrule Relatie-ISA
    (declare(salience 95))
    (RelatiiCalculatoareComponente(copil ?c))
    ?w<-(RelatiiCalculatoareComponente(tip "is-a")(copil ?c)(parinte ?p))
    =>
    (assert(RelatiiCalculatoareComponente(parinte ?p)))
    (retract ?w)
)

(defrule Relatie-ISA-ISA
    (declare(salience 90))
    (RelatiiCalculatoareComponente(copil ?c))
    ?w1 <- (RelatiiCalculatoareComponente(tip "is-a")(copil ?c)(parinte ?p))
    ?w2 <- (RelatiiCalculatoareComponente(tip "is-a")(copil ?p)(parinte ?b))
    =>
    (assert (RelatiiCalculatoareComponente(parinte ?b)))
    (retract ?w1 ?w2)
)

(defrule Relatie-ISA-AKO
    (declare(salience 85))
    (RelatiiCalculatoareComponente(copil ?c))
    ?w1 <- (RelatiiCalculatoareComponente(tip "is-a")(copil ?c)(parinte ?p))
    ?w2 <- (RelatiiCalculatoareComponente(tip "ako")(copil ?p)(parinte ?b))
    =>
    (assert (RelatiiCalculatoareComponente(parinte ?b)))
    ;(printout t ?b crlf)
    (retract ?w1 ?w2)
)

(defrule Relatie-ISA-ISA-AKO
    (declare(salience 80))
    (RelatiiCalculatoareComponente(copil ?c))
    ?w1 <- (RelatiiCalculatoareComponente(tip "is-a")(copil ?c)(parinte ?p))
    ?w2 <- (RelatiiCalculatoareComponente(tip "is-a")(copil ?p)(parinte ?b))
    ?w3 <- (RelatiiCalculatoareComponente(tip "ako")(copil ?b)(parinte ?sb))
    =>
    (assert (RelatiiCalculatoareComponente(parinte ?sb)))
    (retract ?w1 ?w2 ?w3)
)

(defrule Relatie-AKO-ISA-ISA
    (declare(salience 75))
    (RelatiiCalculatoareComponente(copil ?c))
    ?w1 <- (RelatiiCalculatoareComponente(tip "ako")(copil ?c)(parinte ?p))
    ?w2 <- (RelatiiCalculatoareComponente(tip "is-a")(copil ?p)(parinte ?b))
    ?w3 <- (RelatiiCalculatoareComponente(tip "is-a")(copil ?b)(parinte ?sb))
    =>
    (assert (RelatiiCalculatoareComponente(parinte ?sb)))
    (retract ?w1 ?w2 ?w3)
)
    
(defrule Relatie-AKO-ISA-AKO
    (declare(salience 70))
    (RelatiiCalculatoareComponente(copil ?c))
    ?w1 <- (RelatiiCalculatoareComponente(tip "ako")(copil ?c)(parinte ?p))
    ?w2 <- (RelatiiCalculatoareComponente(tip "is-a")(copil ?p)(parinte ?b))
    ?w3 <- (RelatiiCalculatoareComponente(tip "ako")(copil ?b)(parinte ?sb))
    =>
    (assert (RelatiiCalculatoareComponente(parinte ?sb)))
    (retract ?w1 ?w2 ?w3)
)

(defrule printeaza
	(declare(salience 50))
    ?rez<-(RelatiiCalculatoareComponente(parinte ?p))
    =>
    (printout t ?p crlf)
    (retract ?rez)
)

(run)
