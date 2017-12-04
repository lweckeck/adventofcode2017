import Data.List as L

validPassphrase :: String -> Bool
validPassphrase phrase = (length ws) == (length $ group $ sort ws)
  where ws = map L.sort $ words phrase

main :: IO ()
main = interact $ (++"\n") . show . length . (filter validPassphrase) . lines
