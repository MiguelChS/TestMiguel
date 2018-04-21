import Text.Show.Functions

data Microprocesador = Microprocesador { 
 memoria :: [Int],
 acumuladores :: Acumuladores,
 counter :: Int,
 etiquetaError :: String
} deriving (Show) 

type A = Int
type B = Int
type Acumuladores = (A,B)

siguienteInstruccion :: Microprocesador -> Microprocesador
siguienteInstruccion microprocesador = microprocesador { counter = (counter microprocesador) + 1 }

nop = siguienteInstruccion

getAcumuladorA = fst
getAcumuladorB = snd

lodv :: Int -> Microprocesador -> Microprocesador
lodv val microprocesador = siguienteInstruccion microprocesador { acumuladores = (val, getAcumuladorB(acumuladores microprocesador))} 

swap :: Microprocesador -> Microprocesador
swap microprocesador = siguienteInstruccion microprocesador { acumuladores = (getAcumuladorB(acumuladores microprocesador),getAcumuladorA(acumuladores microprocesador)) }

suma :: Num a => (a,a) -> a
suma (a,b) = a + b

dividir :: Integral a => (a,a) -> a
dividir (a,b) = div a b

divide :: Microprocesador -> Microprocesador
divide microprocesador 
 | getAcumuladorB(acumuladores microprocesador) == 0 = siguienteInstruccion microprocesador { etiquetaError = "DIVISION BY ZERO"}
 | otherwise = siguienteInstruccion microprocesador { acumuladores = ( dividir(acumuladores microprocesador), 0 )}

add :: Microprocesador -> Microprocesador 
add microprocesador = siguienteInstruccion microprocesador { acumuladores = ( suma(acumuladores microprocesador), 0 )}

setValueMemory position val memory = (take (position - 1) memory) ++ [val] ++ (drop (position) memory)

str :: Int -> Int -> Microprocesador -> Microprocesador
str addr val microprocesador
 | length (memoria microprocesador) == 0 = siguienteInstruccion microprocesador { etiquetaError = "No hay Espacio en momeoria" } 
 | otherwise = siguienteInstruccion microprocesador { memoria = setValueMemory addr val (memoria microprocesador) }

lod :: Int -> Microprocesador -> Microprocesador
lod addr microprocesador = siguienteInstruccion microprocesador { acumuladores = ( (memoria microprocesador) !! (addr -1),getAcumuladorB(acumuladores microprocesador) ) }

-- (divide.(lod 1).swap.(lod 2).(str 2 0).str 1 2)xt8088
-- (add.(lodv 22).swap.lodv 10)xt8088
-- (nop.nop.nop) xt8088 ts_1
-- (lodv 5) xt8088
-- 

f20 = Microprocesador { 
 memoria = [], 
 acumuladores = (7,24),
 counter = 0 , 
 etiquetaError = ""
}

at8086 = Microprocesador { 
 memoria = [1..20], 
 acumuladores = (7,24),
 counter = 0 , 
 etiquetaError = ""
}

xt8088 = Microprocesador { 
 memoria = replicate 1024 0, 
 acumuladores = (0,0),
 counter = 0 , 
 etiquetaError = ""
}