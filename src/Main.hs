module Main where

  import D1.One
  import D1.Two

  printMaybe m = case m of
    Nothing -> putStrLn "List was empty!"
    Just x -> print x


  main :: IO ()
  main = do
    putStr "Day 1.1 : "
    print =<< one
    putStr "Day 1.2 : "
    res <- two
    printMaybe res
