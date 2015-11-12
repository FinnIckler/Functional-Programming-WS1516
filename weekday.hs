data Weekday = Mon | Tue | Wed | Thu | Fri | Sat | Sun
  deriving (Eq,Show,Ord,Enum,Bounded)
weekend :: Weekday -> Bool
weekend Sat = True
weekend Sun = True
weekend _   = False

main :: IO ()
main = do
  print $ weekend Mon
  print $ [Mon..Fri]
