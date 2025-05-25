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
sameTeam = sameTeam' . map team
  where
    sameTeam' [] = True
    sameTeam' (x:xs) = all ( == x ) xs

uniqueNumbers :: [Player] -> Bool
uniqueNumbers = uniqueNumbers' [] . map backNumber
  where
    uniqueNumbers' _ [] = True
    uniqueNumbers' acc (x:xs) = notElem x acc && uniqueNumbers' (x:acc) xs


coverPositions :: [Player] -> Bool
coverPositions = coverPositions' allPositions . map position
  where
    allPositions = [ Goalkeeper, Defender, Midfielder, Forward ]
    coverPositions' pos lst = null [p | p <- pos, p `notElem` lst]
