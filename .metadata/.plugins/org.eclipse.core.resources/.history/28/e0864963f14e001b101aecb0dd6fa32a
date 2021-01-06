(deftemplate AutomatCafea(slot intrebare)(slot raspuns))
(assert (AutomatCafea (intrebare nil)(raspuns nil)))

(defrule reg1
    (AutomatCafea (intrebare nil)(raspuns nil))    
    =>
    (printout t "Introduceti o moneda de 5 sau 25 centi. Hint: n->5, q->25" crlf)
    (bind ?r (read))
    (assert(AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi.")(raspuns ?r)))
    )

(defrule reg2
    (AutomatCafea (intrebare "Introduceti o moneda de 5 sau 25 centi.")(raspuns n))   
    =>
    (printout t "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 5 centi." crlf)
    (bind ?r (read))
    (assert(AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 5 centi.")(raspuns ?r)))
    )

(defrule reg3
    (AutomatCafea (intrebare "Introduceti o moneda de 5 sau 25 centi.")(raspuns q))    
    =>
    (printout t "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 25 centi." crlf)
    (bind ?r (read))
    (assert(AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 25 centi.")(raspuns ?r)))
    )


(defrule reg4
    (AutomatCafea (intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 5 centi.")(raspuns n))
    =>
    (printout t "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 10 centi." crlf)
    (bind ?r (read))
    (assert(AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 10 centi.")(raspuns ?r)))
    )


(defrule reg5
    (AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 5 centi.")(raspuns q))  
    =>
    (printout t "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 30 centi." crlf)
    (bind ?r (read))
    (assert(AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 30 centi.")(raspuns ?r)))
    )


(defrule reg6
    (AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 25 centi.")(raspuns n))
    =>
    (printout t "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 30 centi." crlf)
    (bind ?r (read))
    (assert(AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 30 centi.")(raspuns ?r)))
    )


(defrule reg7
    (AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 25 centi.")(raspuns q)) 
    =>
    (printout t "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 50 centi." crlf)
    (bind ?r (read))
    (assert(AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 50 centi.")(raspuns ?r)))
    )


(defrule reg8
    (AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 10 centi.")(raspuns n))    
    =>
    (printout t "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 15 centi." crlf)
    (bind ?r (read))
    (assert(AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 15 centi.")(raspuns ?r)))
    )


(defrule reg9
    (AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 10 centi.")(raspuns q))    
    =>
    (printout t "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 35 centi." crlf)
    (bind ?r (read))
    (assert(AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 35 centi.")(raspuns ?r)))
    )


(defrule reg10
    (AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 30 centi.")(raspuns n))    
    =>
    (printout t "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 35 centi." crlf)
    (bind ?r (read))
    (assert(AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 35 centi.")(raspuns ?r)))
    )

(defrule reg11StareFinala
    (AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 30 centi.")(raspuns q))    
    =>
    (printout t "Cafeaua dumneavoasta se prepara." crlf)
    (printout t "Gata! Mai doriti sa consumati cafea?" crlf)
    (bind ?r (read))
    (assert(AutomatCafea(intrebare "Mai doriti sa consumati cafea?")(raspuns ?r)))
    )

(defrule Restart1da
    (AutomatCafea(intrebare "Mai doriti sa consumati cafea?")(raspuns da))    
    =>
    (printout t "Introduceti o moneda de 5 sau 25 centi." crlf)
    (bind ?r (read))
    (assert(AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi.")(raspuns ?r)))
    )

(defrule Restart1nu
    (AutomatCafea(intrebare "Mai doriti sa consumati cafea?")(raspuns nu))    
    =>
    (printout t "Multumim ca ati cumparat de la noi! O zi buna sa aveti!" crlf)
    )


(defrule reg12
    (AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 15 centi.")(raspuns n))    
    =>
    (printout t "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 20 centi." crlf)
    (bind ?r (read))
    (assert(AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 20 centi.")(raspuns ?r)))
    )


(defrule reg13
    (AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 15 centi.")(raspuns q))    
    =>
    (printout t "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 40 centi." crlf)
    (bind ?r (read))
    (assert(AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 40 centi.")(raspuns ?r)))
    )


(defrule reg14
    (AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 20 centi.")(raspuns n))   
    =>
    (printout t "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 25 centi." crlf)
    (bind ?r (read))
    (assert(AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 25 centi.")(raspuns ?r)))
    )

(defrule reg15
    (AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 20 centi.")(raspuns q))
    =>
    (printout t "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 45 centi." crlf)
    (bind ?r (read))
    (assert(AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 45 centi.")(raspuns ?r)))
    )


(defrule reg16
    (AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 35 centi.")(raspuns n))    
    =>
    (printout t "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 40 centi." crlf)
    (bind ?r (read))
    (assert(AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 40 centi.")(raspuns ?r)))
    )

(defrule reg17StareFinala
    (AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 35 centi.")(raspuns q))    
    =>
    (printout t "Cafeaua dumneavoasta se prepara." crlf)
    (printout t "Gata! Mai doriti sa consumati cafea? Momentan aveti 5 centi." crlf)
    (bind ?r (read))
    (assert(AutomatCafea(intrebare "Mai doriti sa consumati cafea? Momentan aveti 5 centi.")(raspuns ?r)))
    )

(defrule Restart2da
    (AutomatCafea(intrebare "Mai doriti sa consumati cafea? Momentan aveti 5 centi.")(raspuns da))    
    =>
    (printout t "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 5 centi." crlf)
    (bind ?r (read))
    (assert(AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 5 centi.")(raspuns ?r)))
    )

(defrule Restart2nu
    (AutomatCafea(intrebare "Mai doriti sa consumati cafea? Momentan aveti 5 centi.")(raspuns nu))    
    =>
    (printout t "Multumim ca ati cumparat de la noi! O zi buna sa aveti!" crlf)
    )

(defrule reg18
    (AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 40 centi.")(raspuns n))    
    =>
    (printout t "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 45 centi." crlf)
    (bind ?r (read))
    (assert(AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 45 centi.")(raspuns ?r)))
    )

(defrule reg19StareFinala
    (AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 40 centi.")(raspuns q))   
    =>
    (printout t "Cafeaua dumneavoasta se prepara." crlf)
    (printout t "Gata! Mai doriti sa consumati cafea? Momentan aveti 10 centi." crlf)
    (bind ?r (read))
    (assert(AutomatCafea(intrebare "Mai doriti sa consumati cafea? Momentan aveti 10 centi.")(raspuns ?r)))
    )

(defrule Restart3da
    (AutomatCafea(intrebare "Mai doriti sa consumati cafea? Momentan aveti 10 centi.")(raspuns da))    
    =>
    (printout t "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 10 centi." crlf)
    (bind ?r (read))
    (assert(AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 10 centi.")(raspuns ?r)))
    )

(defrule Restart3nu
    (AutomatCafea(intrebare "Mai doriti sa consumati cafea? Momentan aveti 10 centi.")(raspuns nu))    
    =>
    (printout t "Multumim ca ati cumparat de la noi! O zi buna sa aveti!" crlf)
    )

(defrule reg20
    (AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 45 centi.")(raspuns n))   
    =>
    (printout t "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 50 centi." crlf)
    (bind ?r (read))
    (assert(AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 50 centi.")(raspuns ?r)))
    )


(defrule reg21StareFinala
    (AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 45 centi.")(raspuns q))   
    =>
    (printout t "Cafeaua dumneavoasta se prepara." crlf)
    (printout t "Gata! Mai doriti sa consumati cafea? Momentan aveti 15 centi." crlf)
    (bind ?r (read))
    (assert(AutomatCafea(intrebare "Mai doriti sa consumati cafea? Momentan aveti 15 centi.")(raspuns ?r)))
    )

(defrule Restart4da
    (AutomatCafea(intrebare "Mai doriti sa consumati cafea? Momentan aveti 15 centi.")(raspuns da))    
    =>
    (printout t "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 15 centi." crlf)
    (bind ?r (read))
    (assert(AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 15 centi.")(raspuns ?r)))
    )

(defrule Restart4nu
    (AutomatCafea(intrebare "Mai doriti sa consumati cafea? Momentan aveti 15 centi.")(raspuns nu))    
    =>
    (printout t "Multumim ca ati cumparat de la noi! O zi buna sa aveti!" crlf)
    )


(defrule reg22StareFinala
    (AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 50 centi.")(raspuns n))   
    =>
    (printout t "Cafeaua dumneavoasta se prepara." crlf)
    (printout t "Gata! Mai doriti sa consumati cafea?" crlf)
    (bind ?r (read))
    (assert(AutomatCafea(intrebare "Mai doriti sa consumati cafea?")(raspuns ?r)))
    )

(defrule reg23StareFinala
    (AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 50 centi.")(raspuns q))   
    =>
    (printout t "Cafeaua dumneavoasta se prepara." crlf)
    (printout t "Gata! Mai doriti sa consumati cafea? Momentan aveti 20 centi." crlf)
    (bind ?r (read))
    (assert(AutomatCafea(intrebare "Mai doriti sa consumati cafea? Momentan aveti 20 centi.")(raspuns ?r)))
    )

(defrule Restart5da
    (AutomatCafea(intrebare "Mai doriti sa consumati cafea? Momentan aveti 20 centi.")(raspuns da))    
    =>
    (printout t "Introduceti o moneda de 5 sau 25 centi. Momentan aveti 20 centi." crlf)
    (bind ?r (read))
    (assert(AutomatCafea(intrebare "Introduceti o moneda de 5 sau 25 centi.")(raspuns ?r)))
    )

(defrule Restart5nu
    (AutomatCafea(intrebare "Mai doriti sa consumati cafea? Momentan aveti 20 centi.")(raspuns nu))   
    =>
    (printout t "Multumim ca ati cumparat de la noi! O zi buna sa aveti!" crlf)
    )

(run)
