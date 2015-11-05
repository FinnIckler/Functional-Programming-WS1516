type Dictionary a b = [(a,b)]
type Person = String
type Age = Integer

people :: Dictionary Person Age
people = [("Darth", 46), ("Chewie",200), ("Yoda", 902)]

ageOf :: Dictionary Person Age -> Person -> Maybe Age
-- The old way
--ageOf pas p | fst (head pas) == p = snd (head pas)
--            | otherwise           = ageOf (tail pas) p
ageOf []          p'             = Nothing
ageOf ((p,a):pas) p' | p == p'   = Just a
                     | otherwise = ageOf pas p'

main :: IO ()
main = do
  print $ ageOf people "Luke"
