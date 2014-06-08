{-# LANGUAGE OverloadedStrings #-}
module Main where

import System.DevUtils.MySQL.Helpers.ProcessList (ProcessList(..), processListQuery)
import System.DevUtils.MySQL.Helpers.Databases (Databases(..), databasesQuery)
import System.DevUtils.MySQL.Helpers.Tables (Tables(..), tablesQuery)
import Database.MySQL.Simple
import System.Environment


banner :: Query -> IO ()
banner s = putStrLn $ dashes ++ " " ++ (show s) ++ " " ++ dashes
 where
  dashes = "--------------------"

connekt :: String -> String -> IO Connection
connekt pw db = do
 conn <- connect $ defaultConnectInfo { connectPassword = pw, connectDatabase = db }
 return conn

select :: Connection -> IO [Only Int]
select conn = do
 query_ conn "select 1"

processList :: Connection -> IO [ProcessList]
processList conn = do
 query_ conn processListQuery

databases :: Connection -> IO [Databases]
databases conn = do
 query_ conn databasesQuery

tables :: Connection -> IO [Tables]
tables conn = do
 query_ conn tablesQuery


main :: IO ()
main = do
 argv <- getArgs
 putStrLn "mysql"

 conn <- connekt (head argv) ""

 banner "select 1"
 vSelect <- select conn
 putStrLn $ show vSelect

 banner processListQuery
 vProcessList <- processList conn
 putStrLn $ show vProcessList

 banner databasesQuery
 vDatabases <- databases conn
 putStrLn $ show vDatabases

 connMysql <- connekt (head argv) "mysql"
 banner tablesQuery
 vTables <- tables connMysql
 putStrLn $ show vTables

 return ()
