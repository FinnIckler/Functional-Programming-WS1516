data Move = Rock | Paper | Scissor
  deriving (Eq)

data Outcome = Lose | Tie | Win
  deriving (Show)

outcome :: Move -> Move -> Outcome
outcome Rock Scissor = Win
outcome Paper Rock   = Win
outcome Scissor Paper= Win
outcome us      them
  |us == them = Tie
  |otherwise = Lose

main :: IO ()
main = do
  print $ outcome Paper Scissor
