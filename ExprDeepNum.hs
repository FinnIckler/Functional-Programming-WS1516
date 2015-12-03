module ExprDeepNum
    (Expr(..),
    eval
    ) where

data Expr =
   Val Integer
  |Add Expr Expr
  |Mul Expr Expr
  |Sub Expr Expr
  deriving(Show)

instance Num Expr where
  e1 + e2 = Add e1 e2
  e1 - e2 = Sub e1 e2
  e1 * e2 = Mul e1 e2
  fromInteger n = Val n
  abs    _ = undefined
  signum _ = undefined

eval :: Expr -> Integer
eval(Val n)    = n
eval(Add e1 e2)= eval e1 + eval e2
eval(Mul e1 e2)= eval e1 * eval e2
eval(Sub e1 e2)= eval e1 - eval e2
