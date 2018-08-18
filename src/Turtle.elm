module Turtle exposing (Turtle, Heading, Path, setStartPosition, resetHeading, turn, left, right, forward, move)

import Data.Point exposing (Point, make, next)
import Data.Polar as Polar exposing (Polar)
import Data.Vector as Vector


type alias Heading =
    Polar


type alias Path =
    List Point


type alias Turtle =
    ( Heading, Path )


type alias Translate =
    Polar -> Polar


setStartPosition : Float -> Float -> Turtle
setStartPosition x y =
    ( resetHeading, [ make x y ] )


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


move : Translate -> Turtle -> Turtle
move translate ( heading, path ) =
    case path of
        point :: _ ->
            let
                new =
                    translate heading
            in
                ( new
                , (new
                    |> Vector.fromPolar
                    |> next point
                  )
                    :: path
                )

        [] ->
            ( heading, [] )
