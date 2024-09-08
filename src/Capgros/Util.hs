{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Capgros.Util (breakTitleLines) where

import RIO

breakTitleLines :: Int -> Text -> [Text]
breakTitleLines width = undefined