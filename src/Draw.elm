module Draw exposing (view)

import Html exposing (Html)
import Svg exposing (Svg, svg)
import Svg.Attributes exposing (width, height, viewBox, x1, x2, y1, y2, stroke)
import Data.Line exposing (Line, make, getX, getY, zero)
import Data.Point as Point
import List.Extra exposing (window)
import Turtle exposing (Turtle, Path)
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
            x |> Point.getX |> toString

        y1_ =
            x |> Point.getY |> toString

        y =
            getY l

        x2_ =
            y |> Point.getX |> toString

        y2_ =
            y |> Point.getY |> toString
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
