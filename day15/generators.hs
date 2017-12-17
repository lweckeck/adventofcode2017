import Data.Bits as B ((.&.))
import Data.List (foldl')

a = 16807 :: Int
b = 48271 :: Int
p = 2147483647

generate :: Int -> Int -> [Int]
generate factor seed = map (.&. 0xFFFF) $ tail $ iterate (\x -> rem (x * factor) p) seed

countMatching n seedA seedB =
  let numbers = zipWith (==) (take n $ generate a seedA) (take n $ generate b seedB)
  in foldl' (\acc v -> if v then acc + 1 else acc) 0 numbers
                      
main = putStrLn $ show $ countMatching 40000000 783 325
