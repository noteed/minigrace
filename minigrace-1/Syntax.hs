module Syntax where

import Numeric.Natural (Natural)


--------------------------------------------------------------------------------
data Syntax
  = True
  | False
  | Natural Natural
  deriving Show
