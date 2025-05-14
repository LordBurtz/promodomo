module Week03 where

note :: Double -> (Integer, String)
note n = (-1, "")

tax :: Double -> Double
tax d = -1

length' :: [a] -> Int
length' a = -1

length'' :: [a] -> Int
length'' a = -1

reverse' :: [a] -> [a]
reverse' a = []

reverse'' :: [a] -> [a]
reverse'' a = []

append' :: [a] -> [a] -> [a]
append' a b = []

append'' :: [a] -> [a] -> [a]
append'' a b = []

take' :: Int -> [a] -> [a]
take' a b = []

take'' :: Int -> [a] -> [a]
take'' a b = []


-- TestResultM monad with Failed and Passed states
data TestResultM a = Failed | Passed
  deriving (Show, Eq)

instance Functor TestResultM where
  fmap f Failed = Failed
  fmap f Passed = Passed

instance Applicative TestResultM where
  pure _ = Failed
  (<*>) _ Failed = Failed
  (<*>) _ Passed = Passed

instance Monad TestResultM where
  Passed >>= _ = Passed
  Failed >>= _ = Failed

-- -- -- -- -- -- -- 

passer = Passed
failer = Failed

dotest = do 
  _ <- passer
  _ <- passer
  _ <- failer
  passer

