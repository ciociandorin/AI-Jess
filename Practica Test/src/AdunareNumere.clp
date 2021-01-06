(deftemplate element(slot valoare)(slot nume))
(assert(element(valoare 2)(nume A)))
(assert(element(valoare 3)(nume B)))
(assert(element(valoare 7)(nume C)))
(assert(element(valoare 1001)(nume D)))

(deftemplate suma(slot val))
(assert(suma(val 0)))

(defrule calcul
    ?idve<-(element(valoare ?ve))
    ?idvs<-(suma(val ?vs))
    =>
    (modify ?idvs (val(+ ?ve ?vs)))
    (retract ?idve)
)

(defrule afisare 
    (suma(val ?vs))
    =>
    (printout t ?vs)
)
;(watch all)
(run)