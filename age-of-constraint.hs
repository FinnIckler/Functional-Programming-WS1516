type Dictionary a b = [(a,b)]

ageOf :: Eq a => Dictionary a b -> a -> Maybe b
ageOf []               _         = Nothing
ageOf ((p',a):pas) p | p == p'   = Just a
                     | otherwise = ageOf pas p
