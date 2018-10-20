generateStaircase :: Int -> String
generateStaircase n = unlines $ map generateLine [1 .. n]
  where
    generateLine i = (replicate (n - i) ' ') ++ (replicate i '#')

main = interact $ generateStaircase . read . head . words
