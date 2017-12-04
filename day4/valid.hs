import Data.List as L

validPassphrase :: String -> Bool
validPassphrase phrase = (length ws) == (length $ group $ sort ws)
  where ws = words phrase

main :: IO ()
main = interact $ (++"\n") . show . length . (filter validPassphrase) . lines
