module System.DevUtils.MySQL.Helpers.Tables.Default (
 defaultTables
) where

import System.DevUtils.MySQL.Helpers.Tables.Include (Tables(..))

defaultTables :: Tables
defaultTables = Tables {
 _table = Nothing,
 _type = Nothing
}
