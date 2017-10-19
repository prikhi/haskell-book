module Ch14 where

import Test.Hspec
import Test.QuickCheck


main :: IO ()
main = hspec $
    describe "Ch14" $ do
        it "1 + 1 is greater than 1" $
            (1 + 1 :: Integer) > 1 `shouldBe` True
        it "2 + 2 is equal to 4" $
            (2 + 2 :: Integer) `shouldBe` 4
        describe "dividedBy" $ do
            it "divides 15 by 3 correctly" $
                dividedBy 15 3 `shouldBe` (5, 0)
            it "divides 22 by 5 correctly" $
                dividedBy 22 5 `shouldBe` (4, 2)
        describe "recursiveMultiply" $ do
            it "multiplies positive numbers correctly" $
                recursiveMultiply 5 3 `shouldBe` 15
            it "handles zero correctly" $ do
                recursiveMultiply 5 0 `shouldBe` 0
                recursiveMultiply 0 5 `shouldBe` 0
            it "handles one negative number correctly" $ do
                recursiveMultiply 2 (-3) `shouldBe` (-6)
                recursiveMultiply (-7) 4 `shouldBe` (-28)
            it "handles two negative numbers correctly" $
                recursiveMultiply (-6) (-7) `shouldBe` 42
        it "x + 1 is always greater than x" $
            property $ \x -> x + 1 > (x :: Int)


dividedBy :: Integer -> Integer -> (Integer, Integer)
dividedBy num denom = go num denom 0
    where go n d count =
            if n < d then
                (count, n)
            else
                go (n - d) d (count + 1)

recursiveMultiply :: (Eq a, Num a) => a -> a -> a
recursiveMultiply x_ y =
    let
        result = go (abs x_) 0
    in
        if abs x_ == x_ then
            result
        else
            (-1) * result
    where go x acc =
            if x == 0 then
                acc
            else
                go (x - 1) (acc + y)


trivialInt :: Gen Int
trivialInt = return 1

oneThroughThree :: Gen Int
oneThroughThree = elements [1..3]

genBool :: Gen Bool
genBool = choose (False, True)

genBool_ :: Gen Bool
genBool_ = elements [False, True]

genOrdering :: Gen Ordering
genOrdering = elements [LT, EQ, GT]

genChar :: Gen Char
genChar = elements ['a'..'z']

genTuple :: (Arbitrary a, Arbitrary b) => Gen (a, b)
genTuple = do
    a <- arbitrary
    b <- arbitrary
    return (a, b)

genThreeple :: (Arbitrary a, Arbitrary b, Arbitrary c) => Gen (a, b, c)
genThreeple = do
    a <- arbitrary
    b <- arbitrary
    c <- arbitrary
    return (a, b, c)

genEither :: (Arbitrary a, Arbitrary b) => Gen (Either a b)
genEither = do
    a <- arbitrary
    b <- arbitrary
    elements [ Left a, Right b ]

genMaybe :: Arbitrary a => Gen (Maybe a)
genMaybe = do
    a <- arbitrary
    elements [ Nothing, Just a ]


prop_additionGreater :: Int -> Bool
prop_additionGreater x = x + 1 > x

runQc :: IO ()
runQc = quickCheck prop_additionGreater
