(defglobal ?*Psec* = 100)
(defglobal ?*Pdulce* = 90)

(defglobal ?*Palbsec* = 80)
(defglobal ?*Prosusec* = 70)
(defglobal ?*Prosudulce* = 60)
(defglobal ?*Palbdulce* = 50)

(defglobal ?*Pslab* = 40)
(defglobal ?*Ptare* = 30)
(defglobal ?*Pnou* = 20)
(defglobal ?*Pvechi* = 10)

(deftemplate Meniu(multislot mancare)(slot vin)(slot procentajAlcool)(slot anProductie))
(deffacts Local   
    (Meniu(mancare crab)(vin rose)(procentajAlcool 23)(anProductie 2010))
    (Meniu(mancare orez cu stake de vita)(vin rosu)(procentajAlcool 12)(anProductie 1992))
    (Meniu(mancare calamar)(vin alb-sec)(procentajAlcool 30)(anProductie 2014))
    (Meniu(mancare dovleac in ou)(vin alb-demisec)(procentajAlcool 25)(anProductie 2018))
    (Meniu(mancare salata ruseasca)(vin alb)(procentajAlcool 10)(anProductie 2018))
    (Meniu(mancare carne alba)(vin rosu-dulce)(procentajAlcool 9)(anProductie 2020))
    (Meniu(mancare rata umpluta)(vin rosu-demisec)(procentajAlcool 17)(anProductie 2013))
    (Meniu(mancare clatite)(vin rosu-sec)(procentajAlcool 30)(anProductie 1998))
    (Meniu(mancare sos ciuperci)(vin rosu)(procentajAlcool 29)(anProductie 1998))
    (Meniu(mancare carne vita)(vin rosu-semidulce)(procentajAlcool 19)(anProductie 1995))
    (Meniu(mancare branza de capra)(vin rosu-sec)(procentajAlcool 23)(anProductie 2000))
    (Meniu(mancare tort)(vin alb-dulce)(procentajAlcool 20)(anProductie 2001))
    (Meniu(mancare prajitura)(vin sampanie)(procentajAlcool 5)(anProductie 2006))
    (Meniu(mancare fileu peste)(vin alb-dulce)(procentajAlcool 17)(anProductie 2018))
    (Meniu(mancare carne alba)(vin rose)(procentajAlcool 14)(anProductie 2017))
    (Meniu(mancare gogosi)(vin alb-semidulce)(procentajAlcool 12)(anProductie 2019))    
)
(reset) ;activeaza regulile atunci cand avem un deffacts, introduce initial-fact pe pozitia 0 in lista de fapte.
(facts)
(run)


(defrule vinuriSimple 
	(Meniu(mancare ?m)(vin ?v)(procentajAlcool ?t)(anProductie ?ve){
    	vin == alb || vin == rosu || vin == rose
    })
    =>    
    (printout t "Pentru mancarea complexa " ?m  " se serveste vinul simplu " ?v ", avand taria " ?t ", respectiv vechimea " ?ve crlf)
)
(run)

(defrule vinuriComplexe
	(Meniu(mancare ?m)(vin ?v)(procentajAlcool ?t)(anProductie ?ve){
    	(vin != alb && vin != rosu && vin != rose) || (vin == sampanie)
    })    
    =>    
    (printout t "Pentru mancarea simpla " ?m  " se serveste vinul complex " ?v ", avand taria " ?t ", respectiv vechimea " ?ve crlf)
)
(run)


(defrule selectieSeci
    (declare (salience ?*Psec*))
	(Meniu(mancare ?m)(vin ?v)(procentajAlcool ?t)(anProductie ?ve){
   		vin == alb-sec || vin == alb-demisec || vin == rosu-sec || vin == rosu-demisec
    })  
    =>
    (printout t "Pentru mancarea " ?m  " se serveste vinul " ?v ", avand taria " ?t ", respectiv vechimea " ?ve crlf)
)

