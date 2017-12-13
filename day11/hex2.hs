import qualified Data.List.Split as S
import Data.Char (isSpace)

hexMove :: (Int, Int, Int) -> String -> (Int, Int, Int)
hexMove (x,y,z) "n"  = (x,   y+1, z-1)
hexMove (x,y,z) "ne" = (x+1, y,   z-1)
hexMove (x,y,z) "se" = (x+1, y-1, z)
hexMove (x,y,z) "s"  = (x,   y-1, z+1)
hexMove (x,y,z) "sw" = (x-1, y,   z+1)
hexMove (x,y,z) "nw" = (x-1, y+1, z)

hexDist :: (Int, Int, Int) -> Int
hexDist (x,y,z) = (abs x + abs y + abs z) `div` 2

parseMoves :: String -> [(Int, Int, Int)]
parseMoves = scanl hexMove (0,0,0) . (S.splitOn ",")

main :: IO ()
main = interact $ (++"\n") . show . maximum . (map hexDist) . parseMoves . (filter (not . isSpace))
