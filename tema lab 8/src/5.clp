; Reguli enunt

; - mâncăruri complicate ⇒ vinuri simple
; - mâncăruri simple ⇒ vinuri complexe
; - vin sec alb/roșu → ~~vin dulceag~~ → vin sec alb/roșu
; - vin alb sec → vin roșu sec
; - vin roșu → vin alb foarte dulce
; - vin slab → vin tare
; - vin nou → vin vechi
; - vin nespumant → vin șampanie/spumant → !~~vin nespumant~~
; - !~~vin nespumant~~ → vin șampanie/spumant → vin nespumant
; - finele pranzului → vin rosu
; - finele pranzului → vin licuros
; - parcursul pranzului → vin sec alb/rosu/toata gama

; Reguli declarate

; carene porc ⇒ vin rous sec
; carne vita ⇒ vin rosu sec
; carne miel ⇒ vin rosu sec
; vanat ⇒ vin rosu sec
; carne pui ⇒ vin alb sec
; carne curcan ⇒ vin rosu sec
; peste ⇒ vin alb sec
; peste afumat ⇒ vin alb
; supa de pui ⇒ vin dulceag
; supa de legume ⇒ vin alb dulce
; carne de pasare ⇒ vin rosu
; carne burta de vaca ⇒ vin tare
; carne spate de vaca ⇒ vin slab
; grasime de rata ⇒ vin nou
; gasime de porc ⇒ vin vechi
; legume ⇒ vin nespumant
; cartofi la cuptor ⇒ vin spumant

; SABLOANE

(deftemplate Meniu
    (multislot comanda)
    (multislot felul1)
    (multislot felul2)
    (multislot felul3)
    (multislot timp))

; FAPTE

(assert(Meniu(comanda Comanda A)(felul2 carne de porc)))
(assert(Meniu(comanda Comanda B)(felul2 carne de vita)))
(assert(Meniu(comanda Comanda C)(felul2 carne de miel)))
(assert(Meniu(comanda Comanda D)(felul2 vanat)))
(assert(Meniu(comanda Comanda E)(felul2 carne de pui)))
(assert(Meniu(comanda Comanda F)(felul2 carne de curcan)))
(assert(Meniu(comanda Comanda G)(felul2 peste)))
(assert(Meniu(comanda Comanda H)(felul2 peste afumat)))
(assert(Meniu(comanda Comanda I)(felul1 supa de pui)))
(assert(Meniu(comanda Comanda J)(felul1 supa de pui)(felul2 peste afumat)(felul3 supa de pui)))
(assert(Meniu(comanda Comanda K)(felul1 carne de porc)(felul2 carne de pui)))
(assert(Meniu(comanda Comanda L)(felul1 supa de legume)(felul2 carne de pasare)))
(assert(Meniu(comanda Comanda M)(felul1 carne spate de vaca)(felul2 carne burta de vaca)))
(assert(Meniu(comanda Comanda N)(felul1 grasime de porc)(felul2 grasime de rata)))
(assert(Meniu(comanda Comanda O)(felul1 legume)(felul2 cartofi la cuptor)(felul3 legume)))
(assert(Meniu(comanda Comanda P)(timp finele pranzului)))
(assert(Meniu(comanda Comanda Q)(timp parcursul pranzului)))

; REGULI

(defrule VRS1 (Meniu(comanda $?comanda)(felul2 carne de porc))
    =>
    (printout t ?comanda ": Pentru felul 2 va recomanda un vin rosu sec." crlf)) 

(defrule VRS2 (Meniu(comanda $?comanda)(felul2 carne de vita))
    =>
    (printout t ?comanda ": Pentru felul 2 va recomanda un vin rosu sec." crlf)) 

(defrule VRS3 (Meniu(comanda $?comanda)(felul2 carne de miel))
    =>
    (printout t ?comanda ": Pentru felul 2 va recomanda un vin rosu sec." crlf)) 

(defrule VRS4 (Meniu(comanda $?comanda)(felul2 vanat))
    =>
    (printout t ?comanda ": Pentru felul 2 va recomanda un vin rosu sec." crlf)) 

(defrule VAS1 (Meniu(comanda $?comanda)(felul2 carne de pui))
    =>
    (printout t ?comanda ": Pentru felul 2 va recomanda un vin alb sec." crlf)) 

(defrule VRS5 (Meniu(comanda $?comanda)(felul2 carne de curcan))
    =>
    (printout t ?comanda ": Pentru felul 2 va recomanda un vin rosu sec." crlf)) 

(defrule VAS2 (Meniu(comanda $?comanda)(felul2 peste))
    =>
    (printout t ?comanda ": Pentru felul 2 va recomanda un vin alb sec." crlf)) 

(defrule VA1 (Meniu(comanda $?comanda)(felul2 peste afumat))
    =>
    (printout t ?comanda ": Pentru felul 2 va recomanda un vin alb." crlf)) 

(defrule VD1 (Meniu(comanda $?comanda)(felul1 supa de pui))
    =>
    (printout t ?comanda ": Pentru felul 1 va recomanda un vin dulceag." crlf)) 

; tura re reguli 2 (reguli enunt)

(defrule VDS1 (Meniu(comanda $?comanda)(felul1 supa de pui)(felul2 peste afumat)(felul3 supa de pui))
    =>
    (printout t ?comanda ": Pentru felul 1 sau 3 va recomanda un vin dulceag si pentru felul 2 va recomandam un vin rosu sec." crlf)) 

(defrule VASRS1 (Meniu(comanda $?comanda)(felul1 carne de porc)(felul2 carne de pui))
    =>
    (printout t ?comanda ": Va recomandam sa schimbati ordinea felurilor pentru a servii vinul alb sec inaintea celui rosu sec." crlf)) 

(defrule VRAFD1 (Meniu(comanda $?comanda)(felul1 supa de legume)(felul2 carne de pasare))
    =>
    (printout t ?comanda ": Va recomandam sa schimbati ordinea felurilor pentru a servii vinul rosu inaintea celui alb foarte dulce." crlf)) 

(defrule VST1 (Meniu(comanda $?comanda)(felul1 carne spate de vaca)(felul2 carne burta de vaca))
    =>
    (printout t ?comanda ": Va recomandam sa schimbati ordinea felurilor pentru a servii vinul slab inaintea celui tare." crlf)) 

(defrule VNV1 (Meniu(comanda $?comanda)(felul1 grasime de porc)(felul2 grasime de rata))
    =>
    (printout t ?comanda ": Va recomandam sa schimbati ordinea felurilor pentru a servii vinul nou inaintea celui vechi." crlf)) 

(defrule VNS1 (Meniu(comanda $?comanda)(felul1 legume)(felul2 cartofi la cuptor)(felul3 legume))
    =>
    (printout t ?comanda ": Va recomandam sa renuntati la felul 1 sau 3 pentru a nu servi vinul spumant intre doua vinuri nespumante." crlf)) 

(defrule VRL1 (Meniu(comanda $?comanda)(timp finele pranzului))
    =>
    (printout t ?comanda ": Va recomandam dupa ce terminati sa serviti un vin rosu sau licuros." crlf)) 

(defrule VTG1 (Meniu(comanda $?comanda)(timp parcursul pranzului))
    =>
    (printout t ?comanda ": Va recomandam un vin alb/rosu sec toata gama." crlf)) 

(run)