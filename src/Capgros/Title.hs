{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Capgros.Title (mkHeader) where

import RIO
import qualified RIO.Text as T

width :: Int
width = 60

commentPrefix :: Text
commentPrefix = "/*"

commentSuffix :: Text
commentSuffix = "*/"

paddingChar :: Char
paddingChar = ' '

internalBoxWidth :: Int
internalBoxWidth = width - (T.length commentPrefix + T.length commentSuffix)

titleLine :: Text -> Text
titleLine title = commentPrefix <> T.center internalBoxWidth paddingChar title <> commentSuffix

emptyLine :: Text
emptyLine = commentPrefix <> T.replicate internalBoxWidth (T.singleton paddingChar) <> commentSuffix

borderLine :: Text
borderLine = commentPrefix <> T.replicate internalBoxWidth (T.singleton '*') <> commentSuffix

mkHeader :: Text -> Text
mkHeader title = T.intercalate "\n" [borderLine, emptyLine, titleLine title, emptyLine, borderLine]