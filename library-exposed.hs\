type IntegerSet = [Integer]

empty :: IntegerSet
empty = []

insert :: Integer -> IntegerSet -> IntegerSet
insert x xs = x:xs

delete :: Integer -> IntegerSet -> IntegerSet

delete x xs = filter (/= x) xs

member :: Integer -> IntegerSet -> Bool
member x xs = elem x xs

prog :: Bool
prog = member 3 (insert 1 (delete 3 (insert 2 (insert 3 empty))))

main :: IO ()
main = print $ prog
