import Data.Char (isDigit, digitToInt)

equalPair :: Eq a => (a,a) -> Bool
equalPair = uncurry (==)

sumRepeated :: [Int] -> Int
sumRepeated = sum . (map fst) . (filter equalPair) . pairWithFollowing
    where pairWithFollowing l = zip l (tail $ cycle l) 

main :: IO ()
main = interact $ (++ "\n") . show . sumRepeated . (map digitToInt) . (filter isDigit)

