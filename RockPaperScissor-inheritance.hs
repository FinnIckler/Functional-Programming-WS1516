import Data.Maybe
import Data.Tuple
data Outcome = Lose | Tie | Win

instance Eq Outcome where
  Lose== Lose= True
  Tie == Tie = True
  Win == Win = True
  _   == _   = False
instance Enum Outcome where
  fromEnum Lose = 0
  fromEnum Tie  = 1
  fromEnum Win  = 2
  toEnum   0    = Lose
  toEnum   1    = Tie
  toEnum   2    = Win
instance Show Outcome where
  show Lose = "Lose"
  show Tie = "Tie"
  show Win = "Win"

instance Ord Outcome where
  Lose <= Lose = True
  Lose <= Tie = True
  Lose <= Win = True
  Tie <= Tie = True
  Tie <= Win = True
  Win <= Win = True
  _   <= _    = False

data Move = Rock | Paper | Scissor
instance Eq Move where
  Rock    == Rock    = True
  Paper   == Paper   = True
  Scissor == Scissor = True
  _       ==       _ = False

table :: [(Move,Int)]
table = [(Rock, 0), (Paper, 1), (Scissor, 2)]
instance Enum Move where
  fromEnum o = fromJust $ lookup o table
  toEnum n   = fromJust $ lookup n $ map swap table


outcome :: Move -> Move -> Outcome
outcome Rock    Scissor = Win
outcome Paper   Rock    = Win
outcome Scissor Paper   = Win
outcome us      them
  |us == them = Tie
  |otherwise = Lose

main :: IO ()
main = do
  print $ outcome Paper Scissor
