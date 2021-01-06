(deftemplate Relatie(slot tip)(slot copil)(slot parinte))

(assert (Relatie (tip "ako")(copil "ballon")(parinte "aircraft")))
(assert (Relatie (tip "ako")(copil "pr.driven")(parinte "aircraft")))
(assert (Relatie (tip "ako")(copil "jet")(parinte "aircraft")))
(assert (Relatie (tip "ako")(copil "blimp")(parinte "ballon")))
(assert (Relatie (tip "ako")(copil "blimp")(parinte "pr.driven")))
(assert (Relatie (tip "ako")(copil "special")(parinte "pr.driven")))
(assert (Relatie (tip "ako")(copil "dc-3")(parinte "pr.driven")))
(assert (Relatie (tip "ako")(copil "dc-9")(parinte "jet")))
(assert (Relatie (tip "ako")(copil "concorde")(parinte "jet")))
(assert (Relatie (tip "has-shape")(copil "ballon")(parinte "round")))
(assert (Relatie (tip "has-shape")(copil "blimp")(parinte "ellips.")))
(assert (Relatie (tip "is-a")(copil "good year")(parinte "blimp")))
(assert (Relatie (tip "is-a")(copil "spirit of st1")(parinte "special")))
(assert (Relatie (tip "is-a")(copil "airforce 1")(parinte "dc-9")))

(defrule Solutie-ISA-AKO
    (declare(salience 970))
    (Relatie(copil ?a))
    ?w1 <- (Relatie(tip "is-a")(copil ?a)(parinte ?p))
    ?w2 <- (Relatie(tip "ako")(copil ?p)(parinte ?b))
    =>
    (assert (Relatie(parinte ?b)))
    (retract ?w1 ?w2)
	)

(defrule Solutie-AKO-fiu-parinte
    (declare(salience 950))
    (Relatie(copil ?a))
    ?w <- (Relatie(tip "ako")(copil ?a)(parinte ?p))
    =>
    (assert (Relatie(parinte ?p)))
    (retract ?w)
	)

(defrule parinte-de-parinte
    (declare(salience 900))
    (Relatie(parinte ?p))
    ?v <- (Relatie(tip "ako")(copil ?p)(parinte ?q))
    =>
    (retract ?v)
    (assert(Relatie(parinte ?q)))
	)

(defrule printeaza
	(declare(salience 500))
    ?n <- (Relatie(parinte ?p))
    =>
    (printout t ?p crlf)
    (retract ?n)
	)

(run)



