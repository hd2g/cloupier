module Datas.Job where

import Data.UUID (UUID)
import Data.Date (Date)

type Job =
  { id :: UUID
  , subject :: String
  , from :: Date
  , to :: Date
  , placeOfWork :: OfficeAddress
  , remotable :: Boolean
  , frequencyOfArrival :: FrequencyOfArrival
  , scopeOfWork :: ScopeOfWork
  }

type OfficeAddress =
  { region :: String
  , city :: String
  , addressLine1 :: String
  , addressLine2 :: String
  }

data FrequencyOfArrival
  = Zero
  | One
  | Tow
  | Three
  | Four
  | Five

-- TODO: 名前ちゃんと決める
data ScopeOfWork
  = A -- 概要設計
  | B -- 基本設計
  | C -- 詳細設計
  | D -- 実装,テスト
  | E -- 運用,保守
  | F -- 教育
