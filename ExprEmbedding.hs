{-# LANGUAGE FlexibleInstances #-}
module ExprEmbedding (Expr, Env, val, add, var,
bnd,AST (..)) where
class Expr a where
  val :: Integer         -> a
  add :: a          -> a -> a
  var :: String          -> a
  bnd :: (String,a) -> a -> a


type Env = [(String,Integer)]

-- Shallow Ebedding #1
instance Expr (Env -> Integer) where
  val n         = \_ -> n
  add e1 e2     = \e -> e1 e + e2 e
  var v         = \e -> case lookup v e of
                    Just n -> n
                    Nothing -> error (v ++ " is unknown")
  bnd (v,e1) e2 = \e -> e2 ((v,e1 e):e)
-- Shallow Embedding #2

instance Expr String where
  val n = show n
  add e1 e2 = e1 ++ " + " ++ e2
  var v = v
  bnd (v,e1) e2 = "let " ++ v ++ " = " ++ e1 ++ " in (" ++ e2 ++ ")"

data AST a = Val a
           | Add (AST a) (AST a)
           | Var String
           | Let String (AST a) (AST a)
           deriving (Eq, Show)

instance Expr (AST Integer) where
  val n      =Val n
  add e1 e2  =Add e1 e2
  var v      =Var v
  bnd (v,e1) e2 = Let v e1 e2
