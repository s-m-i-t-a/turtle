module Model exposing (Model, init)

import Turtle exposing (Turtle)


type alias Model =
    { turtle : Turtle }


init : Model
init =
    { turtle =
        Turtle.setStartPosition 250.0 250.0
            |> Turtle.move (Turtle.forward 20.0 >> Turtle.left 120)
            |> Turtle.move (Turtle.forward 30.0 >> Turtle.left 120)
            |> Turtle.move (Turtle.forward 40.0 >> Turtle.left 120)
            |> Turtle.move (Turtle.forward 50.0 >> Turtle.left 120)
            |> Turtle.move (Turtle.forward 60.0 >> Turtle.left 120)
            |> Turtle.move (Turtle.forward 70.0 >> Turtle.left 120)
            |> Turtle.move (Turtle.forward 80.0 >> Turtle.left 120)
            |> Turtle.move (Turtle.forward 90.0 >> Turtle.left 120)
            |> Turtle.move (Turtle.forward 100.0 >> Turtle.left 120)
    }
