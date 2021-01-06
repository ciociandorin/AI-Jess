; SEND+   M=1   => SEND+
; MORE			   1ORE
;--------
; MONEY

; Y(D+E) mod 10 
;
; E=((D+E) div 10 + N+ R) mod 10
; 
; 
; N=E+1
;
;

(assert(cifra 0)(cifra 1)(cifra 2)(cifra 3)(cifra 4)(cifra 5)
    (cifra 6)(cifra 7)(cifra 8)(cifra 9)
    (litera C)(litera A)(litera T)(litera S)(litera X))


(deftemplate cripto 
    (slot litera)
    (slot cifra)
    )

(deftemplate produs (slot val))

(defrule init
    (litera ?l)
    (cifra ?c)
    =>
    (assert(cripto(litera ?l)(cifra ?c)))
    
    )

(defrule solutie
    
    (cripto(litera C)(cifra ?c &~0))
    (cripto(litera A)(cifra ?a &~ ?c))
    (cripto(litera T)(cifra ?t &~ ?a &~ ?c))
    (cripto(litera S)(cifra ?s &~ ?a &~ ?c &~?t))
                         
    =>
    
    (printout t " "?c ?a ?t ?s crlf)                    
    )
(run)