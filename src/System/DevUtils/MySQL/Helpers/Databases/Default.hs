module System.DevUtils.MySQL.Helpers.Databases.Default (
 defaultDatabases
) where

import System.DevUtils.MySQL.Helpers.Databases.Include (Databases(..))

defaultDatabases :: Databases
defaultDatabases = Databases {
 _database = Nothing
}
