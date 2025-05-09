module TestUtils where
import System.Timeout (timeout)
import Control.Exception (try, evaluate, SomeException (SomeException))

data TestCase a = TestCase {
    name :: String,
    expected :: a
}

data TestCaseResult = TestCaseResult {
    status  :: Bool,
    msg     :: String
}

instance Show TestCaseResult where
    show (TestCaseResult _ msg) = msg


-- wonky test logic, don't look too close

runTestSuite :: Eq b => Show b => (a -> b) -> [(TestCase b, a)] -> IO [TestCaseResult]
runTestSuite func = mapM runTest
    where
      runTest (testcase@(TestCase name expected), input) = do
        let testExpr = func input                       -- construct the unit under test
        let resultValue = evaluate testExpr             -- create a lazy evalutation of it
        let tryResultValue = try resultValue            -- create a exception handled evaluation
        timeoutValue <- timeout 100000 tryResultValue   -- evaluate with a 1 sec timeout (in mikrosec)

        let result = case timeoutValue of
                Just (Right actual) -> expect' testcase actual
                Just (Left (SomeException e)) -> TestCaseResult False $ exceptionMsg name e
                Nothing -> TestCaseResult False $ timeoutMsg name

        print result
        pure result

expect' :: Eq a => Show a => TestCase a -> a -> TestCaseResult
expect' (TestCase name expected) actual =
    let result = expected == actual in
    TestCaseResult result $ msgOf name expected actual result

msgOf :: Show a => String -> a -> a -> Bool -> String
msgOf name _ _ True = successMsg name
msgOf name expected actual False = failureMsg name expected actual

successMsg :: Show a => a -> String
successMsg name = "✓ " ++ show name ++ " passed"

failureMsg :: Show a => String -> a -> a -> String
failureMsg name expected actual =
    "✗ failed " ++ name ++ ":    " ++ " expected:  " ++ show expected ++ ", got: " ++ show actual

exceptionMsg :: Show a => String -> a -> String
exceptionMsg name exc = "✗ failed " ++ name ++ ": with " ++ show exc

timeoutMsg :: String -> String
timeoutMsg name = "✗ " ++ name ++ " timed out"
