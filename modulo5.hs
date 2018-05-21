import Text.Show.Functions
--- filter funcion condicion y la lista
lista = [1,2,3,4,5,6]

listarMayor5 :: [Int]
listarMayor5 =  filter (> 4) lista

--- map funcion a aplicar y lista 

doble :: [Int]
doble = map (*2) lista

--all funcion  y lista y nos dice si toda esa lista aplica con la condicion


--foldl1 reducir aplicando la funcion
sumM :: [Int] -> Int
sumM a = foldl1 (+) a

--- foldl ((2 - 2) -4)-5
-- foldl (-) 2 [2,4,5]
--- foldr (2-(4-(5 -2)))
-- foldr (-) 2 [2,4,5]

--marcelito `entrenar`( miyagui `entrenar` (arguiñano `entrenar` ("Chicken Norris", 1000) ))
----componer funcion con fold
listaFun = [];
