(deftemplate parent
    (slot name)
    (slot child)
    (slot relation)
)

(deftemplate family
    (slot child)
    (slot father)
    (slot mother)
)

(deftemplate person
    (slot name)
    (slot role)
    (slot gender)
)

(deffacts family-facts
    (parent (name Tom) (child John) (relation father))
    (parent (name Susan) (child John) (relation mother))
    (family (child John) (father Tom) (mother Susan))
    (person (name Tom) (role father) (gender male))
    (person (name Susan) (role mother) (gender female))
    (person (name John) (role son) (gender male))
)
