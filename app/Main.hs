module Main where

import LTL.Syntax
import LTL.Normalize

main :: IO ()
main = do
    let p = Atom "p"
    let q = Atom "q"

    let formula = Not (Globally (Implies p (Eventually q)))

    print (toNNF formula)