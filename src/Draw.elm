module Draw exposing (view)

import Data.Line exposing (Line, getX, getY, make, zero)
import Data.Point as Point
import Html exposing (Html)
import List.Extra exposing (window)
import Svg exposing (Svg, svg)
import Svg.Attributes exposing (height, stroke, viewBox, width, x1, x2, y1, y2)
import Turtle exposing (Path, Turtle)
import Types exposing (Msg(..))


type alias Lines =
    List Line


view : Turtle -> Html Msg
view ( _, path ) =
    svg
        [ viewBox "0 0 500 500" ]
        (path
            |> toLines
            |> List.map line
        )


line : Line -> Svg Msg
line l =
    let
        x =
            getX l

        x1_ =
            x |> Point.getX |> String.fromFloat

        y1_ =
            x |> Point.getY |> String.fromFloat

        y =
            getY l

        x2_ =
            y |> Point.getX |> String.fromFloat

        y2_ =
            y |> Point.getY |> String.fromFloat
    in
    Svg.line [ x1 x1_, y1 y1_, x2 x2_, y2 y2_, stroke "black" ] []


toLines : Path -> Lines
toLines path =
    path
        |> window 2
        |> List.map toLine


toLine : Path -> Line
toLine path =
    case path of
        x :: y :: _ ->
            make x y

        x :: [] ->
            zero

        [] ->
            zero
