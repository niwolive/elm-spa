module Styles exposing (..)

import Color
import Config
import Style exposing (..)
import Style.Color as Color
import Style.Font as Font
import Style.Scale as Scale


type Styles
    = None
    | Logo


stylesheet : Config.ResponsiveConfig -> StyleSheet Styles variation
stylesheet { baseFontSize } =
    Style.styleSheet
        [ style None []
        , style Logo
            [ Font.size baseFontSize
            ]
        ]
