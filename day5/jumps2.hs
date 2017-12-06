import Data.Vector (Vector)
import qualified Data.Vector as V
import Data.Maybe (isJust)

outOfBounds :: Int -> (Int, Int) -> Bool
outOfBounds x (lower, upper) = x < lower || x > upper

advance :: Monad m => (Int, Vector Int) -> Int -> m (Int, Vector Int)
advance (pos, jumplist) offset = return $ (pos + offset, jumplist V.// [(pos, offset + 1)])

jump :: (Int, Vector Int) -> Maybe (Int, Vector Int)
jump state@(pos, jumplist) = (jumplist V.!? pos) >>=
  (\offset -> return (pos + offset, jumplist V.// [(pos, updated offset)]))
  where updated offset = if offset >= 3
                         then offset - 1
                         else offset + 1


jumpsUntilOutOfBounds :: [Int] -> Int
jumpsUntilOutOfBounds jumplist = length $ init $ takeWhile isJust $ iterate (>>= jump) $ pure (0, V.fromList jumplist)

main :: IO ()
main = interact $ (++ "\n") . show . jumpsUntilOutOfBounds . (map read) . lines
