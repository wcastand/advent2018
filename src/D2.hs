module D2 where

  import Data.Array (assocs, accumArray)

  one:: IO Int
  parse:: String -> Int
  tuplesToList:: (Int, Int) -> [Int]
  frequency :: String -> [(Char,Int)]
  counts:: (Int, Int) -> String -> (Int, Int)
  ll:: (Int, Int) -> (Char, Int) -> (Int, Int)

  one = fmap parse $ readFile "./inputs/d2.txt"
  parse x =
    product .
    tuplesToList .
    foldl counts (0, 0) .
    lines $ x

  tuplesToList (x, y) = [x, y]

  frequency = filter (\f -> snd f>0) . assocs . accumArray (+) 0 ('\0','\255') . map (\x->(x,1))

  counts (xx, yy) s =
    (\(x, y) -> (xx + x, yy + y)) .
    foldl ll (0, 0) .
    frequency $ s

  ll (x, y) (_, nb)
    | nb == 2 = (1, y)
    | nb == 3 = (x, 1)
    | otherwise = (x, y)
