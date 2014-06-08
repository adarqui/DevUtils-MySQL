{-# LANGUAGE OverloadedStrings #-}
module Main where

import System.DevUtils.MySQL.Helpers.ProcessList (ProcessList(..))
import Database.MySQL.Simple
import System.Environment

connekt :: String -> IO Connection
connekt pw = do
 conn <- connect $ defaultConnectInfo { connectPassword = pw, connectDatabase = "" }
 return conn

select :: Connection -> IO [Only Int]
select conn = do
 query_ conn "select 1"

processList :: Connection -> IO [ProcessList]
processList conn = do
 query_ conn "show full processlist"

main :: IO ()
main = do
 argv <- getArgs
 putStrLn "mysql"
 conn <- connekt $ head argv
 v <- select conn
 putStrLn $ show v
 v' <- processList conn
 putStrLn $ show v'
 return ()
