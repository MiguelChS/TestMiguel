--formas lista patter maching [] :fomas

--data patter maching contento (perro "...") = true
-- contento(persona e n) = e < 10 || length n > 3

-- Data (lista a) = vacia | noVacia a (lista a)
--   constructor tipo     contructor de valor 

-- Polimorfirmos parametrico los parametros pueden ser lo que sea map::(a -> b) -> [a] -> [b]

-- f w x y z |(w.y.fst)z = sndx5
--           |otherwise = fstx + sndz

f ::(Num a) => (c -> Bool) -> (a , (Int -> a)) -> (b -> c) -> (b , a) -> a
f w x y z |(w.y.fst)z = snd x 5
          |otherwise = fst x + snd z