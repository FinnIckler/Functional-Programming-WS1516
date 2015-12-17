import           Prelude hiding (fst)

fst :: (a,b) -> a
fst (x,y) = x

sqr :: Num a => a -> a
sqr a = a * a
bomb :: [String]
bomb = "📌" : bomb
main = print $ fst (sqr (1 + 3),bomb)
