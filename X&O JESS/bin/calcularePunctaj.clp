; Programul primeste situatia actuala a tablei de joc si returneaza un punctaj bazat pe anumite reguli
; Tabla cu cel mai mare scor reprezinta alegerea robotului

; Definire template

	; Template tabla X&O

(deftemplate tabla(slot x1)(slot x2)(slot x3)
    			  (slot y1)(slot y2)(slot y3)
    			  (slot z1)(slot z2)(slot z3))

; x1 | x2 | x3
;--------------
; y1 | y2 | y3
;--------------
; z1 | z2 | z3


; Popularea templateului

	; Template tabla X&O
(reset)
(assert (tabla(x1 0)(x2 0)(x3 0)
    		 (y1 0)(y2 0)(y3 nil)
    		 (z1 nil)(z2 nil)(z3 nil)))

; 0 - O
; 1 - X
; nill - liber

(facts)

; Reguli

	; WIN

(defrule wht
    (tabla(x1 ?x1)(x2 ?x2)(x3 ?x3)
        {
        	x1 == x2 && x2 == x3 && x1 == 0
        }
    )
    =>
    (printout t "Win horizontal top + 100p" crlf)
)

(defrule whm
    (tabla(y1 ?y1)(y2 ?y2)(y3 ?y3)
        {
        	y1 == y2 && y2 == y3 && y1 == 0
        }
    )
    =>
    (printout t "Win horizontal mid + 100p" crlf)
)

(defrule whb
    (tabla(z1 ?z1)(z2 ?z2)(z3 ?z3)
        {
        	z1 == z2 && z2 == z3 && z1 == 0
        }
    )
    =>
    (printout t "Win horizontal bot + 100p" crlf)   
)

(defrule wvl
    (tabla(x1 ?x1)(y1 ?y1)(z1 ?z1)
        {
        	x1 == y1 && y1 == z1 && x1 == 0
        }
    )
    =>
    (printout t "Win vertical left + 100p" crlf)
)

(defrule wvm
    (tabla(x2 ?x2)(y2 ?y2)(z2 ?z2)
        {
        	x2 == y2 && y2 == z2 && x2 == 0
        }
    )
    =>
    (printout t "Win vertical mid + 100p" crlf)
)

(defrule wvr
    (tabla(x3 ?x3)(y3 ?y3)(z3 ?z3)
        {
        	x3 == y3 && y3 == z3 && x3 == 0
        }
    )
    =>
    (printout t "Win vertical right + 100p" crlf)
)

(defrule wd1
    (tabla(x1 ?x1)(y2 ?y2)(z3 ?z3)
        {
        	x1 == y2 && y2 == z3 && x1 == 0
        }
    )
    =>
    (printout t "Win first diagonal + 100p" crlf)
)

(defrule wd2
    (tabla(x3 ?x3)(y2 ?y2)(z1 ?z1)
        {
        	x3 == y2 && y2 == z1 && x3 == 0
        }
    )
    =>
    (printout t "Win second diagonal + 100p" crlf)
)

	; LOSE

(defrule lht
    (tabla(x1 ?x1)(x2 ?x2)(x3 ?x3)
        {
        	
        	(x1 == x2 && x3 == nil && x1 == 1) || (x2 == x3 && x1 == nil && x2 == 1) || (x1 == x3 && x2 == nil && x3 == 1)
        
        }
    )
    =>
    (printout t "Lose horizontal top - 50p" crlf)
    
)

(defrule lhm
    (tabla(y1 ?y1)(y2 ?y2)(y3 ?y3)
        {
        	
        	(y1 == y2 && y3 == nil && y1 == 1) || (y2 == y3 && y1 == nil && y2 == 1) || (y1 == y3 && y2 == nil && y3 == 1)
        
        }
    )
    =>
    (printout t "Lose horizontal mid - 50p" crlf)
)

(defrule lhb
    (tabla(z1 ?z1)(z2 ?z2)(z3 ?z3)
        {
        	
        	(z1 == z2 && z3 == nil && z1 == 1) || (z2 == z3 && z1 == nil && z2 == 1) || (z1 == z3 && z2 == nil && z3 == 1)
        
        }
    )
    =>
    (printout t "Lose horizontal bot - 50p" crlf)
)

