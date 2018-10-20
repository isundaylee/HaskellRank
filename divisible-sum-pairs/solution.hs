solve :: Int -> [Int] -> Int
solve k xs =
  let n = length xs
      halfK = (k - 1) `div` 2
      modCounts =
        map (\m -> length $ filter (\num -> num `mod` k == m) xs) [0 .. k - 1]
      halfHalfCount =
        (if (k `mod` 2 == 0)
           then (let halfKModCount = (modCounts !! (k `div` 2))
                  in (halfKModCount * (halfKModCount - 1)) `div` 2)
           else 0)
      zeroZeroCount =
        (let zeroCount = (modCounts !! 0)
          in (zeroCount * (zeroCount - 1)) `div` 2)
   in (sum $
       zipWith
         (*)
         (take halfK (tail modCounts))
         (take halfK $ reverse modCounts)) +
      halfHalfCount +
      zeroZeroCount

main =
  interact $
  (\input ->
     let numbers = map read $ words input
      in show $ solve (numbers !! 1) (drop 2 numbers))
