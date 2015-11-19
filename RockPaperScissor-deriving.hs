import Data.Maybe
import Data.Tuple
data Outcome = Lose | Tie | Win
  deriving(Eq,Ord,Enum,Bounded,Show)

data Move = Rock | Paper | Scissor
  deriving (Eq)
instance Ord Move where
  Rock <= Rock      = True
  Rock <= Paper     = True
  Paper <= Paper    = True
  Paper <= Scissor  = True
  Scissor <= Scissor= True
  Scissor <= Rock   = True
  _       <= _      = False
instance Show Move where
  show Scissor = "✌"
  show Rock    = "✊"
  show Paper   = "✋"

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
