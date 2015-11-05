-- Merge two sorted lists respecting their orderings
--
-- merge (<) [0,3,5] [1,2,4] = [0,1,2,3,4,5]

merge :: (a -> a -> Bool) -> [a] -> [a] -> [a]
merge _         []         ys    = ys
merge _         xs         []    = xs
merge (<<<) l1@(x: xs) l2@(y:ys) | x <<< y   = x:merge (<<<) xs l2
                                 | otherwise = y:merge (<<<) l1 ys

main :: IO ()
main = print $ merge (<) [1,3..19] [2,4..20]
