module System.DevUtils.MySQL.Helpers.Tables.Default (
 default',
 default'List
) where

import System.DevUtils.MySQL.Helpers.Tables.Include (Tables(..))

default' :: Tables
default' = Tables {
 _table = Nothing,
 _type = Nothing
}

default'List :: [Tables]
default'List = []
