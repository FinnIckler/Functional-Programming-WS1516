import           Debug.Trace
data T1 = T1 Int

f :: T1 -> Int
f (T1 x) = 42

g :: Int -> Int
g x = 42

a :: T1
a = trace "a has been evaluated" (T1 0)

b :: Int
b = trace "b has been evaluated" 0
{-
newtype T2 = T2 Int
h :: T2 -> Int
h (T2 x) = 42
-}
main :: IO ()
main = do
  print $ f a
  print $ g undefined
  print $ g b
