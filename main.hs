doble = (*2);
cuandruple = doble.doble
factorial numero 
        | numero == 0 = 1
        | otherwise = factorial(numero-1)*numero

factorial2 numero = factorial2(numero-1)*numero
nombrePar :: String -> Bool
nombrePar = even.length

data Compra = Compra {
        usuario :: Usuario,
        productos :: Productos
}

type Usuario  = String

data Producto = Producto {
        nombre :: String,
        categoria :: String,
        precio :: Float
} deriving (Show)

type Productos = [Producto]

comprasDe :: String -> [Compra] -> [Compra]

comprasDe _ [] = []

--1

comprasDe nombre (compra : cs)
        | Usuario compra == nombre = compra comprasDe nombre: cs
        | otherwise = comprasDe nombre cs

--2

comprasDe

--3
compraConNProductos n [] = []
| (length.producto)compra = n:[compra]
