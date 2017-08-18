module Update exposing (..)

import Element
import Model
import Task
import Window


type Msg
    = Resize Window.Size


init : ( Model.Model, Cmd Msg )
init =
    ( { device = Element.classifyDevice (Window.Size 0 0)
      }
    , Task.perform Resize Window.size
    )


update : Msg -> Model.Model -> ( Model.Model, Cmd Msg )
update msg model =
    case msg of
        Resize newSize ->
            ( { model
                | device = Element.classifyDevice newSize
              }
            , Cmd.none
            )
