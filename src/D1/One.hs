module D1.One where

one:: IO Int

one = do
  fmap parse $ readFile "./inputs/d1.txt"
    where parse x =
            sum .
            map read .
            lines .
            filter (/= '+') $
            x
