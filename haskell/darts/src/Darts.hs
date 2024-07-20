module Darts (score) where

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
