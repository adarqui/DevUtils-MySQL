module System.DevUtils.MySQL.Helpers.ProcessList.Default (
 defaultProcessList
) where

import System.DevUtils.MySQL.Helpers.ProcessList.Include (ProcessList(..))

defaultProcessList :: ProcessList
defaultProcessList = ProcessList {
 _id = Nothing,
 _user = Nothing,
 _host = Nothing,
 _db = Nothing,
 _command = Nothing,
 _time = Nothing,
 _state = Nothing,
 _info = Nothing
}
