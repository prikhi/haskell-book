module Main where


import Control.Monad (forever, when)
import Data.Traversable (traverse)
import Morse (stringToMorse, morseToChar)
import System.Environment (getArgs)
import System.Exit (exitFailure, exitSuccess)
import System.IO (isEOF)

main :: IO ()
main = do
    mode <- getArgs
    case mode of
        [arg] ->
            case arg of
                "from" ->
                    convertFromMorse
                "to" ->
                    convertToMorse
                _ ->
                    argError
        _ ->
            argError
    where argError =
            putStrLn "Usage: morse (to|from)" >> exitFailure

convertToMorse :: IO ()
convertToMorse = forever $ do
    weAreDone <- isEOF
    when weAreDone exitSuccess
    line <- getLine
    convertLine line
    where convertLine line = do
            let morse = stringToMorse line
            case morse of
                Just str ->
                    putStrLn (unwords str)
                Nothing ->
                    putStrLn ("ERROR: " ++ line) >> exitFailure


convertFromMorse :: IO ()
convertFromMorse = forever $ do
    weAreDone <- isEOF
    when weAreDone exitSuccess
    line <- getLine
    convertLine line
    where convertLine line = do
            let decoded = traverse morseToChar $ words line
            case decoded of
                Just strs ->
                    putStrLn strs
                Nothing ->
                    putStrLn ("ERROR: " ++ line) >> exitFailure
