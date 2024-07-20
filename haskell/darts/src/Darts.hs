{- | Darts module for the Exercism.io Haskell track.
-}
module Darts (score) where

{- | score function calculates the score of a dart throw based on the
   coordinates of the throw.

   The dartboard is a circle with a radius of 10 units. It is divided
   into 3 circles: the outer circle with a radius of 10 units, the
   middle circle with a radius of 5 units, and the inner circle with a
   radius of 1 unit. The center of the dartboard is at the point (0, 0).

   The score is calculated based on the distance of the dart from the
   center of the dartboard. The score is calculated as follows:

   * If the dart lands outside the outer circle, the score is 0 points.
   * If the dart lands in the outer circle but outside the middle circle,
     the score is 1 point.
   * If the dart lands in the middle circle but outside the inner circle,
     the score is 5 points.
   * If the dart lands in the inner circle, the score is 10 points.

   The score is an integer value.

   The score function takes two arguments, x and y, which are the
   coordinates of the dart throw. The score function returns the score
   of the dart throw as an integer value.

   Examples:

   * score 0 0 = 10
   * score 0 1 = 10
   * score 0 5 = 5
   * score 0 10 = 1
   * score 0 11 = 0
-}
score :: Float -> Float -> Int
score x y = do
    let outerRadius = 10
    let middleRadius = 5
    let innerRadius = 1
    let pointsInCenterCircle = 10
    let pointsInMiddleCircle = 5
    let pointsInOuterCircle = 1
    let pointsOutsideTarget = 0
    let radius = sqrt (x*x + y*y)
    case radius of
        _ | radius > outerRadius -> pointsOutsideTarget
        _ | radius > middleRadius  -> pointsInOuterCircle
        _ | radius > innerRadius  -> pointsInMiddleCircle
        _           -> pointsInCenterCircle
