module Main exposing (main)

import Browser
import Model exposing (Model, init)
import Types exposing (Msg(..))
import Update exposing (update)
import View exposing (view)


main : Program () Model Msg
main =
    Browser.element
        { init = \_ -> ( init, Cmd.none )
        , view = view
        , update = update
        , subscriptions = \m -> Sub.none
        }
