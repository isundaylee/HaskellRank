solve :: Int -> Int -> Int -> Int -> Int -> Int -> [Int] -> [Int] -> (Int, Int)
solve s t a b m n apples oranges =
  let appleLocs = map (+ a) apples
      orangeLocs = map (+ b) oranges
   in ( (length $ filter (>= s) $ filter (<= t) appleLocs)
      , (length $ filter (>= s) $ filter (<= t) orangeLocs))

main =
  interact $ \input ->
    let (s:t:a:b:m:n:locs) = map read $ words input
        (appleLocs, orangeLocs) = splitAt m locs
        (appleNum, orangeNum) = solve s t a b m n appleLocs orangeLocs
     in unlines $ map show $ [appleNum, orangeNum]
