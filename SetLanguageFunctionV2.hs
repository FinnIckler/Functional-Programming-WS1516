module SetLanguage
    (IntegerSet,
    empty,
    insert,
    delete,
    member,
    card
    ) where

data IntegerSet = IS (Integer -> Bool) Integer

empty :: IntegerSet
empty = IS (\_ -> False)
           0

insert :: IntegerSet -> Integer -> IntegerSet
insert xs@(IS f c) x = IS (\y -> x == y || f y)
                          (if member xs x then c else 1 + c)

delete :: IntegerSet -> Integer -> IntegerSet
delete xs@(IS f c) x = IS (\y -> y /= x && f y)
                          (if member xs x then c - 1 else c)

member :: IntegerSet -> Integer -> Bool
member (IS f _) x = f x

card :: IntegerSet -> Integer
card (IS _ c) = c
