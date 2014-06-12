{-# LANGUAGE OverloadedStrings, DeriveGeneric #-}
module System.DevUtils.MySQL.Helpers.Databases.JSON (
) where

import System.DevUtils.MySQL.Helpers.Databases.Include (Databases(..))
import Data.Aeson (FromJSON, ToJSON, decode, encode)

instance FromJSON Databases
instance ToJSON Databases
