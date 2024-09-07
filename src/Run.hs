{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Run (run) where

import Capgros.Title (mkHeader)
import Import
import qualified RIO.Text as T
import Prelude (putStrLn)

run :: RIO App ()
run = do
  app <- ask
  let title = optionsTitle $ appOptions app
  logInfo $ "Processing title: " <> displayShow title
  liftIO $ putStrLn $ T.unpack $ mkHeader $ T.pack title
