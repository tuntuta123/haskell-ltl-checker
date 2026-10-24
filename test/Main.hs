assertEqual
    "De Morgan"
    (Or (Not (Atom "p")) (Not (Atom "q")))
    (toNNF (Not (And (Atom "p") (Atom "q"))))

assertEqual
    "Negated Until"
    (Release (Not (Atom "p")) (Not (Atom "q")))
    (toNNF (Not (Until (Atom "p") (Atom "q"))))

assertEqual
    "Double negation"
    (Atom "p")
    (toNNF (Not (Not (Atom "p"))))

assertEqual
    "Negated Globally"
    (Until Top (Not (Atom "p")))
    (toNNF (Not (Globally (Atom "p"))))