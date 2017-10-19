module Ch3 where


print2 :: IO ()
print2 = do
    putStrLn "Count to four for me:"
    putStr "one, two"
    putStrLn ", no"

print3 :: IO ()
print3 = do
    putStrLn myGreeting
    putStrLn secondGreeting
    where myGreeting =
            "hello" ++ " world!"
          hello =
            "hello"
          world =
            "world!"
          secondGreeting =
            concat [hello, " ", world]

{- Scope:

1. yes
2. no
3. no
4. yes


Syntax Errors:

1. no
2. no
3. yes

Reading Syntax:

1.  a. yes
    b. no
    c. yes
    d. yes
    e. no
    f. yes
    g. no
    h. yes
2.  a. d
    b. c
    c. e
    d. a
    e. b

Building Functions:
-}
funcA :: String -> String
funcA x = x ++ "!"
funcB :: String -> String
funcB = take 1 . drop 4
funcC :: String -> String
funcC = drop 8
thirdChar :: String -> Char
thirdChar = (!! 2)
letterIndex :: Int -> Char
letterIndex = ("Curry is awesome!" !!)

rvrs :: String -> String
rvrs str =
    concat
        [ take 7 $ drop 9 str
        , " "
        , take 2 $ drop 6 str
        , " "
        , take 5 str
        , take 1 $ drop 16 str
        ]

reverseMain :: IO ()
reverseMain = print $ rvrs "Curry is awesome."
