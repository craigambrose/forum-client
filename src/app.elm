import Html exposing (article, h1, div, p, text, img)
import Html.Attributes exposing (src, class)

main =
  article [] [
    h1 [] [text "Here is the original article title"],
    p [class "description"] [text "Here is a more detailed description. It is usually a couple of sentences."],
    img [src "https://placekitten.com/200/300"] []
  ]
