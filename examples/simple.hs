{-# LANGUAGE OverloadedStrings #-}
module Main where

import qualified System.DevUtils.MySQL.Helpers.ProcessList as PL (showFullProcessList, query'List)
import qualified System.DevUtils.MySQL.Helpers.Databases as DB (showDatabases, query'List)
import qualified System.DevUtils.MySQL.Helpers.Tables as TBL (showFullTables, query'List)
import Database.MySQL.Simple
import System.Environment

banner :: Query -> IO ()
banner s = putStrLn $ dashes ++ " " ++ (show s) ++ " " ++ dashes
 where
  dashes = "--------------------"

connect' :: String -> String -> String -> String -> IO Connection
connect' host user pw db = do
 conn <- connect $ defaultConnectInfo { connectHost = host, connectUser = user, connectPassword = pw, connectDatabase = db }
 return conn

select :: Connection -> IO [Only Int]
select conn = do
 query_ conn "select 1"

doStuff :: String -> String -> String -> IO ()
doStuff host user pw = do
 putStrLn "mysql"

 conn <- connect' host user pw ""

 banner "select 1"
 vSelect <- select conn
 putStrLn $ show vSelect

 banner PL.query'List
 vProcessList <- PL.showFullProcessList conn
 putStrLn $ show vProcessList

 banner DB.query'List
 vDatabases <- DB.showDatabases conn
 putStrLn $ show vDatabases

 connMysql <- connect' host user pw "mysql"
 banner TBL.query'List
 vTables <- TBL.showFullTables connMysql
 putStrLn $ show vTables

 return ()

usage :: String
usage = "usage: ./simple host user password"

main :: IO ()
main = do
 argv <- getArgs
 case argv of
  [] -> putStrLn $ usage
  (host:user:pw:[]) -> doStuff host user pw
