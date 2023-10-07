module Data.Job where

import Protolude

import Data.Proxy ()
import Data.Time.Calendar (Day)
import Data.UUID (UUID)
import GHC.TypeNats (type (<=))

type ID = UUID

data Job
  = Job
      { id                 :: ID
      , subject            :: NonEmpty Text
      , from               :: Day
      , to                 :: Day
      , placeOfWork        :: OfficeAddress
      , remotable          :: Bool
      , frequencyOfArrival :: FrequencyOfArrival
      , scopeOfWork        :: ScopeOfWork
      }

data OfficeAddress
  = OfficeAddress
      { region       :: NonEmpty Text
      , city         :: NonEmpty Text
      , addressLine1 :: NonEmpty Text
      , addressLine2 :: Text
      }

data FrequencyOfArrival
  = forall a. (KnownNat a, a <= 4) => FrequencyOfArrival (Proxy a)

-- TODO: 名前ちゃんと決める
data ScopeOfWork
  = A
  -- 概要設計
  | B -- 基本設計
  | C -- 詳細設計
  | D -- 実装,テスト
  | E -- 運用,保守
  | F -- 教育
  deriving (Eq, Ord, Show)

