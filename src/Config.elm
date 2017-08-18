module Config exposing (..)

import Element
import Style.Scale as Scale


type alias ResponsiveConfig =
    { scaled : Int -> Float
    , responsiveLH : Float
    }


responsiveConfig : Element.Device -> ResponsiveConfig
responsiveConfig device =
    let
        -- Base font size used by the modular scale
        msBase =
            18

        -- Modular Scale ratios
        msRatio1 =
            1.18

        msRatio2 =
            1.36

        -- Viewport width bounds within which a linear scale is applied as to scale
        -- the modular scale ratios from msRatio1 to msRatio2
        --
        --    e.g. At and below 300px, the modular scale ratio is 1.18
        --         At 750px, the modular scale ratio is 1.27
        --         At 1200px and above, the modular scale ratio is 1.36
        --
        vpLowerBound =
            300

        vpHigherBound =
            1200

        -- Factor for the modular scale
        scaleFactor =
            Element.responsive (toFloat device.width) ( vpLowerBound, vpHigherBound ) ( msRatio1, msRatio2 )
    in
    { scaled =
        Scale.modular msBase scaleFactor
    , responsiveLH =
        Element.responsive (toFloat device.width) ( vpLowerBound, vpHigherBound ) ( msRatio1, msRatio2 )
    }
