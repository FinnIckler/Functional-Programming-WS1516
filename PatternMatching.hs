module PatternMatching (Pattern,
                        module Prelude,
                        lit, empty, fail,
                        alt, seq, rep, rep1,
                        alts, seqs, lits, app) where

import           Prelude hiding (fail, seq)

-- Given a string, a pattern returns the (possibly empty) list of
-- possible matches.  A match consists of a match value (e.g., matched
-- the matched character(s), token, or parse tree) and the residual string
-- left to match:

type Pattern a = String -> [(a, String)]

-- BASIC PATTERNS

-- match character c, returning the matched character
lit ::  Char -> Pattern Char
lit _c []                 = []
lit c  (x:xs) | c == x    = [(c, xs)]
              | otherwise = []

-- match the empty string, return v
empty :: a -> Pattern a
empty v xs = [(v, xs)]

-- fail always (yields empty list of matches)
fail :: Pattern a
fail _ = []

-- COMBINE PATTERNS

-- match p or q
alt :: Pattern a -> Pattern a -> Pattern a
alt p q xs = p xs ++ q xs

-- match p and q in sequence (use f to combine match values)
seq :: (a -> b -> c) -> Pattern a -> Pattern b -> Pattern c
seq f p q xs = concat (map (\(v1, xs1) ->
                         map (\(v2, xs2) -> (f v1 v2, xs2))
                             (q xs1))
                         (p xs))

-- An alternative (more consise and readable) implementation of seq
-- based on list comprehension syntax:
--
-- seq f p q xs = [ (f v1 v2, xs2) | (v1, xs1) <- p xs, (v2, xs2) <- q xs1 ]

-- match p repeatedly (including 0 times)
rep :: Pattern a -> Pattern [a]
rep p = alt (seq (:) p (rep p)) (empty [])

-- match p repeatedly, but at least once
rep1 :: Pattern a -> Pattern [a]
rep1 p = seq (:) p (rep p)

-- CONVENIENCE

-- build "or" choice pattern from a list of alternatives
alts :: [Pattern a] -> Pattern a
alts = foldr alt fail

-- build "and" sequence pattern from a list of patterns
seqs :: [Pattern a] -> Pattern [a]
seqs = foldr (seq (:)) (empty [])

-- match a string (= sequence of characters)
lits :: String -> Pattern String
lits cs = seqs [ lit c | c <- cs ]

-- apply function f to match value (for match post-processing)
app :: (a -> b) -> Pattern a -> Pattern b
app f p xs = [ (f v1, xs1) | (v1, xs1) <- p xs ]

{-

-- Using rep leads to longest match first:

rep p xs
  = alt (seq (:) p (rep p)) (empty []) xs
  = seq (:) p (rep p) xs ++ empty [] xs
  = seq (:) p (rep p) xs ++ [([], xs)]
  = [ (v1:v2, xs2) | (v1,xs1) <- p xs, (v2,xs2) <- rep p xs1 ] ++ [([], xs)]


rep P'a' "aab"
  = [ (v1:v2, xs2) | (v1,xs1) <- P'a' "aab", (v2,xs2) <- rep P'a' xs1 ] ++ [([], "aab")]
  = [ (v1:v2, xs2) | (v1,xs1) <- [('a',"ab")], (v2,xs2) <- rep P'a' xs1 ] ++ [([], "aab")]
  = [ ('a':v2,xs2) | (v2,xs2) <- rep P'a' "ab" ] ++ [([], "aab")]

-}
