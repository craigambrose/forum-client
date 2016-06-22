import Html exposing (article, h1, div, p, text, img)
import Html.App exposing (beginnerProgram)
import Html.Attributes exposing (src, class)

main =
  beginnerProgram { model = model, view = view, update = update }

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

-- UPDATE

type Msg = Increment | Decrement

update : Msg -> Model -> Model
update msg model =
  model

-- VIEW

view model =
  article [] [
    h1 [] [text model.title],
    p [class "description"] [text model.description],
    img [src model.imageUrl] []
  ]
