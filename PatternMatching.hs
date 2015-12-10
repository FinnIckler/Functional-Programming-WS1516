module PatternMatching (Pattern,
lit, empty, fail,
alt, seq, rep,rep1) where
import           Prelude hiding (fail, seq)

type Pattern a = String -> [(a, String)]

lit :: Char -> Pattern Char
lit _ [] = []
lit c (x:xs) | c == x = [(c,xs)]
             | otherwise = []

empty :: a -> Pattern a
empty v xs = [(v,xs)]

fail :: Pattern a
fail _ = []

alt :: Pattern a -> Pattern a -> Pattern a
alt p q xs = p xs ++ q xs

seq :: (a -> b -> c) -> Pattern a -> Pattern b -> Pattern c
seq f p q xs = [ (f v1 v2, xs2) | (v1, xs1) <- p xs, (v2,xs2) <- q xs1]

rep :: Pattern a -> Pattern [a]
rep p = alt (seq (:) p (rep p)) (empty [])

rep1 :: Pattern a -> Pattern [a]
rep1 p = seq(:) p (rep p)
