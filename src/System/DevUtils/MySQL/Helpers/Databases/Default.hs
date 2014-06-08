module System.DevUtils.MySQL.Helpers.Databases.Default (
 default',
 default'List
) where

import System.DevUtils.MySQL.Helpers.Databases.Include (Databases(..))

default' :: Databases
default' = Databases {
 _database = Nothing
}

default'List :: [Databases]
default'List = []
