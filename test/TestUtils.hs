module TestUtils where

data TestCase a = TestCase {
    name :: String,
    predicate :: a -> a -> Bool,
    expected :: a
}

data TestCaseResult = TestCaseResult {
    status  :: Bool,
    msg     :: String
}

instance Show TestCaseResult where
    show (TestCaseResult _ msg) = msg

expect' :: Show a => TestCase a -> a -> TestCaseResult
expect' (TestCase name predicate expected) actual =
    let result = predicate expected actual in
    TestCaseResult result $ msgOf name expected actual result

msgOf :: Show a => String -> a -> a -> Bool -> String
msgOf name _ _ True = successMsg name
msgOf name expected actual False = failureMsg name expected actual

successMsg :: Show a => a -> String
successMsg name = "✓ " ++ show name ++ "passed"

failureMsg :: Show a => String -> a -> a -> String
failureMsg name expected actual =
    "✗ failed " ++ name ++ ":    " ++ " expected:  " ++ show expected ++ ", got: " ++ show actual