(defrule lvl
    (tabla(x1 ?x1)(y1 ?y1)(z1 ?z1)
        {
        	
        	(x1 == y1 && z1 == nil && x1 == 1) || (y1 == z1 && x1 == nil && y1 == 1) || (x1 == z1 && y1 == nil && x1 == 1)
        
        }
    )
    =>
    (printout t "Lose vertical left - 50p" crlf)
)

(defrule lvm
    (tabla(x2 ?x2)(y2 ?y2)(z2 ?z2)
        {
        	
        	(x2 == y2 && z2 == nil && x2 == 1) || (y2 == z2 && x2 == nil && y2 == 1) || (x2 == z2 && y2 == nil && x2 == 1)
        
        }
    )
    =>
    (printout t "Lose vertical mid - 50p" crlf)
)

(defrule lvr
    (tabla(x3 ?x3)(y3 ?y3)(z3 ?z3)
        {
        	
        	(x3 == y3 && z3 == nil && x3 == 1) || (y3 == z3 && x3 == nil && y3 == 1) || (x3 == z3 && y3 == nil && x3 == 1)
        
        }
    )
    =>
    (printout t "Lose vertical right - 50p" crlf)
)

(defrule ld1
    (tabla(x1 ?x1)(y2 ?y2)(z3 ?z3)
        {
        	
        	(x1 == y2 && z3 == nil && x1 == 1) || (y2 == z3 && x1 == nil && y2 == 1) || (x1 == z3 && y2 == nil && x1 == 1)
        
        }
    )
    =>
    (printout t "Lose first diagonal - 50p" crlf)
)

(defrule ld2
    (tabla(x3 ?x3)(y2 ?y2)(z1 ?z1)
        {
        	
        	(x2 == y2 && z1 == nil && x3 == 1) || (y2 == z1 && x3 == nil && y2 == 1) || (x3 == z1 && y2 == nil && x3 == 1)
        
        }
    )
    =>
    (printout t "Lose second diagonal - 50p" crlf)
)


	; NORMAL

(defrule oht
    (tabla(x1 ?x1)(x2 ?x2)(x3 ?x3)
        {
        	
        	(x1 == 0 && x2 == nil && x3 == nil) || (x2 == 0 && x1 == nil && x3 == nil) || (x3 == 0 && x1 == nil && x2 == nil)
        
        }
    )
    =>
    (printout t "One horizontal top + 1p" crlf)
)

(defrule ohm
    (tabla(y1 ?y1)(y2 ?y2)(y3 ?y3)
        {
        	
        	(y1 == 0 && y2 == nil && y3 == nil) || (y2 == 0 && y1 == nil && y3 == nil) || (y3 == 0 && y1 == nil && y2 == nil)
        
        }
    )
    =>
    (printout t "One horizontal mid + 1p" crlf)
)

(defrule ohb
    (tabla(z1 ?z1)(z2 ?z2)(z3 ?z3)
        {
        	
        	(z1 == 0 && z2 == nil && z3 == nil) || (z2 == 0 && z1 == nil && z3 == nil) || (z3 == 0 && z1 == nil && z2 == nil)
        
        }
    )
    =>
    (printout t "One horizontal bot + 1p" crlf)
)

(defrule ovl
    (tabla(x1 ?x1)(y1 ?y1)(z1 ?z1)
        {
        	
        	(x1 == 0 && y1 == nil && z1 == nil) || (y1 == 0 && z1 == nil && x1 == nil) || (z1 == 0 && x1 == nil && y1 == nil)
        
        }
    )
    =>
    (printout t "One vertical left + 1p" crlf)
)

(defrule ovm
    (tabla(x2 ?x2)(y2 ?y2)(z2 ?z2)
        {
        	
        	(x2 == 0 && y2 == nil && z2 == nil) || (y2 == 0 && z2 == nil && x2 == nil) || (z2 == 0 && x2 == nil && y2 == nil)
        
        }
    )
    =>
    (printout t "One vertical mid + 1p" crlf)
)

