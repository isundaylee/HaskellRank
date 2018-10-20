import Data.List

solve :: Int -> [Int] -> Int
solve k xs =
  let n = length xs
   in length $
      filter
        (\(i, j) -> ((xs !! i) + (xs !! j)) `mod` k == 0)
        [(x, y) | x <- [0 .. n - 1], y <- [0 .. x - 1]]

main =
  interact $
  (\input ->
     let numbers = map read $ words input
      in show $ solve (numbers !! 1) (drop 2 numbers))
