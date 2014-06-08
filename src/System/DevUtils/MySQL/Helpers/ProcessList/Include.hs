{-# LANGUAGE OverloadedStrings #-}
module System.DevUtils.MySQL.Helpers.ProcessList.Include (
 ProcessList(..),
 processListQuery
) where

import Database.MySQL.Simple
import Database.MySQL.Simple.QueryResults
import Database.MySQL.Simple.Result

instance QueryResults ProcessList where
 convertResults [fa,fb,fc,fd,fe,ff,fg,fh] [va,vb,vc,vd,ve,vf,vg,vh] = ProcessList { _id = a, _user = b, _host = c, _db = d, _command = e, _time = f, _state = g, _info = h }
  where
   a = convert fa va
   b = convert fb vb
   c = convert fc vc
   d = convert fd vd
   e = convert fe ve
   f = convert ff vf
   g = convert fg vg
   h = convert fh vh
 convertResults fs vs = convertError fs vs 2

data ProcessList = ProcessList {
 _id :: Maybe Integer,
 _user :: Maybe String,
 _host :: Maybe String,
 _db :: Maybe String,
 _command :: Maybe String,
 _time :: Maybe Integer,
 _state :: Maybe String,
 _info :: Maybe String
} deriving (Show)

processListQuery :: Query
processListQuery = "show full processlist"
