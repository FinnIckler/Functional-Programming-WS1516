module ExprDeep
    (Expr(..),
    eval
    ) where

data Expr =
   ValI Integer
   |ValB Bool
   |Add Expr Expr
   |And Expr Expr
   |EqZero Expr
   |If Expr Expr Expr

instance Show Expr where
  show (ValI n) = show n
  show (ValB b) = show b
  show (Add e1 e2) = show e1 ++ " + " ++ show e2
  show (And e1 e2) = show e1 ++ "∆" ++ show e2
  show (EqZero e)  = show e ++ "== 0"
  show (If p e1 e2) = "if " ++ show p ++ " then "
    ++ show e1 ++ " else " ++ show e2

eval :: Expr -> Either Integer Bool
eval (ValI n) = Left n
eval (ValB b) = Right b
eval (Add e1 e2) = case (eval e1, eval e2) of
                     (Left n1, Left n2) -> Left (n1 + n2)
eval (And e1 e2) = case (eval e1, eval e2) of
                      (Right n1, Right n2) -> Right (n1 && n2)
eval (EqZero e)   = case eval e of
                      Left n -> Right (n == 0)
                      Right b -> Right False
eval (If p e1 e2) = case eval p of
                      Right b -> if b then eval e1 else eval e2
