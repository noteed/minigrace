module Interpret where

import qualified Data.Text.IO as Text.IO
import qualified System.Exit  as Exit
import qualified System.IO    as IO


import Syntax (Syntax)
import Type (Type)

import qualified Evaluate
import qualified Infer


--------------------------------------------------------------------------------
interpret :: Syntax -> IO (Type, Syntax)
interpret expression =
  case Infer.typeOf expression of
    Left message -> do
      Text.IO.hPutStrLn IO.stderr message
      Exit.exitFailure
    Right inferred -> do
      return (inferred, Evaluate.evaluate [] expression)
