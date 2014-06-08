module System.DevUtils.MySQL.Helpers.Tables (
 Tables(..),
 default',
 run'List,
 query'List
) where

import System.DevUtils.MySQL.Helpers.Tables.Include (Tables(..), query'List)
import System.DevUtils.MySQL.Helpers.Tables.Default (default')
import System.DevUtils.MySQL.Helpers.Tables.Run (run'List)
