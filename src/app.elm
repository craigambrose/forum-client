import Html exposing (article, h1, div, p, text, img)
import Html.App
import Html.Attributes exposing (src, class)

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
  (model, Cmd.none)

-- UPDATE

type Msg = Increment | Decrement

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
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
