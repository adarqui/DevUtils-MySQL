module System.DevUtils.MySQL.Helpers.Databases.Run (
 showDatabases
) where

import System.DevUtils.MySQL.Helpers.Databases.Include (Databases(..), query'List)

import Database.MySQL.Simple

showDatabases :: Connection -> IO [Databases]
showDatabases conn = do
 query_ conn query'List
