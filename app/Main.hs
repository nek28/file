module Main where

import Lib (wc)
import System.Environment (getArgs)
import           Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.IO as TIO

prSummaryToFile :: FilePath -> FilePath -> IO ()
prSummaryToFile logFile inputFile = do
    input <- TIO.readFile inputFile
    let stats = summary input
    TIO.putStr stats
    TIO.appendFile logFile stats
    where
        summary inp = T.pack inputFile <> ": " <> wc inp

main :: IO ()
main = do
    args <- getArgs
    let to = head args
        rest = tail args
    mapM_ (prSummaryToFile to) rest
