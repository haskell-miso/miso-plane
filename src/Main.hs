module Main where

import           Miso

import           Model
import           Update
import           View

main :: IO ()
main = do
  initialTime <- now
  startApp (defaultApp initialModel updateModel mainView)
    { subs = [ keyboardSub Keyboard ]
    , initialAction = Just (Time initialTime)
    }
