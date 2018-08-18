module List.ExtraTests exposing (..)

import Expect
import Test exposing (..)
import Fuzz exposing (Fuzzer, int, intRange, list)
import List.Extra exposing (window)


suite : Test
suite =
    describe
        "Sliding window"
        [ fuzz2 (list int) int "should create list" <|
            \list n ->
                let
                    len =
                        List.length list
                in
                    if n <= 0 || n > len then
                        list
                            |> window n
                            |> Expect.equal []
                    else
                        let
                            rv =
                                window n list
                        in
                            rv
                                |> Expect.all
                                    [ \rv -> (Expect.equal ((len - n) + 1) (List.length rv))
                                    , \rv -> rv |> List.head |> Expect.equal (Just <| List.take n list)
                                    ]
        ]
