module View exposing (view)

import Html exposing (Html, header, footer, main_, h1, div, text)
import Html.Attributes exposing (class)
import Draw
import Model exposing (Model)
import Types exposing (Msg(..))


view : Model -> Html Msg
view model =
    div
        []
        [ head model
        , body model
        , footer_ model
        ]


head : Model -> Html Msg
head model =
    header
        [ class "pure-g" ]
        [ div
            [ class "pure-u-1" ]
            [ h1 [] [ text "Turtle path visualization" ] ]
        ]


body : Model -> Html Msg
body model =
    main_
        [ class "pure-g" ]
        [ div
            [ class "pure-u-1-3" ]
            [ text "SIDE" ]
        , div
            [ class "pure-u-2-3" ]
            [ Draw.view model.turtle ]
        ]


footer_ : Model -> Html Msg
footer_ model =
    footer [ class "pure-g" ] []
