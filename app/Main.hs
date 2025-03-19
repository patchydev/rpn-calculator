module Main where

import System.Exit (exitWith, ExitCode(..))
import Text.Read (readMaybe)

repl :: [Integer] -> IO ()
repl nums = do
    input <- getLine
    if input == "exit" then
        exitWith(ExitSuccess)
    else if input == "print" then do
        print nums
        repl nums
    else if input == "ac" then do
        repl []
    else if input == "c" then do
        if length nums > 0 then do
            repl (init nums)
        else do
            repl nums
    else do
        let inputN = stringToInt input
        case inputN of
            Nothing -> do
                exitWith(ExitFailure 1)
            Just n -> do
                let nums2 = nums ++ [n]
                repl nums2

stringToInt :: String -> Maybe Integer
stringToInt s = readMaybe s

main :: IO ()
main = do
    repl []
