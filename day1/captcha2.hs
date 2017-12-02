import Data.Char (isDigit, digitToInt)

equalPair :: Eq a => (a,a) -> Bool
equalPair = uncurry (==)

sumRepeated :: [Int] -> Int
sumRepeated numbers = sum $ map fst $ filter equalPair $ pairWithHalfwayAround numbers
    where pairWithHalfwayAround l = zip l (drop half $ cycle l)
          half = (length numbers) `div` 2

main :: IO ()
main = interact $ (++ "\n") . show . sumRepeated . (map digitToInt) . (filter isDigit)

