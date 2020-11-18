(deftemplate Zbor
    (multislot start)
    (multislot finis)
    (slot distanta))

(assert(Zbor(start New York)(finis Toronto)(distanta 550)))
(assert(Zbor(start New York)(finis Chicago)(distanta 1144)))
(assert(Zbor(start New York)(finis Denver)(distanta 2618)))
(assert(Zbor(start Toronto)(finis Vancouver)(distanta 3360)))
(assert(Zbor(start Toronto)(finis Los Angels)(distanta 3494)))
(assert(Zbor(start Toronto)(finis Chicago)(distanta 701)))
(assert(Zbor(start Denver)(finis Los Angels)(distanta 1335)))
(assert(Zbor(start Denver)(finis Huston)(distanta 1068)))
(assert(Zbor(start Denver)(finis Memphis)(distanta 1411)))
(assert(Zbor(start Huston)(finis Los Angels)(distanta 1411)))

(defrule NY
    (Zbor(start New York)(finis ?locatie)(distanta ?distanta))
    =>
    (printout t "Zboruri New York" ?sosire))
