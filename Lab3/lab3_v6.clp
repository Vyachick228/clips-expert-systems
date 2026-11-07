(deftemplate shrub
    (slot name)
    (multislot traits)
)

(deftemplate wanted
    (slot trait)
)

(deffacts shrubs
    (shrub (name TreeHydrangea)
        (traits urban container fast-growth))
    (shrub (name Oleander)
        (traits container))
    (shrub (name WaxMyrtle)
        (traits cold shade drought wet-soil))
    (shrub (name Honeysuckle)
        (traits urban easy-care fast-growth))
    (shrub (name Gardenia)
        (traits drought urban container easy-care fast-growth))
    (shrub (name CommonJuniper)
        (traits cold drought acidic-soil urban))
    (shrub (name AlderleafFlower)
        (traits cold shade wet-soil acidic-soil))
    (shrub (name TatarDogwood)
        (traits cold shade wet-soil easy-care fast-growth))
    (shrub (name JapaneseAucuba)
        (traits shade container))
    (shrub (name CanadianRhododendron)
        (traits cold drought))
)

; Example request: cold tolerance, shade tolerance, moist soil.
(deffacts required-traits
    (wanted (trait cold))
    (wanted (trait shade))
    (wanted (trait wet-soil))
)

(defrule recommend-shrub
    (shrub (name ?name) (traits $?traits))
    (exists (wanted (trait ?)))
    (not (wanted (trait ?required&:(not (member$ ?required ?traits)))))
    =>
    (printout t "Recommended shrub: " ?name crlf)
)
