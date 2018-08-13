module Data.PolarTests exposing (..)

import Expect exposing (FloatingPointTolerance(..))
import Test exposing (..)
import Fuzz exposing (Fuzzer, intRange, floatRange)
import Data.Polar as Polar


suite : Test
suite =
    describe
        "Polar coordinates"
        [ fuzz2 (floatRange -360.0 360.0) (intRange 0 5000) "should trim angle" <|
            \base turns ->
                let
                    ( angle, expect ) =
                        if base >= 0 && base < 360.0 then
                            ( (base + (toFloat turns) * 360.0), base )
                        else if base > -360.0 && base < 0.0 then
                            ( (base - (toFloat turns) * 360.0), (360.0 + base) )
                        else
                            -- base is 360 or -360 then can be use as full circle constant
                            ( (base + (toFloat turns) * base), 0.0 )
                in
                    Polar.make 0.0 angle
                        |> Polar.getFi
                        |> Expect.within (Relative 0.01) expect
        ]
