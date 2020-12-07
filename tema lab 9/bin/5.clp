(deftemplate automat(slot val)(slot moneda))

(assert(automat(val nil)(moneda nil)))

(defrule Start
    (automat(val nil)(moneda nil))
    =>
    (printout t " 5(N) sau 25(Q) " crlf)
    (bind ?v (read))
    (
        if (eq ?v N) then (assert(automat(val 5)(moneda ?v)))
        elif (eq ?v Q) then (assert(automat(val 25)(moneda ?v)))
        )
    )

(defrule t1
    (automat(val 5)(moneda N))
    =>
    (printout t " 5(N) sau 25(Q) " crlf)
    (bind ?v (read))
    (
        if (eq ?v N) then (assert(automat(val 10)(moneda ?v)))
        else (assert(automat(val 30)(moneda ?v)))
        )
    )

(defrule t2
    (automat(val 25)(moneda Q))
    =>
    (printout t " 5(N) sau 25(Q) " crlf)
    (bind ?v (read))
    (
        if (eq ?v N) then (assert(automat(val 30)(moneda ?v)))
        else (assert(automat(val 50)(moneda ?v)))
        )
    )

(defrule t3
    (automat(val 10)(moneda N))
    =>
    (printout t " 5(N) sau 25(Q) " crlf)
    (bind ?v (read))
    (
        if (eq ?v N) then (assert(automat(val 15)(moneda ?v)))
        else (assert(automat(val 35)(moneda ?v)))
        )
    )

(defrule t4
    (automat(val 30)(moneda Q))
    =>
    (printout t " 5(N) sau 25(Q) " crlf)
    (bind ?v (read))
    (
        if (eq ?v N) then (assert(automat(val 35)(moneda ?v)))
        else (printout t " Succes " crlf)
        )
    )

(defrule t5
    (automat(val 30)(moneda N))
    =>
    (printout t " 5(N) sau 25(Q) " crlf)
    (bind ?v (read))
    (
        if (eq ?v N) then (assert(automat(val 35)(moneda ?v)))
        else (printout t " Succes " crlf)
        )
    )

(defrule t6
    (automat(val 50)(moneda Q))
    =>
    (printout t " 5(N) sau 25(Q) " crlf)
    (bind ?v (read))
    (printout t "Succes " crlf)
    )

(defrule t7
    (automat(val 15)(moneda N))
    =>
    (printout t " 5(N) sau 25(Q) " crlf)
    (bind ?v (read))
    (
        if (eq ?v N) then (assert(automat(val 20)(moneda ?v)))
        else (assert(automat(val 40)(moneda ?v)))
        )
    )

(defrule t8
    (automat(val 30)(moneda Q))
    =>
    (printout t " 5(N) sau 25(Q) " crlf)
    (bind ?v (read))
    (
        if (eq ?v N) then (assert(automat(val 35)(moneda ?v)))
        else (printout t "Succes " crlf)
        )
    )

(defrule t9
    (automat(val 35)(moneda N))
    =>
    (printout t " 5(N) sau 25(Q) " crlf)
    (bind ?v (read))
    (
        if (eq ?v N) then (assert(automat(val 40)(moneda ?v)))
        else (printout t "Succes " crlf)
        )
    )

(defrule t10
    (automat(val 20)(moneda N))
    =>
    (printout t " 5(N) sau 25(Q) " crlf)
    (bind ?v (read))
    (
        if (eq ?v N) then (assert(automat(val 25)(moneda ?v)))
        else (assert(automat(val 45)(moneda ?v)))
        )
    )

(defrule t11
    (automat(val 40)(moneda Q))
    =>
    (printout t " 5(N) sau 25(Q) " crlf)
    (bind ?v (read))
    (
        if (eq ?v N) then (assert(automat(val 45)(moneda ?v)))
        else (printout t "Succes " crlf)
        )
    )

(defrule t12
    (automat(val 40)(moneda N))
    =>
    (printout t " 5(N) sau 25(Q) " crlf)
    (bind ?v (read))
    (
        if (eq ?v N) then (assert(automat(val 45)(moneda ?v)))
        else (printout t "Succes " crlf)
        )
    )

(defrule t13
    (automat(val 25)(moneda N))
    =>
    (printout t " 5(N) sau 25(Q) " crlf)
    (bind ?v (read))
    (
        if (eq ?v N) then (assert(automat(val 30)(moneda ?v)))
        else (assert(automat(val 50)(moneda ?v)))
        )
    )

(defrule t14
    (automat(val 45)(moneda Q))
    =>
    (printout t " 5(N) sau 25(Q) " crlf)
    (bind ?v (read))
    (
        if (eq ?v N) then (assert(automat(val 50)(moneda ?v)))
        else (printout t "Succes " crlf)
        )
    )

(defrule t15
    (automat(val 45)(moneda N))
    =>
    (printout t " 5(N) sau 25(Q) " crlf)
    (bind ?v (read))
    (
        if (eq ?v N) then (assert(automat(val 50)(moneda ?v)))
        else (printout t "Succes " crlf)
        )
    )

(defrule t16
    (automat(val 50)(moneda N))
    =>
    (printout t " 5(N) sau 25(Q) " crlf)
    (bind ?v (read))
    (printout t "Succes " crlf)
    )

(run)
