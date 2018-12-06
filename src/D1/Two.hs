module D1.Two where

import qualified Data.Set as Set

two:: IO (Maybe Int)
two = do
  fmap parse $ readFile "./inputs/d1.txt"
    where parse x =
            twice Set.empty .
            scanl (+) 0 .
            cycle .
            map read .
            lines .
            filter (/= '+') $
            x

twice f r = case r of
  [] -> Nothing
  h : t -> if Set.member h f
    then Just h
    else twice (Set.insert h f) t
