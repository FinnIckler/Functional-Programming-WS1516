instance (Eq a, Eq b) => Eq (a,b) where
  (x1,y1) == (x2,y2) = x1 == x2 && y1 == y2


instance Eq a => Eq [a] where
  [] == []         = True
  (x:xs) == (y:ys) = x == y && xs == ys
  _      == _      = False
