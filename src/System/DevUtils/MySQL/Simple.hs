module System.DevUtils.MySQL.Simple (
 urlToConnectInfo
) where

import System.DevUtils.Base.Url.MySQL
 (MySQL(..))

import System.DevUtils.Base.Url.Session
 (Session(..))

import System.DevUtils.Base.Url.Auth
 (Auth(..))

import System.DevUtils.Base.Url.Connection
 (Connection(..), ConnectionType(..))

import Database.MySQL.Simple
 (ConnectInfo(..))

import Data.Maybe
 (isNothing, fromJust, maybe)

urlToConnectInfo :: MySQL -> ConnectInfo
urlToConnectInfo url = ConnectInfo {
  connectHost = tcp,
  connectPort = _port $ _con $ _ses url,
  connectUser = user,
  connectPassword = pass,
  connectDatabase = db,
  connectPath = unix,
  connectOptions = [],
  connectSSL = Nothing
 }
 where
  db = case (_db url) of
   (Just v) -> v
   _ -> ""
  (user,pass) = case (_auth $ _ses url) of
   (Just v) -> (_user v, maybe "" (\x -> x) (_pass v))
   _ -> ("root","")
  (tcp,unix) = let (t,d) = (_type $ _con $ _ses url, _dest $ _con $ _ses url) in case t of
   UNIX -> ("", d)
   _ -> (d, "")
