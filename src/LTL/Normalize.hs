module LTL.Normalize
    ( desugar
    , toNNF
    ) where

import LTL.Syntax

desugar :: LTL -> LTL

-- Atomic propositions and constants
desugar Top      = Top
desugar Bottom   = Bottom
desugar (Atom p) = Atom p

-- Boolean operators
desugar (Not p) = Not (desugar p)

desugar (And p q) =
    And (desugar p) (desugar q)

desugar (Or p q) =
    Or (desugar p) (desugar q)

desugar (Implies p q) =
    Or (Not (desugar p)) (desugar q)

-- Temporal operators
desugar (Next p) =
    Next (desugar p)

desugar (Until p q) =
    Until (desugar p) (desugar q)

desugar (Release p q) =
    Release (desugar p) (desugar q)

desugar (Eventually p) =
    Until Top (desugar p)

desugar (Globally p) =
    Release Bottom (desugar p)

desugar (WeakUntil p q) =
    Or
        (Until (desugar p) (desugar q))
        (Release Bottom (desugar p))

toNNF :: LTL -> LTL
toNNF = nnf . desugar

nnf :: LTL -> LTL
nnf = go False
  where
    go :: Bool -> LTL -> LTL

    go neg Top =
        if neg then Bottom else Top

    go neg Bottom =
        if neg then Top else Bottom

    go neg (Atom p) =
        if neg then Not (Atom p) else Atom p

    go neg (Not p) =
        go (not neg) p

    go neg (And p q)
        | neg       = Or (go True p) (go True q)
        | otherwise = And (go False p) (go False q)

    go neg (Or p q)
        | neg       = And (go True p) (go True q)
        | otherwise = Or (go False p) (go False q)

    go neg (Next p) =
        Next (go neg p)

    go neg (Until p q)
        | neg       = Release (go True p) (go True q)
        | otherwise = Until (go False p) (go False q)

    go neg (Release p q)
        | neg       = Until (go True p) (go True q)
        | otherwise = Release (go False p) (go False q)

    -- These constructors are eliminated by desugar.
    go _ (Implies _ _) =
        error "nnf: unexpected Implies"

    go _ (Globally _) =
        error "nnf: unexpected Globally"

    go _ (Eventually _) =
        error "nnf: unexpected Eventually"

    go _ (WeakUntil _ _) =
        error "nnf: unexpected WeakUntil"