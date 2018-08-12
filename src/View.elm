module View exposing (view)

import Html exposing (Html, h1, div, text)
import Html.Attributes exposing (class)
import Model exposing (Model)
import Types exposing (Msg(..))


view : Model -> Html Msg
view model =
    div
        []
        [ head model
        , body model
        , footer model
        ]


head : Model -> Html Msg
head model =
    div
        [ class "grid-container" ]
        [ div
            [ class "grid-x grid-margin-x" ]
            [ h1 [ class "cell" ] [ text "Turtle path visualization" ] ]
        ]


body : Model -> Html Msg
body model =
    div [] [ text "SVG image" ]


footer : Model -> Html Msg
footer model =
    div [] []
