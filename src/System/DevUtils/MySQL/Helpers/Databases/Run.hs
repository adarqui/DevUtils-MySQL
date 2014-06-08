module System.DevUtils.MySQL.Helpers.Databases.Run (
 run'List
) where

import System.DevUtils.MySQL.Helpers.Databases.Include (Databases(..), query'List)

import Database.MySQL.Simple

run'List :: Connection -> IO [Databases]
run'List conn = do
 query_ conn query'List
