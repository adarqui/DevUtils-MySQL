module System.DevUtils.MySQL.Helpers.ProcessList.Run (
 showFullProcessList
) where

import System.DevUtils.MySQL.Helpers.ProcessList.Include (ProcessList(..), query'List)

import Database.MySQL.Simple

showFullProcessList :: Connection -> IO [ProcessList]
showFullProcessList conn = do
 query_ conn query'List
