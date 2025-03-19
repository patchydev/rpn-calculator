module Main where

import System.Exit (exitWith, ExitCode(..))
import Text.Read (readMaybe)

repl :: [Integer] -> IO ()
repl nums = do
    input <- getLine
    case input of
        "exit" -> exitWith(ExitSuccess)
        "print" -> do
            print nums
            repl nums
        "ac" -> repl []
        "c" -> case nums of
            [] -> repl []
            _ -> repl (init nums)
        "+" -> repl [sum nums]
        "*" -> repl [product nums]
        "-" -> repl [subList nums]
        "/" -> repl [divList nums]
        _ -> case stringToInt input of
            Nothing -> exitWith (ExitFailure 1)
            Just n -> repl (nums ++ [n])

subList :: [Integer] -> Integer
subList [] = 0
subList (x:xs) = x - subList xs

divList :: [Integer] -> Integer
divList [] = 1
divList (x:xs) = x `div` divList xs

stringToInt :: String -> Maybe Integer
stringToInt s = readMaybe s

main :: IO ()
main = do
    repl []
