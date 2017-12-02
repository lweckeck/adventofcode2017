findEvenlyDivisible :: [Int] -> [(Int, Int)]
findEvenlyDivisible numbers = [(a,b) | a <- numbers, b <- numbers, a /= b, rem a b == 0]

checkLine :: String -> Int
checkLine line = case findEvenlyDivisible numbers of
                   (a,b):_ -> quot a b
                   [] -> error "No evenly divisible numbers"
  where numbers = map read $ words $ line

main :: IO ()
main = interact $ (++"\n") . show . sum . (map checkLine) . lines
