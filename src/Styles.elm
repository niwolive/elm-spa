module Styles exposing (..)

import Config
import Style exposing (..)
import Style.Font as Font


type Styles
    = None
    | Base
    | Header
    | BigTitle
    | MediumTitle
    | SmallTitle
    | Logo


stylesheet : Config.ResponsiveConfig -> StyleSheet Styles variation
stylesheet { scaled, fluidLineHeight } =
    Style.styleSheet
        [ style None []
        , style Base
            [ Font.size (scaled 1)
            , Font.lineHeight fluidLineHeight
            ]
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
