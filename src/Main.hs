{-# LANGUAGE CPP #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeApplications #-}
module Main where

import           Miso

import           Model
import           Update
import           View

#ifdef WASM
foreign export javascript "hs_start" main :: IO ()
#endif

main :: IO ()
main = do
  initialTime <- now
  startComponent @"plane" (defaultComponent initialModel updateModel mainView)
    { subs = [ keyboardSub Keyboard ]
    , initialAction = Just (Time initialTime)
    }
