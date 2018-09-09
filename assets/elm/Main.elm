module Main exposing (main)

import Html exposing (..)
import Html.Attributes exposing (class)
import Json.Decode exposing (string, int, list, Decoder, at)
import Json.Decode.Pipeline exposing (decode, required)
import Http
import Debug


type alias Person =
    { name : String
    , slackid : String
    }


type alias Model =
    { people : List Person
    }


type Msg
    = PersonData (Result Http.Error (List Person))


initialModel : Model
initialModel =
    { people =
        [ { name = ""
          , slackid = ""
          }
        ]
    }


personDecoder : Decoder Person
personDecoder =
    decode Person
        |> required "name" string
        |> required "slackid" string


decodeList : Decoder (List Person)
decodeList =
    list personDecoder


decoder : Decoder (List Person)
decoder =
    at [ "data" ] decodeList


initialCmd : Cmd Msg
initialCmd =
    decoder
        |> Http.get "http://localhost:4000/api/people"
        |> Http.send PersonData


init : ( Model, Cmd Msg )
init =
    ( initialModel, initialCmd )


viewPerson : Person -> Html Msg
viewPerson person =
    tr []
        [ td [] [ text person.name ]
        , td [] [ text person.slackid ]
        ]


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "People" ]
        , table [ class "table" ]
            [ thead []
                [ tr []
                    [ th [] [ text "Name" ]
                    , th [] [ text "Slack Id" ]
                    ]
                ]
            , tbody [] (List.map viewPerson model.people)
            ]
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        PersonData (Ok people) ->
            ( { model | people = people }, Cmd.none )

        PersonData (Err _) ->
            ( model, Cmd.none )


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
