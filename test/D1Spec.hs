module D1Spec (spec) where

import Test.Hspec
import D1

spec :: Spec
spec = do
  describe "Exo 1" $ do
    it "437" $ do
      res <- one
      shouldBe 437 res
  describe "Exo 2" $ do
    it "655" $ do
      res <- two
      shouldBe (Just 655) res
