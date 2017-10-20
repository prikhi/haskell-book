module Ch4 where


{- Mood Swing:

1. Mood
2. Blah, Woot
3. Should be Mood -> Mood
-}
data Mood = Blah | Woot deriving (Show)
changeMood :: Mood -> Mood
changeMood Blah = Woot
changeMood Woot = Blah

{- Find Mistakes:

1. not True && True
2. not (x == 6)
3. works
4. works if Merry/Happy type has Ord
5. ['1', '2', '3'] ++ "look at me!"
-}

greetIfCool :: String -> IO ()
greetIfCool coolness =
    if cool then
        putStrLn "eeyyyy. What's shakin'?"
    else
        putStrLn "pshhhh."
    where cool =
            coolness == "downright frosty yo"


awesome :: [String]
awesome = [ "Papuchon", "curry", ":)" ]
also :: [String]
also = [ "Quake", "The Simons" ]
allAwesome :: [ [String] ]
allAwesome = [ awesome, also ]

{- Exercises:

1. length :: [a] -> Integer
2.  a. 5
    b. 3
    c. 2
    d. 5
3. length returns Int while `/` expects a rational
4. 6 `div` length [1, 2, 3]
5. Bool, True
6. Bool, False
7.  a. True
    b. Broken, different types in list
    c. 5
    d. False
    e. Broken, 9 is not a Bool
-}
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x = x == reverse x
myAbs :: Integer -> Integer
myAbs x =
    if x > 0 then
        x
    else
        -x
ex10 :: (a, b) -> (c, d) -> ((b, d), (a, c))
ex10 ab cd =
    ((snd ab, snd cd), (fst ab, fst cd))

syntax1 :: [a] -> Int
syntax1 xs =
    w `x` 1
    where w = length xs
          x = (+)
syntax2 :: a -> a
syntax2 x = x
syntax3 :: (a, b) -> a
syntax3 (a, _) = a

{- Match Name to Types:

1. b
2. b
3. a
4. d
-}
