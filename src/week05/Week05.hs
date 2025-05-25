module Week05 where

-- I dont really know how to test the functions and leave the data types undefined
-- If you have an idea how, please tell me, I'd be very interested
-- Until then they stay defined, sry
data Foot = LeftF | RightF
data Position = Goalkeeper | Defender | Midfielder | Forward
data Player = Player {
    name :: String, 
    team :: String,
    backNumber :: Int, 
    foot :: Foot,
    position :: Position
}

example :: Player 
example = undefined

sameTeam :: [Player] -> Bool
sameTeam = undefined

uniqueNumbers :: [Player] -> Bool
uniqueNumbers = undefined

coverPositions :: [Player] -> Bool
coverPositions = undefined
