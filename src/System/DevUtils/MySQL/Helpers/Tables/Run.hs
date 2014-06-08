module System.DevUtils.MySQL.Helpers.Tables.Run (
 run'List
) where

import System.DevUtils.MySQL.Helpers.Tables.Include (Tables(..), query'List)

import Database.MySQL.Simple

run'List :: Connection -> IO [Tables]
run'List conn = do
 query_ conn query'List
