module TestUtils where
import System.Timeout (timeout)
import System.Exit (exitSuccess, exitFailure)
import Control.Exception (try, evaluate, SomeException (SomeException))

data TestCase a = TestCase {
    name :: String,
    expected :: a
}

data TestCaseResult = TestCaseResult {
    status  :: TestResultM,
    msg     :: String
}

instance Show TestCaseResult where
    show (TestCaseResult _ msg) = msg

data TestResultM = Failed | Passed
  deriving (Show, Eq)

-- wonky test logic, don't look too close

runTestSuite :: Eq b => Show b => (a -> b) -> [(TestCase b, a)] -> IO TestResultM
runTestSuite func cases = mapM runTest cases >>= pure . combineResults
    where
      runTest (testcase@(TestCase name expected), input) = do
        let testExpr = func input                       -- construct the unit under test
        let resultValue = evaluate testExpr             -- create a lazy evalutation of it
        let tryResultValue = try resultValue            -- create a exception handled evaluation
        timeoutValue <- timeout 500000 tryResultValue   -- evaluate with a 1 sec timeout (in mikrosec)

        let result = case timeoutValue of
                Just (Right actual) -> expect' testcase actual
                Just (Left (SomeException e)) -> TestCaseResult Failed $ exceptionMsg name e
                Nothing -> TestCaseResult Failed $ timeoutMsg name

        print result
        pure $ status result

combineResults :: [TestResultM] -> TestResultM
combineResults [] = Passed
combineResults (Passed:xs) = combineResults xs
combineResults (Failed:xs) = Failed

combine :: TestResultM -> TestResultM -> TestResultM
combine Failed _ = Failed
combine Passed Failed = Failed
combine Passed Passed = Passed 

boolOf True = Passed
boolOf False = Failed

expect' :: Eq a => Show a => TestCase a -> a -> TestCaseResult
expect' (TestCase name expected) actual =
    let result = boolOf $ expected == actual in
    TestCaseResult result $ msgOf name expected actual result

msgOf :: Show a => String -> a -> a -> TestResultM -> String
msgOf name _ _ Passed = successMsg name
msgOf name expected actual Failed = failureMsg name expected actual

successMsg :: Show a => a -> String
successMsg name = "✓ " ++ show name ++ " passed"

failureMsg :: Show a => String -> a -> a -> String
failureMsg name expected actual =
    "✗ failed " ++ name ++ ":    " ++ " expected:  " ++ show expected ++ ", got: " ++ show actual

exceptionMsg :: Show a => String -> a -> String
exceptionMsg name exc = "✗ failed " ++ name ++ ": with " ++ show exc

timeoutMsg :: String -> String
timeoutMsg name = "✗ " ++ name ++ " timed out"

exitFor :: TestResultM -> IO a
exitFor Passed = exitSuccess
exitFor Failed = exitFailure
