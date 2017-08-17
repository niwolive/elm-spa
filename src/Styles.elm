module Styles exposing (..)

import Config
import Style exposing (..)
import Style.Font as Font


type Styles
    = None
    | Header
    | BigTitle
    | MediumTitle
    | SmallTitle
    | Logo


stylesheet : Config.ResponsiveConfig -> StyleSheet Styles variation
stylesheet { baseFontSize, scaled } =
    Style.styleSheet
        [ style None []
        , style Header
            [ Font.size (scaled 1)
            ]
        , style Logo
            [ Font.size (scaled 5)
            ]
        , style SmallTitle
            [ Font.size (scaled 2)
            ]
        , style MediumTitle
            [ Font.size (scaled 3)
            ]
        , style BigTitle
            [ Font.size (scaled 4)
            ]
        ]
