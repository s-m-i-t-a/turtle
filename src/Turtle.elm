module Turtle exposing (Path, setStartPosition, resetHeading, turn, left, right, forward, move)

import Data.Point exposing (Point, make, next)
import Data.Polar as Polar exposing (Polar)
import Data.Vector as Vector


type alias Heading =
    Polar


type alias Path =
    List ( Point, Heading )


type alias Translate =
    Polar -> Polar


setStartPosition : Float -> Float -> Path
setStartPosition x y =
    [ ( make x y, resetHeading ) ]


resetHeading : Polar
resetHeading =
    Polar.zero


turn : Float -> Polar -> Polar
turn angle polar =
    polar
        |> Polar.getFi
        |> \fi -> Polar.setFi (angle + fi) polar


left : Float -> Polar -> Polar
left angle polar =
    turn angle polar


right : Float -> Polar -> Polar
right angle polar =
    Polar.setFi (360.0 - angle) polar


forward : Float -> Polar -> Polar
forward distance polar =
    Polar.setR distance polar


move : Translate -> Path -> Path
move translate path =
    case path of
        ( point, heading ) :: _ ->
            let
                new =
                    translate heading
            in
                ( new
                    |> Vector.fromPolar
                    |> next point
                , new
                )
                    :: path

        [] ->
            []
