import           Prelude         hiding (fail, seq)

import           PatternMatching

-- Make use of the fact that the pattern matching DSL is *embedded*
-- into Haskell: define new functions (abstractions) that combine
-- simple patterns

-- Example:
--
-- Match a fully parenthesized arithmetic expression over integers,
-- e.g. ((4*10)+2)


-----------------------------------------------------------------------
-- Variant 1: return list of matched characters

digit :: Pattern Char
digit = alts [ lit d | d <- ['0'..'9'] ]

number :: Pattern String
number = rep1 digit

op :: Pattern String
op = alts [ lits o | o <- ["+", "-", "*", "/"] ]

expr :: Pattern String
expr = alts [ number, app concat (seqs [lits "(", expr, op, expr, lits ")"]) ]


-----------------------------------------------------------------------
-- Variant 2: return a simple AST for the matched expression

data Expr a =
    Num a
  | Op (Expr a) String (Expr a)
  deriving (Show)

number' :: Pattern (Expr Integer)
number' = app (Num . read) (rep1 digit)

expr' :: Pattern (Expr Integer)
expr' = alts [ number', seq (\_ (e1,(o,(e2,_))) -> Op e1 o e2)
                            (lit '(') (seq (,)
                                      expr' (seq (,)
                                            op (seq (,)
                                               expr' (lit ')'))))
             ]

-----------------------------------------------------------------------

main :: IO ()
main = do
  print $ rep1 digit "1234.56"
  print $ lits "abc" "abcdef"
  print $ expr "((4*10)+2)"
  print $ expr' "((4*10)+2)"
