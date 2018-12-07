module D2 where

  import Data.Array (assocs, accumArray)
  import Data.List

  -- ONE
  one:: IO Int
  parseOne:: String -> Int
  tuplesToList:: (Int, Int) -> [Int]
  frequency :: String -> [(Char,Int)]
  counts:: (Int, Int) -> String -> (Int, Int)
  ll:: (Int, Int) -> (Char, Int) -> (Int, Int)
  -- TWO
  two:: IO String
  parseTwo:: String -> String
  ff:: [String] -> String
  fff:: (String, String) -> Bool

  one = fmap parseOne $ readFile "./inputs/d2.txt"
  two = fmap parseTwo $ readFile "./inputs/d2.txt"

  parseOne x =
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

  parseTwo x =
    ff .
    lines $ x

  ff o =
    (\(x, x') -> intersect x x') .
    head $
    filter fff [ (x,y) | (x:rest) <- tails o , y <- rest ]

  fff (o, o') = ((foldl (\cc (c, c') -> if c /= c' then cc + 1 else cc) 0 (zip o o')) == 1)

