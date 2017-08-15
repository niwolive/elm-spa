module Main exposing (..)

import Config
import Element exposing (..)
import Html exposing (Html)
import Styles exposing (..)


main : Html msg
main =
    Element.layout (stylesheet Config.responsiveConfig) <|
        column None
            []
            [ el Logo [] (text "lillis") ]
