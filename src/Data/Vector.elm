module Data.Vector exposing (Vector, fromPolar, make, getX, getY, zero)

import Data.Polar as Polar exposing (Polar)


type Vector
    = Vector Float Float


zero : Vector
zero =
    Vector 0.0 0.0


make : Float -> Float -> Vector
make x y =
    Vector x y


getX : Vector -> Float
getX (Vector x _) =
    x


getY : Vector -> Float
getY (Vector _ y) =
    y


fromPolar : Polar -> Vector
fromPolar polar =
    let
        x =
            (Polar.getR polar) * cos (degrees (Polar.getFi polar))

        y =
            (Polar.getR polar) * sin (degrees (Polar.getFi polar))
    in
        Vector x y
