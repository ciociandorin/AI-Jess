(deffacts multimi
    (multime A 3 5 7 9)
    (multime B 1 2 4 6 8))
(reset)

(deffacts reuniune
    (reuniune AB))

(reset)

(deftemplate suma(slot sum))
(assert(suma(sum 0)))

(defrule descompunere
    (declare(salience 3))
    ?id<-(multime ?A ?p &?rest)
    (test(not(eq ?p nil)))
    =>
    (retract ?id)
    (assert(element ?p))
    (assert(multime ?A $?rest))
    )

(defrule reuniune
    (declare(salience 2))
    ?e<-(element ?p)
    ?r<-(reuniune ?A $?rest)
    =>
    (retract ?e ?r)
    (assert(reuniune ?A ?p $?rest))
    )

(defrule sumaelemente
    (declare(salience 1))
    ?idvs<-(suma(sum ?vs))
    ?idve<-(reuniune ?A ?p&:(integer ?p) $?rest)
    =>
    (retract ?idve)
    (modify ?idvs (sum(+ ?vs ?p)))
    (assert(reuniune ?A $?rest))
    )
(run)
(facts)