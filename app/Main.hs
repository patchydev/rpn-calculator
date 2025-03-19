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
    let nums = []
    repl nums
