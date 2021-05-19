module Evaluate where

import Data.Text


import Syntax (Syntax)

import qualified Syntax

--------------------------------------------------------------------------------
-- In the full implementation, the environment contains Values, and the
-- function returns Values (instead of Syntax).
evaluate :: [(Text, Syntax)] -> Syntax -> Syntax
evaluate _ syntax =
  case syntax of
    Syntax.True ->
      Syntax.True

    Syntax.False ->
      Syntax.False

    Syntax.Natural x ->
      Syntax.Natural x
