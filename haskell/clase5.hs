--fold
numero = [1..20000];

--condicones
-- 1 mayores que 5000
-- 2 menores o iguales que 10000
-- 3 empiece con 503

-- fold_ funcion -- semilla ? que carajo es la semilla es mi punto de partida
-- foldr filter semilla lista
-- foldl

lista = [4,2,3,5]

isOrdenAsc :: [Int] -> Bool
isOrdenAsc [_] = True
isOrdenAsc (x:xs)
  | x < head xs = isOrdenAsc (xs)
  | otherwise = False
