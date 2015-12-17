import           Prelude hiding (min)

min :: Ord a => [a] -> a
min = head . isort (<)

isort :: Ord a => (a -> a -> Bool) -> [a] -> [a]
isort (<<<) []       = []                       --[isort.1]
isort (<<<) (x:xs)   = ins x (isort (<<<) xs)   --[isort.2]
  where
    ins x []           = [x]                    --[isort.1]
    ins x (y:ys)       | x <<< y = x:y:ys       --[isort.2]
                       | otherwise = y:ins x ys --[isort.3]
main :: IO ()
main = do
  print $ isort (<) [8,6,1,7,5]
  print $ min [8,6,1,7]
