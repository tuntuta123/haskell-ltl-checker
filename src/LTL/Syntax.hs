module LTL.Syntax
    ( LTL(..)
    ) where

data LTL
    = Top
    | Bottom
    | Atom String
    | Not LTL
    | And LTL LTL
    | Or LTL LTL
    | Implies LTL LTL
    | Next LTL
    | Until LTL LTL
    | WeakUntil LTL LTL
    | Release LTL LTL
    | Globally LTL
    | Eventually LTL
    deriving (Eq, Ord, Show)