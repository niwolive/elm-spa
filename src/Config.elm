module Config exposing (..)

import Element
import Style.Scale as Scale


type alias ResponsiveConfig =
    { baseFontSize : Float
    , scaled : Int -> Float
    }


responsiveConfig : Element.Device -> ResponsiveConfig
responsiveConfig device =
    { baseFontSize = 18
    , scaled =
        let
            scaleFactor =
                Element.responsive (toFloat device.width) ( 320, 1200 ) ( 1.16, 1.33 )
        in
        Scale.modular 16 scaleFactor
    }
