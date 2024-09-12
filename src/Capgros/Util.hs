{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Capgros.Util (breakTitleLines) where

import RIO
import qualified RIO.Text as T

spacePositions :: Text -> [Int]
spacePositions = map fst . filter ((== ' ') . snd) . zip [0 ..] . T.unpack

-- idealBreakPoints :: Int -> Text -> [Int]
-- idealBreakPoints width title = T.length title / width

wordLengths :: Text -> [(Text, Int)]
wordLengths title = (\word -> (word, T.length word)) <$> T.words title

wordPositions :: Text -> [(Text, Int)]
wordPositions title = undefined
  where

firstLine :: Int -> Text -> [(Text, Int)]
firstLine width title = filter (\(_, len) -> len <= width) $ wordLengths title
  where
    titleSpacePositions = spacePositions title
    titleWordLengths = wordLengths title

-- titleLines :: Int -> Text -> ([(Text, Int)], [(Text, Int)])
-- titleLines width title = go [] $ wordLengths title
--   where
--     go :: [(Text, Int)] -> [(Text, Int)] -> ([(Text, Int)], [(Text, Int)])
--     go lineAndLengths [] = (fst <$> lineAndLengths, [])
--     go lineAndLengths ((word, lenWord) : rest)
--       | lenWord <= width = go (acc ++ [(word, lenWord)]) rest
--       | otherwise = (fst <$> acc, (word, lenWord) : rest)

breakTitleLines :: Int -> Text -> [Text]
breakTitleLines width title = undefined