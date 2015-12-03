{-# LANGUAGE GADTs #-}
module ExprDeep
    (Expr(..),
    eval
    ) where

data Expr a where
   ValI   :: Integer                        -> Expr Integer
   ValB   :: Bool                           -> Expr Bool
   Add    :: Expr Integer -> Expr Integer   -> Expr Integer
   And    :: Expr Bool -> Expr Bool         -> Expr Bool
   EqZero :: Expr Integer                   -> Expr Bool
   If     :: Expr Bool -> Expr a -> Expr  a -> Expr a

instance Show (Expr a) where
  show (ValI n) = show n
  show (ValB b) = show b
  show (Add e1 e2) = show e1 ++ " + " ++ show e2
  show (And e1 e2) = show e1 ++ "∆" ++ show e2
  show (EqZero e)  = show e ++ "== 0"
  show (If p e1 e2) = "if " ++ show p ++ " then " ++ show e1 ++ " else " ++ show e2

eval :: Expr a -> a
eval (ValI n) = n
eval (ValB b) = b
eval (Add e1 e2) = eval e1 + eval e2
eval (And e1 e2) = eval e1 && eval e2
eval (EqZero e)  = eval e == 0
eval (If p e1 e2) = if eval p then eval e1 else eval e2
