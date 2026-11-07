(defrule find-men
    (person (name $?name) (gender male))
    =>
    (printout t "Man: " (implode$ $?name) crlf)
)
