module Main where

import System.Exit (exitWith, ExitCode(..))

repl :: [Integer] -> IO ()
repl nums = do
    input <- getLine
    if input == "exit" then
        exitWith(ExitSuccess)
    else if input == "print" then do
        print nums
        repl nums
    else do
        let nums2 = (stringToInt input) : nums
        repl nums2

stringToInt :: String -> Integer
stringToInt s = read s

main :: IO ()
main = do
    let nums = []
    repl nums
