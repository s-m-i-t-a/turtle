module Data.Line exposing (Line, make, getX, getY, zero)

import Data.Point as Point exposing (Point)


type Line
    = Line Point Point


zero : Line
zero =
    Line Point.zero Point.zero


make : Point -> Point -> Line
make x y =
    Line x y


getX : Line -> Point
getX (Line x _) =
    x


getY : Line -> Point
getY (Line _ y) =
    y