(defrule selectieDulci
    (declare (salience ?*Pdulce*))
	(Meniu(mancare ?m)(vin ?v)(procentajAlcool ?t)(anProductie ?ve){
   		vin == alb-dulce || vin == alb-semidulce || vin == rosu-dulce || vin == rosu-semidulce
    })  
    =>
    (printout t "Pentru mancarea " ?m  " se serveste vinul " ?v ", avand taria " ?t ", respectiv vechimea " ?ve crlf)
)

(run)


(defrule selectieAlbSec
    (declare (salience ?*Palbsec*))
    (Meniu(mancare ?m)(vin ?v){
    	vin == alb-sec || vin == alb-demisec
        
    })
    =>
    (printout t "Mancarea care se recomanda cu vinul alb-sec sau alb-demisec este: " ?m crlf)
)

(defrule selectieRosuSec
    (declare (salience ?*Prosusec*))
    (Meniu(mancare ?m)(vin ?v){
    	vin == rosu-sec || vin == rosu-demisec       
    })
    =>
    (printout t "Mancarea care se recomanda cu vinul rosu-sec sau rosu-demisec este: " ?m crlf)
)

(defrule selectieAlbDulce
    (declare (salience ?*Palbdulce*))
    (Meniu(mancare ?m)(vin ?v){
    	vin == alb-dulce || vin == alb-semidulce       
    })
    =>
    (printout t "Mancarea care se recomanda cu vinul alb-dulce sau alb-semidulce este: " ?m crlf)
)

(defrule selectieRosuDulce
    (declare (salience ?*Prosudulce*))
    (Meniu(mancare ?m)(vin ?v){
    	vin == rosu-dulce || vin == rosu-semidulce       
    })
    =>
    (printout t "Mancarea care se recomanda cu vinul rosu-dulce sau rosu-semidulce este: " ?m crlf)
)


(defrule vinuriSlabe
    (declare (salience ?*Pslab*))
    (Meniu(vin ?v)(procentajAlcool ?pa){
        procentajAlcool <= 20
    })
    =>
    (printout t "Vinul recomandat pentru incepatori este: " ?v ", deoarece contine mai putin de 20% alcool, mai precis " ?pa "%." crlf)
)

(defrule vinuriMaiTari
    (declare (salience ?*Ptare*))
    (Meniu(vin ?v)(procentajAlcool ?pa){
        procentajAlcool > 20
    })
    =>
    (printout t "Vinul recomandat ulterior este: " ?v ", deoarece contine mai mult de 20% alcool, mai precis " ?pa "%." crlf)
)


(defrule vinuriNoi
	(declare (salience ?*Pnou*))
    (Meniu(vin ?v)(anProductie ?an){
        anProductie >= 2015
    })
    =>
    (printout t "Vinul recomandat la inceputul unei mese este: " ?v " deoarece este vin nou, din anul " ?an crlf)	      
)

(defrule vinuriVechi
	(declare (salience ?*Pvechi*))
    (Meniu(vin ?v)(anProductie ?an){
        anProductie < 2015
    })
    =>
    (printout t "Vinul recomandat dupa inceputul mesei este: " ?v " deoarece este vin vechi, chiar din anul " ?an crlf)	      
)



(defrule Spumante
    (Meniu(vin ?v){
        vin == sampanie
    })
    =>
    (printout t "De recomandat este ca vinurile spumante sa se serveasca dupa tot setul de vinuri selectate. Anume: " ?v crlf)
    )

(defrule IntregParcursulPranzului
    (Meniu(vin ?v){
        vin == alb-sec || vin == alb-demisec || vin == rosu-sec || vin == rosu-demisec
   	})
    =>
    (printout t "In timpul pranzului este favorabil sa se serveasca: " ?v ", insa se accepta si toata gama de vinuri." crlf)
    )

(defrule FinePranz
    (Meniu(vin ?v)(anProductie ?ap)(procentajAlcool ?pa){
        vin == rosu || vin == rosu-sec || vin == rosu-demisec || vin == rosu-dulce || vin == rosu-semidulce
    })
    =>
    (printout t "La finea pranzului se recomand consumul: " ?v " din " ?ap " cu: " ?pa "% prezenta de alcool."  crlf)
    )


(run 20) ;afiseaza doar primele 20 de reguli


