module Main exposing (..)

import Config
import Element exposing (..)
import Html exposing (Html)
import Model exposing (..)
import Styles exposing (..)
import Task
import Window


view : Model -> Html msg
view model =
    Element.layout (stylesheet (Config.responsiveConfig model.device)) <|
        column None
            []
            [ el Logo [] (text "lillis")
            , el BigTitle [] (text "This is a big header")
            , el MediumTitle [] (text "This is a medium header")
            , el SmallTitle [] (text "This is a small header")
            , text "Some plain text"
            ]


main : Program Never Model Msg
main =
    Html.program
        { init =
            ( { device = Element.classifyDevice (Window.Size 0 0)
              }
            , Task.perform Resize Window.size
            )
        , update = update
        , view = view
        , subscriptions = \_ -> Window.resizes Resize
        }


type Msg
    = Resize Window.Size


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Resize newSize ->
            ( { model
                | device = Element.classifyDevice newSize
              }
            , Cmd.none
            )
