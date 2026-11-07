(deftemplate choices
    (slot name)
    (multislot positions))

(deftemplate assigned
    (slot name)
    (slot position))

(deffacts baseball
    (choices (name Andy) (positions pitcher first third))
    (choices (name Ed) (positions first shortstop))
    (choices (name Harry) (positions pitcher first shortstop))
    (choices (name Paul) (positions first))
    (choices (name Allen) (positions catcher first third shortstop))
    (choices (name Sam) (positions left))
    (choices (name Bill) (positions pitcher first left center right))
    (choices (name Jerry) (positions first second shortstop left))
    (choices (name Mike) (positions center right))
    (taller Bill Mike))

(defrule remove-occupied-position
    (declare (salience 20))
    (assigned (name ?name) (position ?role))
    ?c <- (choices (name ?other)
                   (positions $?before ?role $?after))
    (test (neq ?other ?name))
    =>
    (modify ?c (positions $?before $?after)))

(defrule decide-by-height
    (declare (salience 15))
    (taller Bill Mike)
    ?b <- (choices (name Bill) (positions center right))
    ?m <- (choices (name Mike) (positions center right))
    =>
    (modify ?b (positions center))
    (modify ?m (positions right)))

(defrule assign-only-choice
    (declare (salience 10))
    (choices (name ?name) (positions ?role))
    (not (assigned (name ?name)))
    =>
    (assert (assigned (name ?name) (position ?role))))

(defrule show-player
    (declare (salience -10))
    (assigned (name ?name) (position ?position))
    =>
    (printout t ?position ": " ?name crlf))
