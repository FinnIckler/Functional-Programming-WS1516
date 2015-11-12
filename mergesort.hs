--Sortes a list

mergeSort :: (a -> a -> Bool) -> [a] -> [a]
mergeSort _     []     = []
mergeSort _     [x]    = [x]
mergeSort (<<<) xs = merge (<<<) (mergeSort (<<<) ls)
                                 (mergeSort (<<<) rs)
  where
    (ls,rs) = splitAt (length xs `div` 2) xs
    merge :: (a -> a -> Bool) -> [a] -> [a] -> [a]
    merge _         []         ys    = ys
    merge _         xs         []    = xs
    merge (<<<) l1@(x: xs) l2@(y:ys)
      | x <<< y   = x:merge (<<<) xs l2
      | otherwise = y:merge (<<<) l1 ys

main :: IO ()
main = print $ mergeSort (<) [1..100]
