module Week06 where

-- Aufgabe 1

data Rolle = Crewmate | Imposter 

data Zustand = Tot | Lebending

data Farbe = Blau | Rot | Lila | Gelb | Rosa

data Astronaut = Astronaut {
    username :: String,
    rolle :: Rolle,
    zustand :: Zustand,
    aufgabe :: [String],
    farbe :: Farbe
}

instance Show Astronaut where
    show = undefined

instance Eq Astronaut where
    (==) = undefined

istCrewmate :: Astronaut -> Bool
istCrewmate = undefined

istImposter :: Astronaut -> Bool
istImposter = undefined

istLebendig :: Astronaut -> Bool
istLebendig = undefined

istTot :: Astronaut -> Bool
istTot = undefined


-- Aufgabe 2

data ML a = E | L a (ML a) deriving Show

customListe :: ML Integer
customListe = L 1 $ L 2 $ L 3 $ L 4 E

myHead :: ML a -> a
myHead = undefined

myAppend :: ML a -> ML a -> ML a
myAppend = undefined

myAdd :: Num a => ML a -> ML a -> ML a
myAdd = undefined

myString :: Show a => ML a -> String
myString = undefined

myLess :: ML a -> ML a -> Bool
myLess = undefined


-- Aufgabe 3
length' :: [a] -> Int
length' = undefined

any' :: (a -> Bool) -> [a] -> Bool
any' = undefined

maximum' :: (Ord a) => [a] -> a
maximum' = undefined

unzip' :: [(a, b)] -> ([a], [b])
unzip' = undefined
