import Text.Show.Functions
-- Composicion formar nuevas funciones apartir de otras
-- ver si la palabra es par 
-- length nos da la logitud de la palabra y even no dice si es par o no

elNombreEsPar :: String -> Bool

elNombreEsPar = even.length

-- Aplicacion Parcial 
-- es delimitar una funcion precargando algun parametro y volviendo otra funcion
-- que espera los paramtros faltantes

restoDividirPor6 :: Int -> Int
restoDividirPor6 = mod 6


--- Composicion y aplicacion Parcial

restoDivicionOperadoPor5 :: Int -> Int
restoDivicionOperadoPor5 = (5 +) . mod 5