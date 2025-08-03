-----------------------------------------------------------------------------
{-# LANGUAGE CPP #-}
{-# LANGUAGE DataKinds #-}
-----------------------------------------------------------------------------
module Main where
-----------------------------------------------------------------------------
import           Miso
-----------------------------------------------------------------------------
import           Model
import           Update
import           View
-----------------------------------------------------------------------------
#ifdef WASM
foreign export javascript "hs_start" main :: IO ()
#endif
-----------------------------------------------------------------------------
main :: IO ()
main = run $ do
  initialTime <- now
  startComponent (component initialModel updateModel mainView)
    { subs = [ keyboardSub Keyboard ]
    , initialAction = Just (Time initialTime)
    }
-----------------------------------------------------------------------------
