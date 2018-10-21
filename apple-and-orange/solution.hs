import Control.Monad

solve :: Int -> Int -> Int -> Int -> Int -> Int -> [Int] -> [Int] -> (Int, Int)
solve s t a b m n apples oranges =
  let appleLocs = map (+ a) apples
      orangeLocs = map (+ b) oranges
   in ( (length $ filter (between s t) appleLocs)
      , (length $ filter (between s t) orangeLocs))
  where
    between s t = liftM2 (&&) (>= s) (<= t)

main =
  interact $ \input ->
    let (s:t:a:b:m:n:locs) = map read $ words input
        (appleLocs, orangeLocs) = splitAt m locs
        (appleNum, orangeNum) = solve s t a b m n appleLocs orangeLocs
     in unlines $ map show $ [appleNum, orangeNum]
