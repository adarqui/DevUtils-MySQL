module System.DevUtils.MySQL.Helpers.Tables.Run (
 showFullTables
) where

import System.DevUtils.MySQL.Helpers.Tables.Include (Tables(..), query'List)

import Database.MySQL.Simple

showFullTables :: Connection -> IO [Tables]
showFullTables conn = do
 query_ conn query'List
