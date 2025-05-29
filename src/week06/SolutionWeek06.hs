module SolutionWeek06 where

-- Aufgabe 1

data Rolle = Crewmate | Imposter
    deriving (Eq, Enum, Show)

data Zustand = Tot | Lebending
    deriving (Eq, Enum, Show)

data Farbe = Blau | Rot | Lila | Gelb | Rosa
    deriving (Eq, Enum, Show)

data Astronaut = Astronaut {
    username :: String,
    rolle :: Rolle,
    zustand :: Zustand,
    aufgabe :: [String],
    farbe :: Farbe
}

instance Show Astronaut where
    show (Astronaut username _ _ _ farbe) = show username ++ ": " ++ show farbe

instance Eq Astronaut where
    (==) (Astronaut username _ _ _ farbe) (Astronaut usernameB _ _ _ farbeB) = username == usernameB && farbe == farbeB

istCrewmate :: Astronaut -> Bool
istCrewmate (Astronaut _ Crewmate _ _ _) = True
istCrewmate (Astronaut _ Imposter _ _ _) = False

istImposter :: Astronaut -> Bool
istImposter = not . istCrewmate

istLebendig :: Astronaut -> Bool
istLebendig (Astronaut _ _ Lebending _ _) = True
istLebendig _ = False

istTot :: Astronaut -> Bool
istTot = not. istLebendig


-- Aufgabe 2

data ML a = E | L a (ML a) deriving Show

customListe :: ML Integer
customListe = L 1 $ L 2 $ L 3 $ L 4 E

myHead :: ML a -> a
myHead (L a _) = a
myHead E = error "empty list"

myAppend :: ML a -> ML a -> ML a
myAppend E l = l
myAppend (L a f) l = L a $ myAppend f l

myAdd :: Num a => ML a -> ML a -> ML a
myAdd (L v f) (L v' f') = L (v + v') $ myAdd f f'
myAdd E _ = E
myAdd _ E = E

myString :: Show a => ML a -> String
myString (L v E) = show v
myString (L v f@(L v' f')) = show v ++ ", " ++ myString f

myLess :: ML a -> ML a -> Bool
myLess E E = False
myLess E _ = True
myLess _ E = False
myLess (L _ f) (L _ f') = myLess f f'


-- Aufgabe 3
length' :: [a] -> Int
length' = foldl (\x _ -> x + 1) 0

any' :: (a -> Bool) -> [a] -> Bool
any' f = foldl (\acc val -> acc || f val) False

maximum' :: (Ord a) => [a] -> a
maximum' (x:xs) = foldl (\acc val -> max val acc) x xs

unzip' :: [(a, b)] -> ([a], [b])
unzip' = foldl (\(listA, listB) (a, b) -> (listA ++ [a], listB ++ [b])) ([], [])
