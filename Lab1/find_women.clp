(defrule find-women
    (person (name $?name) (gender female))
    =>
    (printout t "Woman: " (implode$ $?name) crlf)
)
