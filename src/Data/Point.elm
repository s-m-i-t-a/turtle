module Data.Point exposing (Point, make, getX, getY, next)

import Data.Vector as Vector exposing (Vector)


-- represent point in cartesian coordinates


type Point
    = Point Float Float


make : Float -> Float -> Point
make x y =
    Point x y


getX : Point -> Float
getX (Point x _) =
    x


getY : Point -> Float
getY (Point _ y) =
    y


next : Point -> Vector -> Point
next (Point x y) vector =
    Point (x + Vector.getX vector) (y + Vector.getY vector)
