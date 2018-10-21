import Data.List (group, sort, tails)
import Debug.Trace (trace)

debug = flip trace

solve :: [Int] -> Int
solve xs =
  let blocks = map (\g -> (head g, length g)) $ group $ sort xs
   in maximum $
      zipWith
        (\(va, la) (vb, lb) ->
           if (abs (va - vb)) <= 1
             then la + lb
             else lb)
        ((minBound :: Int, 0) : blocks)
        blocks

main = interact $ show . solve . tail . map read . words
