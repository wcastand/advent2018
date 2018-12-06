-- file Spec.hs
module D1.OneSpec (spec) where

import Test.Hspec
import D1.One

spec :: Spec
spec = do
  describe "Exo 1" $ do
    it "437" $ do
      res <- one
      shouldBe 437 res
