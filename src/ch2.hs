module Ch2 where

main :: IO ()
main = return ()

sayHello :: String -> IO ()
sayHello s =
    putStrLn ("Hello, " ++ s ++ "!")

triple :: Num a => a -> a
triple n =
    n * 3


{- Comprehension Check:

1. Add `let` to beginning (`let half x = x / 2`)
2,3:
-}
circleRadius :: Fractional a => a -> a
circleRadius r =
    3.14 * r * r
circleRadius_ :: Floating a => a -> a
circleRadius_ r =
    pi * r * r


{- Parentheses Exercise:

1. yes (71 vs 135)
2. no
3. yes
-}

x :: Integer
x = 10 * 5 + y
myResult :: Integer
myResult = x * 5
y :: Integer
y = 10

{- Heal the Sick:

1. let area x = 3.14 * (x * x)
2. let double x = x * 2
3. x = 7
   y = 10
   f = x + y
-}

printInc :: (Num a, Show a) => a -> IO ()
printInc n = print plusTwo
    where plusTwo = n + 2
printInc_ :: (Num a, Show a) => a -> IO ()
printInc_ n =
    let
        plusTwo = n + 2
    in
        print plusTwo

{- Head Code:
-}
headCode1 :: Integer
headCode1 =
    z * 3 + w
    where z = 3
          w = 1000
headCode2 :: Integer
headCode2 =
    w * 5
    where z = 10
          w = 10 * 5 + z
headCode3 :: Double
headCode3 =
    c / a + b
    where a = 7
          b = negate a
          c = b * 10

{- Parenthesization:

1. (2 + (2 * 3)) - 1
2. ((^) 10) (1 + 1)
3. ((2 ^ 2) * (4 ^ 5)) + 1

Equivalent Expressions:

1, 2

Fun w/ Functions:

z = 7
y = z + 8
x = y ^ 2
waxOn = x * 5
-}
waxOn :: Integer
waxOn =
    a * 5
    where a = b ^ 2
          b = c + 8
          c = 7
waxOff :: Integer -> Integer
waxOff n =
    triple n
