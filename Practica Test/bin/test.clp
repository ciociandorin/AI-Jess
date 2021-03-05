(deftemplate element(slot item)(slot multime)(slot folosit(default FALSE)))
(reset)
(assert(element(item 1)(multime A)))
(assert(element(item 2)(multime A)))
(assert(element(item 3)(multime A)))
(assert(element(item 4)(multime A)))
(assert(element(item 5)(multime A)))
(assert(element(item 6)(multime A)))
(assert(element(item 7)(multime A)))
(assert(element(item 8)(multime A)))
(assert(element(item 9)(multime A)))
(assert(element(item 10)(multime A)))
(assert(element(item 2)(multime B)))
(assert(element(item 4)(multime B)))
(assert(element(item 6)(multime B)))
(assert(element(item 8)(multime B)))
(assert(element(item 10)(multime B)))
(assert(element(item 12)(multime B)))
(assert(element(item 14)(multime B)))
(assert(element(item 16)(multime B)))
(assert(element(item 54)(multime B)))
(facts)
(deftemplate cardinal(slot valoare))
(assert(cardinal(valoare 0)))



(defrule duplicat
    ?idm <-(element(item ?i)(multime ?m & ~R)(folosit FALSE))
    ?idm1 <-(element(item ?i)(multime ?m1 & ~?m & ~R)(folosit FALSE))
    =>
    (modify ?idm(folosit TRUE))
    (modify ?idm1(folosit TRUE))
    (assert(element(item ?i)(multime R)))
    )
(run)
(defrule reuniune 
    ?idr <- (element(item ?i)(multime ?m & ~R)(folosit TRUE))
    =>
    (assert (element(item ?i)(multime R)))
    (modify ?idr(folosit TRUE))
    )
(run)
(defrule CalculCardinal
    ?idi <- (element (item ?i))
    ?idvs <- (cardinal(valoare ?card))
    (element(item ?i))
    =>
    (modify ?idvs (valoare(+ 1 ?card)))
    (retract ?idi)
    )

(defrule printare 
    (element (item ?i)(multime R)(folosit FALSE))
    =>
    (printout t "Elementele multimii R = " ?i crlf)
    )

(run)
(facts)