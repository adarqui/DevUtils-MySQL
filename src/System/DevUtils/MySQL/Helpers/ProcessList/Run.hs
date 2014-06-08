module System.DevUtils.MySQL.Helpers.ProcessList.Run (
 run'List
) where

import System.DevUtils.MySQL.Helpers.ProcessList.Include (ProcessList(..), query'List)

import Database.MySQL.Simple

run'List :: Connection -> IO [ProcessList]
run'List conn = do
 query_ conn query'List
