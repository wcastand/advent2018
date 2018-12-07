module D1 where

import qualified Data.Set as Set

one:: IO Int
two:: IO (Maybe Int)
twice :: Ord a => Set.Set a -> [a] -> Maybe a

one = do
  fmap parse $ readFile "./inputs/d1.txt"
    where parse x =
            sum .
            map read .
            lines .
            filter (/= '+') $
            x

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
