import qualified Data.Map.Strict as M

type Registers = M.Map String Int

inc :: Int -> String -> Registers -> Registers
inc a = M.alter incOrInsert
  where incOrInsert Nothing = Just a
        incOrInsert (Just b) = Just $ b + a

dec :: Int -> String -> Registers -> Registers
dec a = M.alter decOrInsert
  where decOrInsert Nothing = Just $ -a
        decOrInsert (Just b) = Just $ b - a

rlookup :: String -> Registers -> Int
rlookup = M.findWithDefault 0

apply = undefined
parse op = case op of
             "inc" -> inc
             "dec" -> dec
             _     -> error "Unknown operation"

satisfied :: [String] -> Registers -> Bool
satisfied (name:relation:arg:_) regs =
  let comparator = case relation of
                     "==" -> (==)
                     "!=" -> (/=)
                     ">"  -> (>)
                     ">=" -> (>=)
                     "<"  -> (<)
                     "<=" -> (<=)
                     _    -> error "invalid relation symbol"
  in (rlookup name regs) `comparator` (read arg)

evaluate :: Registers -> String -> Registers
evaluate regs line = let register : op : amount : _ : condition = words line
  in if satisfied condition regs
  then (parse op) (read amount) register regs
  else regs

maxOrZero :: (Num t, Ord t) => [t] -> t
maxOrZero [] = 0
maxOrZero ls = maximum ls

main :: IO ()
main = interact $ (++"\n") . show . maximum . map (maxOrZero . M.elems) . (scanl evaluate M.empty) . lines
