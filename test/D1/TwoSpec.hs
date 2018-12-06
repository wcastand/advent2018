-- file Spec.hs
module D1.TwoSpec (spec) where

  import Test.Hspec
  import D1.Two

  spec :: Spec
  spec = do
    describe "Exo 2" $ do
      it "655" $ do
        res <- two
        shouldBe (Just 655) res
