checkLine :: String -> Int
checkLine line = (maximum numbers) - (minimum numbers)
  where numbers = map read $ words $ line

main :: IO ()
main = interact $ (++"\n") . show . sum . (map checkLine) . lines
