*/;(printout t "Hello World!" crlf)
*/;(bind ?x(read))
*/;(bind ?y(read))
*/;(if (< ?x ?y) then (printout t ?x crlf) else (printout t ?y crlf))
*/;(bind ?z(read))
(deftemplate Persoana(slot nume)(slot prenume)(multislot mama)(multislot tata)(multislot partener))
(assert(Persoana(nume Popescu)(prenume Ion)(mama Popescu Elena)(tata Popescu Emil)(partener nil)))
(assert(Persoana(nume Georgescu)(prenume Ionela)(mama Georgescu Elena)(tata Georgescu Emil)(partener nil)))
(facts)
(deffacts Familie
    (Persoana(nume Popescu)(prenume Ion)(mama Popescu Elena)(tata Popescu Emil)(partener nil))
    (Persoana(nume Georgescu)(prenume Ionela)(mama Georgescu Elena)(tata Georgescu Emil)(partener nil)))
(reset)
(facts)

(defrule nume_regula (Persoana(nume ?x)(prenume ?y)(mama $? Popescu Elena $?)) => (printout t ?x "," ?y crlf))(run)
(defrule nume_regula1 (Persoana(nume ?x)(prenume ?y)(mama $?m)(tata $?t)) => (printout t ?y "," $?m "," $?t crlf))(run)

(deftemplate Persoana1(multislot numeprenume)(multislot mama)(multislot tata)(multislot partener))

(deffacts Familie
    (Persoana(nume Popescu)(prenume Ion)(mama Popescu Elena)(tata Popescu Emil)(partener nil))
    (Persoana(nume Georgescu)(prenume Ionela)(mama Georgescu Elena)(tata Georgescu Emil)(partener nil)))
(reset)
(facts)
