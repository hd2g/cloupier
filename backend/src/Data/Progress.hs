module Data.Progress where

import Protolude

import Data.Job (ID)

data Progress
  = Progress
      { jobId    :: ID
      , progress :: ProgressKinds
      }

data ProgressKinds
  = Unread
  | Read
  | MotivationPresented
  | Interviewed
  | Asigned
  deriving (Eq, Ord, Show)

