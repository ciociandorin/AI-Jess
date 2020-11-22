; - cer roșu → cer senin ( !precipitații, ger)                      
; - ceata seara/dimineața → cald                                    
; - nori cumulus → vreme buna                                       
; - nori cumulus + vânt N→E ⇒ nori nimbostratus                    
; - nori cirrocumulus + vânt N→E ⇒ ploaie                          
; - nori stratocumulus + vânt NE→S ⇒ nori cumulonimbus
; - nori nimbostratus + vânt SV→N ⇒ ploaie scurta
; - nori nimbostratus + vânt NE→S ⇒ ploaie lunga
; - nori cumulonimbus + vizibili înainte de miezul nopții ⇒ zăpadă
; - nori cirrostratus + vânt NE→S ⇒ ploaie înainte cu 15-24 ore
; - nori altostratus + vânt NE→S ⇒ ploaie inaite cu o zi (cer innorat)
; - nori altocumulus + vânt N→S ⇒ ploaie cu 15-20 înainte*/

; SABLOANE
; (multislot ziua) doar pentru identificare

(deftemplate Specificatii
    (multislot ziua)
    (slot timp)
    (multislot cer)
    (multislot ceata)
    (slot nori)
    (multislot vant))

; FAPTE
; daca regulile sunt stricte si nu includ alte specificatii restul declararilor de vor face nil

(assert (Specificatii(ziua Ziua A)(cer rosu)))
(assert (Specificatii(ziua Ziua B)(timp dimineata)(ceata 1)))
(assert (Specificatii(ziua Ziua C)(nori cumulus)))
(assert (Specificatii(ziua Ziua D)(nori cumulus)(vant N E)))
(assert (Specificatii(ziua Ziua E)(nori cirrocumulus)(vant N E)))
(assert (Specificatii(ziua Ziua F)(nori stratocumulus)(vant NE S)))
(assert (Specificatii(ziua Ziua G)(nori nimbostratus)(vant SV N)))
(assert (Specificatii(ziua Ziua H)(nori nimbostratus)(vant NE S)))
(assert (Specificatii(ziua Ziua I)(timp seara)(nori cumulonimbus)))
(assert (Specificatii(ziua Ziua J)(nori cirrostratus)(vant NE S)))
(assert (Specificatii(ziua Ziua K)(nori altostratus)(vant NE S)))
(assert (Specificatii(ziua Ziua L)(nori altocumulus)(vant N S)))



; REGULI

(defrule cerSenin (Specificatii(ziua $?ziua)(cer rosu))
    =>
    (printout t ?ziua ": Cer senin maine." crlf)) 

(defrule cald (or (Specificatii(ziua $?ziua)(timp seara)(ceata 1)) (Specificatii(ziua $?ziua)(timp dimineata)(ceata 1)))
    =>
    (printout t ?ziua ": Cald." crlf))

(defrule vremeBuna (Specificatii(ziua $?ziua)(nori cumulus))
    =>
    (printout t ?ziua ": Vreme buna." crlf)) 

(defrule noriNimbostratus (Specificatii(ziua $?ziua)(nori cumulus)(vant N E))
    =>
    (printout t ?ziua ": Nori nimbostratus." crlf))

(defrule ploaie (Specificatii(ziua $?ziua)(nori cirrocumulus)(vant N E))
    =>
    (printout t ?ziua ": Ploaie." crlf))

(defrule noriCumulonimbus (Specificatii(ziua $?ziua)(nori stratocumulus)(vant NE S))
    =>
    (printout t ?ziua ": Nori cumulonimbus." crlf))

(defrule ploaieScurta (Specificatii(ziua $?ziua)(nori nimbostratus)(vant SV N))
    =>
    (printout t ?ziua ": Ploaie scurta." crlf))

(defrule ploaieLunga (Specificatii(ziua $?ziua)(nori nimbostratus)(vant NE S))
    =>
    (printout t ?ziua ": Ploaie lunga." crlf))

(defrule zapada (Specificatii(ziua $?ziua)(timp seara)(nori cumulonimbus))
    =>
    (printout t ?ziua ": Zapada." crlf))

(defrule ploaie1524 (Specificatii(ziua $?ziua)(nori cirrostratus)(vant NE S))
    =>
    (printout t ?ziua ": Ploaie dupa 15-24 ore." crlf))

(defrule ploaieZi (Specificatii(ziua $?ziua)(nori altostratus)(vant NE S))
    =>
    (printout t ?ziua ": Ploaie inainte cu o zi." crlf))

(defrule ploaie1520 (Specificatii(ziua $?ziua)(nori altocumulus)(vant N S))
    =>
    (printout t ?ziua ": Ploaie inainte cu o 15-20 ore." crlf))

(run)