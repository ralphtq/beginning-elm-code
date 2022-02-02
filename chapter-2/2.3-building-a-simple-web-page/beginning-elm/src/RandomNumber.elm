module RandomNumber exposing (Model)

import Html exposing (..)
import Random
import Html.Events exposing (onClick)
import Browser

type Msg
    = GenerateRandomNumber
    | NewRandomNumber Int



type alias Model =
    Int


init : flagsType -> ( Model, Cmd Msg )
init flags =
    ( 0, Cmd.none )

initialModel : Model
initialModel =
    0

view : Model -> Html Msg
view model =
    div []
        [ button [ onClick GenerateRandomNumber ]
            [ text "Generate Random Number" ]
        , text (String.fromInt model)
        ]

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GenerateRandomNumber ->
            ( model, Random.generate NewRandomNumber (Random.int 0 100) )

        NewRandomNumber number ->
            ( number, Cmd.none )

main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }