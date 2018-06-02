import Text.Show.Functions

data Chofer = Chofer{
 nombreChofer :: String,
 kilometraje :: Int,
 viajes :: [Viaje],
 condicionParaTomarViaje :: [Condicion]
}deriving (Show)

type Condicion =  (Viaje -> Bool)

data Cliente = Cliente {
 nombre :: String,
 direccion :: String
}deriving (Show)

data Viaje = Viaje {
 cliente :: Cliente,
 fecha :: String,
 costo :: Float
}deriving (Show)

loQueDe :: Viaje -> Bool
loQueDe viaje = True

mayor200 :: Viaje -> Bool
mayor200 viaje = (costo viaje) > 200

nombreNletras :: Int -> Viaje -> Bool
nombreNletras nLetras viaje = length (nombre(cliente viaje)) == nLetras

noTomarZonaDaterminada :: String -> Viaje -> Bool
noTomarZonaDaterminada zona viaje = (direccion(cliente viaje)) /= zona

clienteLucas = Cliente {
 nombre = "Lucas",
 direccion = "Victoria"
}

choferDaniel = Chofer {
 nombreChofer = "Daniel",
 kilometraje = 23500,
 viajes = [viajeWithLucas],
 condicionParaTomarViaje = [(noTomarZonaDaterminada "Olivos")]
}

choferAlejandra = Chofer {
 nombreChofer = "Alejandra",
 kilometraje = 180000,
 viajes = [],
 condicionParaTomarViaje = [loQueDe]
}

viajeWithLucas = Viaje{
 cliente = clienteLucas,
 costo = 150,
 fecha = "20-04-2018"
}

puedeTomarViaje :: Viaje -> Chofer -> Bool
puedeTomarViaje viaje chofer = all (\x -> x viaje) (condicionParaTomarViaje chofer)

liquidacionChofer :: Chofer -> Float
liquidacionChofer chofer = sum (map (costo) (viajes chofer))

quienTomaViaje :: Viaje -> [Chofer] -> [Chofer]
quienTomaViaje viaje listaChofer =  filter (puedeTomarViaje viaje) listaChofer 

quienTieneMenosViaje :: [Chofer] -> Chofer
quienTieneMenosViaje [x] = head [x]
quienTieneMenosViaje (x:y:xs)
 | length(viajes x) < length(viajes y) = quienTieneMenosViaje ([x] ++ xs)
 | otherwise = quienTieneMenosViaje ([y] ++ xs)

addViaje :: Viaje -> Chofer -> Chofer
addViaje viaje chofer = chofer {viajes = (viajes chofer) ++ [viaje] }

executeViaje :: Viaje -> [Chofer] -> Chofer
executeViaje viaje listaChofer = addViaje viaje (quienTieneMenosViaje(quienTomaViaje viaje listaChofer))

