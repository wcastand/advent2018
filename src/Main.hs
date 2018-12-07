module Main where

  import qualified D1
  import qualified D2

  printMaybe m = case m of
    Nothing -> putStrLn "List was empty!"
    Just x -> print x


  main :: IO ()
  main = do
    putStr "Day 1.1 : "
    print =<< D1.one
    putStr "Day 1.2 : "
    res <- D1.two
    printMaybe res
    putStrLn "==============="
    putStr "Day 2.1 : "
    print =<< D2.one
