{-# LANGUAGE OverloadedStrings #-}
module Main where

import qualified System.DevUtils.MySQL.Helpers.ProcessList as PL (run'List, query'List)
import qualified System.DevUtils.MySQL.Helpers.Databases as DB (run'List, query'List)
import qualified System.DevUtils.MySQL.Helpers.Tables as TBL (run'List, query'List)
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

main :: IO ()
main = do
 argv <- getArgs
 putStrLn "mysql"

 conn <- connekt (head argv) ""

 banner "select 1"
 vSelect <- select conn
 putStrLn $ show vSelect

 banner PL.query'List
 vProcessList <- PL.run'List conn
 putStrLn $ show vProcessList

 banner DB.query'List
 vDatabases <- DB.run'List conn
 putStrLn $ show vDatabases

 connMysql <- connekt (head argv) "mysql"
 banner TBL.query'List
 vTables <- TBL.run'List connMysql
 putStrLn $ show vTables

 return ()
