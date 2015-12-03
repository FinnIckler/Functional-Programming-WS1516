module SetLanguageDeep(IntegerSet(Empty,Insert,Delete),
    member,card) where

data IntegerSet = Empty
                  | Insert IntegerSet Integer
                  | Delete IntegerSet Integer
  deriving (Show)

member :: IntegerSet -> Integer -> Bool
member Empty         _ = False
member (Insert xs x) y = x == y || member xs y
member (Delete xs x) y = x /=y  && member xs y

card :: IntegerSet -> Integer
card Empty                       = 0
card (Insert xs x) | member xs x = card xs
                   | otherwise   = card xs + 1
card (Delete xs x) | member xs x = card xs - 1
                   | otherwise   = card xs
