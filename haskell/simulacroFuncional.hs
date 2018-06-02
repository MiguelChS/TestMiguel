import Text.Show.Functions
---1
data Envio = Envio {
 origin :: Ubicacion,
 destination :: Ubicacion,
 pesoKg :: Float,
 precioBase :: Float,
 category :: [String],
 impuestos :: [Impuesto]
}deriving (Show)

type Impuesto = (Envio -> Float)
type Cargo = (Envio -> Envio)

data Ubicacion = Ubicacion {
 pais :: String,
 city :: String
}deriving (Show)
--- 2
iva :: Impuesto
iva envio = (precioBase envio) + ((precioBase envio) * 0.2)

impuestoExtranio :: Impuesto
impuestoExtranio envio
 | even.round$(precioBase envio) = (precioBase envio) + ((precioBase envio) * 0.1)
 | otherwise = (precioBase envio)

cargoTecnologia :: Cargo 
cargoTecnologia envio = envio { precioBase = (precioBase envio) + ((precioBase envio) * 0.18) }

envioInternacional = Envio {
 origin = Ubicacion { pais = "Argentina",city = "Buenos Aires"},
 destination = Ubicacion { pais = "paises bajos",city = "Utrech"},
 pesoKg = 2,
 precioBase = 220,
 category = ["music","tecnology"],
 impuestos = []
}

envioNacional = Envio {
 origin = Ubicacion { pais = "EEUU",city = "California"},
 destination = Ubicacion { pais = "EEUU",city = "Miameee"},
 pesoKg = 5,
 precioBase = 150,
 category = ["book"],
 impuestos = [impuestoExtranio]
}

---3
cuestaMasEnvio :: Float -> Envio -> Bool
cuestaMasEnvio n envio = (precioBase envio) > n

esBarato :: Envio -> Bool
esBarato envio = not(cuestaMasEnvio 1300 envio)

--4

seDirige :: Envio -> String -> Bool
seDirige envio paisCmp = pais (destination envio) == paisCmp

isLocal :: Envio -> Bool
isLocal envio = pais (destination envio) == pais (origin envio)

isInternational :: Envio -> Bool
isInternational envio = not (isLocal envio)

--5
-- findEnviobyCategorys :: [Envio] -> [String] -> [Envio]
-- findEnviobyCategorys listEnvio listCategory = filter ((flip all) listCategory ((flip elem) listCategory)) listEnvio

-- aplicarFiltro :: Envio -> [String] -> Bool
-- aplicarFiltro envio listaCategory = 



--filtrar un elemento que cumpla con la lista de categoria de la lista de envio
-- all funcion [1,3,5,4,4]
--filp all
-- all [lista] funcion
--filp elem elemento []
-- elem [] elemento
-- all listacategory (elem [])



-- all () ["book","music"]
-- elem elemento []
-- ((flip elem) ["book"])
--all ((flip elem) ["book"]) ["book","music"];
-- ((flip elem) ["book"]) "book" true
-- ((flip elem) ["book"]) "music" false
-- false