(defrule ovr
    (tabla(x3 ?x3)(y3 ?y3)(z3 ?z3)
        {
        	
        	(x3 == 0 && y3 == nil && z3 == nil) || (y3 == 0 && z3 == nil && x3 == nil) || (z3 == 0 && x3 == nil && y3 == nil)
        
        }
    )
    =>
    (printout t "One vertical right + 1p" crlf)
)

(defrule od1
    (tabla(x1 ?x1)(y2 ?y2)(z3 ?z3)
        {
        	
        	(x1 == 0 && y2 == nil && z3 == nil) || (y2 == 0 && z3 == nil && x1 == nil) || (z3 == 0 && y2 == nil && x1 == nil)
        
        }
    )
    =>
    (printout t "One first diagonal + 1p" crlf)
)

(defrule od2
    (tabla(x3 ?x3)(y2 ?y2)(z1 ?z1)
        {
        	
        	(x3 == 0 && y2 == nil && z1 == nil) || (y2 == 0 && z1 == nil && x3 == nil) || (z1 == 0 && y2 == nil && x3 == nil)
        
        }
    )
    =>
    (printout t "One second diagonal + 1p" crlf)
)


(defrule tht
    (tabla(x1 ?x1)(x2 ?x2)(x3 ?x3)
        {
        	
        	(x1 == x2 && x3 == nil && x1 == 0) || (x2 == x3 && x1 == nil && x2 == 0) || (x1 == x3 && x2 == nil && x3 == 0)
        
        }
    )
    =>
    (printout t "Two horizontal top + 2p" crlf)
    
)

(defrule thm
    (tabla(y1 ?y1)(y2 ?y2)(y3 ?y3)
        {
        	
        	(y1 == y2 && y3 == nil && y1 == 0) || (y2 == y3 && y1 == nil && y2 == 0) || (y1 == y3 && y2 == nil && y3 == 0)
        
        }
    )
    =>
    (printout t "Two horizontal mid + 2p" crlf)
)

(defrule thb
    (tabla(z1 ?z1)(z2 ?z2)(z3 ?z3)
        {
        	
        	(z1 == z2 && z3 == nil && z1 == 0) || (z2 == z3 && z1 == nil && z2 == 0) || (z1 == z3 && z2 == nil && z3 == 0)
        
        }
    )
    =>
    (printout t "Two horizontal bot + 2p" crlf)
)

(defrule tvl
    (tabla(x1 ?x1)(y1 ?y1)(z1 ?z1)
        {
        	
        	(x1 == y1 && z1 == nil && x1 == 0) || (y1 == z1 && x1 == nil && y1 == 0) || (x1 == z1 && y1 == nil && x1 == 0)
        
        }
    )
    =>
    (printout t "Two vertical left + 2p" crlf)
)

(defrule tvm
    (tabla(x2 ?x2)(y2 ?y2)(z2 ?z2)
        {
        	
        	(x2 == y2 && z2 == nil && x2 == 0) || (y2 == z2 && x2 == nil && y2 == 0) || (x2 == z2 && y2 == nil && x2 == 0)
        
        }
    )
    =>
    (printout t "Two vertical mid + 2p" crlf)
)

(defrule tvr
    (tabla(x3 ?x3)(y3 ?y3)(z3 ?z3)
        {
        	
        	(x3 == y3 && z3 == nil && x3 == 0) || (y3 == z3 && x3 == nil && y3 == 0) || (x3 == z3 && y3 == nil && x3 == 0)
        
        }
    )
    =>
    (printout t "Two vertical right + 2p" crlf)
)

(defrule td1
    (tabla(x1 ?x1)(y2 ?y2)(z3 ?z3)
        {
        	
        	(x1 == y2 && z3 == nil && x1 == 0) || (y2 == z3 && x1 == nil && y2 == 0) || (x1 == z3 && y2 == nil && x1 == 0)
        
        }
    )
    =>
    (printout t "Two first diagonal + 2p" crlf)
)

(defrule td2
    (tabla(x3 ?x3)(y2 ?y2)(z1 ?z1)
        {
        	
        	(x2 == y2 && z1 == nil && x3 == 0) || (y2 == z1 && x3 == nil && y2 == 0) || (x3 == z1 && y2 == nil && x3 == 0)
        
        }
    )
    =>
    (printout t "Two second diagonal + 2p" crlf)
)


(run)