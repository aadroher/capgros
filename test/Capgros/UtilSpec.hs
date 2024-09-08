{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Capgros.UtilSpec (spec) where

import Capgros.Util (breakTitleLines)
import RIO
import Test.Hspec
import Test.Hspec.QuickCheck

spec :: Spec
spec = do
  describe "breakTitleLines" $ do
    describe "when width is 10" $ do
      let width = 10
      describe "and the title is 'Application'" $ do
        let title = "Application"
        it "returns a singleton with the whole title" $ breakTitleLines width title `shouldBe` [title]
