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
(defrule S1
 (automat(val 5)(moneda N))
 =>
 (printout t " 5(N) sau 25(Q) " crlf)
 (bind ?v (read))
 (
 if (eq ?v N) then (assert(automat(val 10)(moneda ?v)))
 else (assert(automat(val 30)(moneda ?v)))
 )
 )
(defrule S2
 (automat(val 25)(moneda Q))
 =>
 (printout t " 5(N) sau 25(Q) " crlf)
 (bind ?v (read))
 (
 if (eq ?v N) then (assert(automat(val 30)(moneda ?v)))
 else (assert(automat(val 50)(moneda ?v)))
 )
 )
(defrule S3
 (automat(val 10)(moneda N))
 =>
 (printout t " 5(N) sau 25(Q) " crlf)
 (bind ?v (read))
 (
 if (eq ?v N) then (assert(automat(val 15)(moneda ?v)))
 else (assert(automat(val 35)(moneda ?v)))
 )
 )
(defrule S4
 (automat(val 30)(moneda Q))
 =>
 (printout t " 5(N) sau 25(Q) " crlf)
 (bind ?v (read))
 (
 if (eq ?v N) then (assert(automat(val 35)(moneda ?v)))
 else (printout t " Succes " crlf)
 )
 )
(defrule S5
 (automat(val 30)(moneda N))
 =>
 (printout t " 5(N) sau 25(Q) " crlf)
 (bind ?v (read))
 (
 if (eq ?v N) then (assert(automat(val 35)(moneda ?v)))
 else (printout t " Succes " crlf)
 )
 )
(defrule S6
 (automat(val 50)(moneda Q))
 =>
 (printout t " 5(N) sau 25(Q) " crlf)
 (bind ?v (read))
 (printout t "Succes " crlf)
 )
(defrule S7
 (automat(val 15)(moneda N))
 =>
 (printout t " 5(N) sau 25(Q) " crlf)
 (bind ?v (read))
 (
 if (eq ?v N) then (assert(automat(val 20)(moneda ?v)))
 else (assert(automat(val 40)(moneda ?v)))
 )
 )
(defrule S8
 (automat(val 30)(moneda Q))
 =>
 (printout t " 5(N) sau 25(Q) " crlf)
 (bind ?v (read))
 (
 if (eq ?v N) then (assert(automat(val 35)(moneda ?v)))
 else (printout t "Succes " crlf)
 )
 )
(defrule S9
 (automat(val 35)(moneda N))
 =>
 (printout t " 5(N) sau 25(Q) " crlf)
 (bind ?v (read))
 (
 if (eq ?v N) then (assert(automat(val 40)(moneda ?v)))
 else (printout t "Succes " crlf)
 )
 )
(defrule S10
 (automat(val 20)(moneda N))
 =>
 (printout t " 5(N) sau 25(Q) " crlf)
 (bind ?v (read))
 (
 if (eq ?v N) then (assert(automat(val 25)(moneda ?v)))
 else (assert(automat(val 45)(moneda ?v)))
 )
 )
(defrule S11
 (automat(val 40)(moneda Q))
 =>
 (printout t " 5(N) sau 25(Q) " crlf)
 (bind ?v (read))
 (
 if (eq ?v N) then (assert(automat(val 45)(moneda ?v)))
 else (printout t "Succes " crlf)
 )
 )
(defrule S12
 (automat(val 40)(moneda N))
 =>
 (printout t " 5(N) sau 25(Q) " crlf)
 (bind ?v (read))
 (
 if (eq ?v N) then (assert(automat(val 45)(moneda ?v)))
 else (printout t "Succes " crlf)
 )
 )
(defrule S13
 (automat(val 25)(moneda N))
 =>
 (printout t " 5(N) sau 25(Q) " crlf)
 (bind ?v (read))
 (
 if (eq ?v N) then (assert(automat(val 30)(moneda ?v)))
 else (assert(automat(val 50)(moneda ?v)))
 )
 )
(defrule S14
 (automat(val 45)(moneda Q))
 =>
 (printout t " 5(N) sau 25(Q) " crlf)
 (bind ?v (read))
 (
 if (eq ?v N) then (assert(automat(val 50)(moneda ?v)))
 else (printout t "Succes " crlf)
 )
 )
(defrule S15
 (automat(val 45)(moneda N))
 =>
 (printout t " 5(N) sau 25(Q) " crlf)
 (bind ?v (read))
 (
 if (eq ?v N) then (assert(automat(val 50)(moneda ?v)))
 else (printout t "Succes " crlf)
 )
 )
(defrule S16
 (automat(val 50)(moneda N))
 =>
 (printout t " 5(N) sau 25(Q) " crlf)
 (bind ?v (read))
 (printout t "Succes " crlf)
 )
(run)