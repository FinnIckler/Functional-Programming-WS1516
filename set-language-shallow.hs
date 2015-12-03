import SetLanguage

set12 :: IntegerSet
set12 = ((((empty `insert` 3) `insert` 2) `delete` 3) `insert` 1)

main :: IO ()
main = print $ set12 `member` 3
