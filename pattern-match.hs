import           PatternMatching
import           Prelude         ()


fortytwo :: Pattern (Char, Char)
fortytwo = seq (,) (lit '4') (lit '2')

digit :: Pattern Char
digit = lit '0' `alt` lit '1' `alt` lit '2' `alt`  lit '3' `alt`  lit '4' `alt`
        lit '5' `alt`  lit '6' `alt`  lit '7' `alt` lit '8' `alt` lit '9'

number :: Pattern String
number = rep digit

smiley :: Pattern String
smiley = seq (:) (alt (lit ':') (lit ';'))
                 (seq (:) (lit '-'))
                          (seq (:) (alt (lit '(') (lit ')'))
                                    (empty []))

main :: IO()
main = do
