(deftemplate note 
    (slot matematica (type INTEGER))
    (slot informatica (type INTEGER))
    (slot fizica (type INTEGER))
    (slot chimie (type INTEGER))
    (slot biologie (type INTEGER))
    (slot istorie (type INTEGER))
    (slot geografie (type INTEGER))
    (slot limbaengleza (type INTEGER))
    (slot limbaromana (type INTEGER))
    (slot muzica (type INTEGER))
    (slot desen (type INTEGER))
    )

(assert(note(matematica 0)(informatica 0)(fizica 0)(chimie 0)(biologie 0)(geografie 0)
        (istorie 0)(limbaengleza 0)(limbaromana 0)(muzica 0)(desen 0)))

(defrule citeste
    ?w<- (note(matematica 0)(informatica 0)(fizica 0)(chimie 0)(biologie 0)(geografie 0)
        (istorie 0)(limbaengleza 0)(limbaromana 0)(muzica 0)(desen 0))
    =>
    (printout t "Notele elevului sunt: " crlf)
    
    (printout t "Notele la matematica: ")
    (bind ?m (read))
    
    (printout t "Notele la informatica: ")
    (bind ?i (read))
    
    (printout t "Notele la fizica: ")
    (bind ?f (read))
    
    (printout t "Notele la chimie: ")
    (bind ?c (read))
    
    (printout t "Notele la geografie: ")
    (bind ?g (read))
    
    (printout t "Notele la biologie: ")
    (bind ?b (read))
    
    (printout t "Notele la istorie: ")
    (bind ?ist (read))
    
    (printout t "Notele la limbaromana: ")
    (bind ?lr (read))
    
    (printout t "Notele la limba engleza: ")
    (bind ?le (read))
    
    (printout t "Notele la muzica: ")
    (bind ?muz (read))
    
    (printout t "Notele la desen: ")
    (bind ?des (read))
    
    (retract ?w)
    (assert(note(matematica ?m)(informatica ?i)(fizica ?f)(chimie ?c)
            (biologie ?b)(geografie ?g)
        (istorie ?ist)(limbaengleza ?le)(limbaromana ?lr)(muzica ?muz)(desen ?des)))
    )

(facts)
(run)
(facts)


(defrule FMI
    (note(matematica ?m&:(>= ?m 8))(informatica ?i&:(>= ?i 9)))
    =>
    (printout t "Sugestie FMI" crlf)
    )

(defrule FacultateCBG
    (note(chimie ?c&:(>= ?c 8))(biologie ?b&:(>= ?b 9))(geografie ?g&:(>= ?g 9)))
    =>
    (printout t "Sugestie CBG" crlf)
    )

(defrule arte
    (note(desen ?des&:(>= ?des 9))(muzica ?muz&:(>= ?muz 9)))
    =>
    (printout t "Sugestie ARTE" crlf)
    )


(run)


