{-# LANGUAGE OverloadedStrings, DeriveGeneric #-}
module System.DevUtils.MySQL.Helpers.Tables.Include (
 Tables(..),
 query'List
) where

import Database.MySQL.Simple
import Database.MySQL.Simple.QueryResults
import Database.MySQL.Simple.Result

import GHC.Generics (Generic)

instance QueryResults Tables where
 convertResults [fa, fb] [va, vb] = Tables { _table = a, _type = b }
  where
   a = convert fa va
   b = convert fb vb
 convertResults fs vs = convertError fs vs 2

data Tables = Tables {
 _table :: Maybe String,
 _type :: Maybe String
} deriving (Eq, Show, Generic)

query'List :: Query
query'List = "show full tables"
