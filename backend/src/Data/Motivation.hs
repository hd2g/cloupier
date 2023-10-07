module Data.Motivation where

import Protolude

import Data.Job (ID)

data Motivation
  = Motivation
      { jobId      :: ID
      , motivation :: MotivationRanks
      }

data MotivationRanks
  = None
  | Little
  | Normal
  | More
  | Hight
  deriving (Eq, Ord, Show)
