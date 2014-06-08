{-# LANGUAGE OverloadedStrings #-}
module System.DevUtils.MySQL.Helpers.Databases.Include (
 Databases(..),
 query'List
) where

import Database.MySQL.Simple
import Database.MySQL.Simple.QueryResults
import Database.MySQL.Simple.Result

import Data.Maybe ()

instance QueryResults Databases where
 convertResults [fa] [va] = Databases { _database = a }
  where
   a = convert fa va
 convertResults fs vs = convertError fs vs 2

data Databases = Databases {
 _database :: Maybe String
} deriving (Show)

query'List :: Query
query'List = "show databases"
