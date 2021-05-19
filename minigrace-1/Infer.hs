{-# LANGUAGE FlexibleContexts #-}

module Infer where

import Control.Monad.Except (MonadError(..))
import Control.Monad.State.Strict (MonadState)
import Data.Text

import qualified Control.Monad.State as State


import Context (Context, Entry)
import Syntax (Syntax)
import Type (Type)

import qualified Context
import qualified Syntax
import qualified Type


--------------------------------------------------------------------------------
data Status = Status
  { context :: Context
  }


--------------------------------------------------------------------------------
typeOf :: Syntax -> Either Text Type
typeOf syntax = do
  let initialStatus = Status { context = [] }

  (_A, Status { context = _Δ }) <- State.runStateT (infer syntax) initialStatus

  return (Context.complete _Δ _A)


--------------------------------------------------------------------------------
infer :: (MonadState Status m, MonadError Text m) => Syntax -> m Type
infer Syntax.True = do
  return Type.Bool

infer Syntax.False = do
  return Type.Bool

infer (Syntax.Natural _) = do
  return Type.Natural
