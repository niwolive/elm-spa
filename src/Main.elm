module Main exposing (..)

import Config
import Element exposing (..)
import Html
import Model
import Styles exposing (..)
import Update
import Window


view : Model.Model -> Html.Html msg
view model =
    Element.layout (stylesheet (Config.responsiveConfig model.device)) <|
        column Base
            []
            [ el Logo [] (text "lillis")
            , el BigTitle [] (text "This is a big header")
            , el MediumTitle [] (text "This is a medium header")
            , el SmallTitle [] (text "This is a small header")
            , text "Some plain text"
            ]


main : Program Never Model.Model Update.Msg
main =
    Html.program
        { init = Update.init
        , update = Update.update
        , view = view
        , subscriptions = \_ -> Window.resizes Update.Resize
        }
