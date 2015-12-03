module SetLanguage
    (IntegerSet,
    empty,
    insert,
    delete,
    member
    ) where

data IntegerSet = IS (Integer -> Bool)

empty :: IntegerSet
empty = IS (\_ -> False)

insert :: IntegerSet -> Integer -> IntegerSet
insert (IS f) x = IS (\y -> x == y || f y)

delete :: IntegerSet -> Integer -> IntegerSet
delete (IS f) x = IS (\y -> y /= x && f y)

member :: IntegerSet -> Integer -> Bool
member (IS f) x = f x
