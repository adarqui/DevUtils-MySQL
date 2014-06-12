{-# LANGUAGE OverloadedStrings, DeriveGeneric #-}
module System.DevUtils.MySQL.Helpers.ProcessList.JSON (
) where

import System.DevUtils.MySQL.Helpers.ProcessList.Include (ProcessList(..))
import Data.Aeson (FromJSON, ToJSON, decode, encode)

instance FromJSON ProcessList
instance ToJSON ProcessList
