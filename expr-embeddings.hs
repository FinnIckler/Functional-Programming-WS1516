import           ExprEmbedding

prog :: Expr a => a
prog = bnd ("x", val 3) (add (bnd ("x", val 2) (var "x")) (var "x"))
simplify :: AST Integer -> AST Integer
simplify e = repeat rewrite e
  where
    repeat :: Eq a => (a -> a) -> a -> a
    repeat f = until (\x -> f x == x) f
    rewrite :: AST Integer -> AST Integer
    rewrite (Add (Val 0) e2)                = rewrite e2
    rewrite (Add e1 (Val 0))                = rewrite e1
    rewrite (Add e1 e2)                     = Add (rewrite e1) (rewrite e2)
    rewrite (Let _ _ e2@(Val _))           = rewrite e2
    rewrite (Let v e1 (Val v'))   | v == show v' = rewrite e1
    rewrite (Let v e1 e2 )                  = Let v (rewrite e1) (rewrite e2)
    rewrite e                                = e

main :: IO()
main = print (prog :: String)
