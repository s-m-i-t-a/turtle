module Data.Polar exposing (Polar, getR, getFi, make, setR, setFi, zero)


type Polar
    = Polar Float Float


zero : Polar
zero =
    Polar 0.0 0.0


make : Float -> Float -> Polar
make r fi =
    Polar r (normalize fi)


getR : Polar -> Float
getR (Polar r _) =
    r


getFi : Polar -> Float
getFi (Polar _ fi) =
    fi


setR : Float -> Polar -> Polar
setR r (Polar _ fi) =
    Polar r fi


setFi : Float -> Polar -> Polar
setFi fi (Polar r _) =
    Polar r (normalize fi)



-- private


normalize : Float -> Float
normalize fi =
    let
        fi_ =
            fi - (360.0 * toFloat (floor ((fi + 180.0) / 360.0)))
    in
        if fi_ >= 0.0 then
            fi_
        else
            (360 + fi_)
