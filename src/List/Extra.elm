module List.Extra exposing (window, window2, take)


window2 : List a -> List (List a)
window2 list =
    let
        w acc list_ =
            case list_ of
                x1 :: xs ->
                    case xs of
                        x2 :: _ ->
                            w ([ x1, x2 ] :: acc) xs

                        [] ->
                            acc

                [] ->
                    acc
    in
        list
            |> w []
            |> List.reverse


window : Int -> List a -> List (List a)
window n list =
    let
        w acc list_ =
            case list_ of
                _ :: xs ->
                    let
                        tk =
                            take n list_
                    in
                        case tk of
                            [] ->
                                acc

                            _ ->
                                w (tk :: acc) xs

                [] ->
                    acc
    in
        list
            |> w []
            |> List.reverse


take : Int -> List a -> List a
take n list =
    let
        t acc left list_ =
            if left > 0 then
                case list_ of
                    x :: xs ->
                        t (x :: acc) (left - 1) xs

                    [] ->
                        if left > 0 then
                            []
                        else
                            acc
            else
                acc
    in
        list
            |> t [] n
            |> List.reverse
