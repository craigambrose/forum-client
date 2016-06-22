import Html exposing (article, h1, div, p, text, img)
import Html.App
import Html.Attributes exposing (src, class)
import Http
import Json.Decode as Json
import Task

main =
  Html.App.program { init = init, view = view, update = update, subscriptions = subscriptions }

-- MODEL

type alias Model =
  { title : String
  , imageUrl : String
  , url: String
  , description: String
  }

model : Model
model =
  Model "Here is the original article title" "https://placekitten.com/200/300" "fish" "Here is a more detailed description. It is usually a couple of sentences."

init : (Model, Cmd Msg)
init =
  (model, fetchData)

-- UPDATE

type Msg
  = FetchSucceed String
  | FetchFail Http.Error

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    FetchSucceed newUrl ->
      (Model model.title newUrl model.url model.description, Cmd.none)

    FetchFail _ ->
      (model, Cmd.none)

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

-- VIEW

view model =
  article [] [
    h1 [] [text model.title],
    p [class "description"] [text model.description],
    img [src model.imageUrl] []
  ]

-- HTTP

fetchData : Cmd Msg
fetchData =
  let
    url =
      "http://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=cats"
  in
    Task.perform FetchFail FetchSucceed (Http.get decodeGifUrl url)

decodeGifUrl : Json.Decoder String
decodeGifUrl =
  Json.at ["data", "image_url"] Json.string
