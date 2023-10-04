module Pages.Home where

import Prelude
import Safe.Coerce (coerce)

import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Effect.Aff.Class (class MonadAff)

type State = Int
data Action = Increment | Decrement

component
  :: forall query input output m
   . MonadAff m
  => H.Component query input output m
component =
  H.mkComponent
    { initialState
    , render
    , eval: H.mkEval $ H.defaultEval { handleAction = handleAction }
    }

initialState :: forall i. i -> State
initialState _ = 0

handleAction
  :: forall output m
   . MonadAff m
  => Action
  -> H.HalogenM State Action () output m Unit
handleAction = case _ of
  Increment -> H.modify_ \state -> state + 1
  Decrement -> H.modify_ \state -> state - 1

render :: forall m. State -> H.ComponentHTML Action () m
render state =
  HH.main
    []
    [ HH.button [ HE.onClick \_ -> Decrement ] [ HH.text "-" ]
    , HH.div_ [ HH.text $ show state ]
    , HH.button [ HE.onClick \_ -> Increment ] [ HH.text "+" ]
    ]

