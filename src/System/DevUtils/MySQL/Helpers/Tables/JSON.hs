{-# LANGUAGE OverloadedStrings, DeriveGeneric #-}
module System.DevUtils.MySQL.Helpers.Tables.JSON (
) where

import System.DevUtils.MySQL.Helpers.Tables.Include (Tables(..))
import Data.Aeson (FromJSON, ToJSON, decode, encode)

instance FromJSON Tables
instance ToJSON Tables
