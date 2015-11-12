data List a = Nil
            | Cons a (List a)
  deriving(Show)

toList :: [a] -> List a
toList []  = Nil
toList (x:xs) = Cons x (toList xs)

fromList :: List a -> [a]
fromList Nil = []
formList (Cons x xs) = x:fromList xs

mapList :: (a -> b) -> List a -> List b
mapList f  Nil        = Nil
mapList f (Cons x xs) = Cons (f x) (mapList f xs)

liftList f = toList . f . fromList

mapList' :: (a -> b) -> List a -> List b
mapList' f xs = liftList (map f) xs

filterList :: (a -> Bool) -> List a -> List a
filterList _ Nil                   = Nil
filterList p (Cons x xs) | p x     = Cons x (filterList p xs)
                         | otherwise = filterList p xs
                         
filterList' :: (a -> Bool) -> List a -> List a
filterList' p xs = liftList (filter p) xs

main :: IO()
main = do
  print $ mapList (+1) $ toList[1..5]
  print $ formList $ filterList (> 3) $ mapList (+1) $ toList [1..5]
