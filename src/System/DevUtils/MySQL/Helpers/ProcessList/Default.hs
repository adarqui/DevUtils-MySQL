module System.DevUtils.MySQL.Helpers.ProcessList.Default (
 default',
 default'List
) where

import System.DevUtils.MySQL.Helpers.ProcessList.Include (ProcessList(..))

default' :: ProcessList
default' = ProcessList {
 _id = Nothing,
 _user = Nothing,
 _host = Nothing,
 _db = Nothing,
 _command = Nothing,
 _time = Nothing,
 _state = Nothing,
 _info = Nothing
}

default'List :: [ProcessList]
default'List = []
