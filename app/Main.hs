{-# LANGUAGE NoImplicitPrelude #-}

module Main (main) where

import Import
import Options.Applicative
import RIO.Process
import Run

verbosityOption :: Parser Bool
verbosityOption =
  switch
    (long "verbose" <> short 'v' <> help "Enable verbose mode")

titleOption :: Parser String
titleOption =
  strOption
    ( long "title"
        <> short 't'
        <> metavar "TITLE"
        <> help "Title to print"
    )

optionsParser :: Parser Options
optionsParser = Options <$> titleOption <*> verbosityOption

optionsParserInfo :: ParserInfo Options
optionsParserInfo =
  info
    (optionsParser <**> helper)
    ( fullDesc
        <> progDesc "Make a comment header"
        <> header "header - make a comment header"
    )

main :: IO ()
main = do
  options <- execParser optionsParserInfo
  lo <- logOptionsHandle stderr $ optionsVerbose options
  pc <- mkDefaultProcessContext
  withLogFunc lo $ \lf ->
    let app =
          App
            { appLogFunc = lf,
              appProcessContext = pc,
              appOptions = options
            }
     in runRIO app run
