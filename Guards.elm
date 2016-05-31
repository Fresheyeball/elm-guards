module Guards
  exposing ((|=),(=>))

{-|

Basically under the covers, this is just more interesting tuple properties.

@docs (|=), (=>)
-}


infixr 0 |=
{-| infix for new line -}
(|=) : (Bool, a) -> a -> a
(|=) p x =
  case p of
    (False, _) -> x
    (_,     y) -> y



infixr 3 =>
{-| infix for expression -}
(=>) : Bool -> a -> (Bool, a)
(=>) = (,)
