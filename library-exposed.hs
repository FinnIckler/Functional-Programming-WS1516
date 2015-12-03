import Data.List (nub)

type IntegerSet = [Integer]

s1,s2 :: IntegerSet
s1 = insert 1 (insert 2 (insert 3 empty))
s2 = foldr insert empty [1..10]

empty :: IntegerSet
empty = []

insert :: Integer -> IntegerSet -> IntegerSet
insert x xs = x:xs

delete :: Integer -> IntegerSet -> IntegerSet

delete x xs = filter (/= x) xs

(∈) :: Integer -> IntegerSet -> Bool
x ∈ xs = elem x xs

(⊆) :: IntegerSet -> IntegerSet -> Bool
xs ⊆ ys = all (\x -> x ∈ ys) xs

card :: IntegerSet -> Int
card xs = length (nub xs)

main :: IO ()
main = print $ 1 ∈ s2
