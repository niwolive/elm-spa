module Config exposing (..)

import Element
import Style.Scale as Scale


type alias ResponsiveConfig =
    { scaled : Int -> Float
    , fluidLineHeight : Float
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
        --    e.g. If the viewport width is `viewportLowBound` pixels or lower, the modular scale ratio is `msRatio1`
        --         If it is halfway between `viewportLowBound` and `viewportHighBound` pixels,
        --           the modular scale ratio is `(msRatio1 + msRatio2) / 2`
        --         If it is at `viewportHighBound` or higher, the modular scale ratio is `msRatio2`
        --
        viewportLowBound =
            300

        viewportHighBound =
            1200

        -- Fluid line height lower and higher bounds
        --
        --   e.g. If the viewport width is `viewportLowBound` pixels or lower the line height is `lineHeightMin`
        --        If the viewport width is between `viewportLowBound` and `viewportHighBound` pixels,
        --          the line height is `(lineHeightMin + lineHeightMax) / 2`
        --        If the viewport width is `viewportHighBound` pixels or above the line height is `lineHeightMax`
        lineHeightMin =
            1.2

        lineHeightMax =
            1.8

        scaleFactor =
            Element.responsive (toFloat device.width) ( viewportLowBound, viewportHighBound ) ( msRatio1, msRatio2 )
    in
    { scaled =
        Scale.modular msBase scaleFactor
    , fluidLineHeight =
        Element.responsive (toFloat device.width) ( viewportLowBound, viewportHighBound ) ( lineHeightMin, lineHeightMax )
    }
