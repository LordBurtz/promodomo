module SolutionWeek05 where

data Foot = LeftF | RightF
data Position = Goalkeeper | Defender | Midfielder | Forward
    deriving Eq

data Player = Player {
    name :: String, 
    team :: String,
    backNumber :: Int, 
    foot :: Foot,
    position :: Position
}

example :: Player 
example = Player "DerSpieler" "SeinTeam" 1 LeftF Goalkeeper

sameTeam :: [Player] -> Bool
sameTeam lst =  (sameTeam' . map team) lst 
  where
    sameTeam' [] = True
    sameTeam' (x:xs) = all ( == x ) xs 

uniqueNumbers :: [Player] -> Bool
uniqueNumbers = (uniqueNumbers' [] . map backNumber) 
  where
    uniqueNumbers' _ [] = True
    uniqueNumbers' acc (x:xs) = case elem x acc of
        True -> False
        False -> uniqueNumbers' (x:acc) xs


coverPositions :: [Player] -> Bool
coverPositions = (coverPositions' allPositions . map position)
  where
    allPositions = [ Goalkeeper, Defender, Midfielder, Forward ]
    coverPositions' pos lst = [p | p <- pos, not $ elem p lst] == []
