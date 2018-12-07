module D2Spec (spec) where

  import Test.Hspec
  import D2

  spec :: Spec
  spec = do
    describe "Exo 1" $ do
      it "7776" $ do
        res <- one
        shouldBe 7776 res
    -- describe "Exo 2" $ do
    --   it "655" $ do
    --     res <- two
    --     shouldBe (Just 655) res

