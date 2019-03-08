module Lib
    ( wc
    ) where

import Data.Text (Text)
import qualified Data.Text as T

--Takes a string and returns a triple with char count, word count and line count
wordCount :: Text -> (Int, Int, Int)
wordCount inp = (charCount, wordCount, lineCount)
    where
        charCount = T.length inp
        wordCount = length $ T.words inp
        lineCount = length $ T.lines inp

printSummary :: (Int, Int, Int) -> Text
printSummary (cc, wc, lc) =
    T.pack $ mconcat [ show cc 
                     , " chars, "
                     , show wc
                     , " words, "
                     , show lc
                     , " lines"
                     , "\n" ]

cw :: Text -> Text
cw = printSummary . wordCount