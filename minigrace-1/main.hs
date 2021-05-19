-- Bidirectionnal typechecking seems a popular way to do type inference and
-- typechecking, for both simple or more serious languages.
--
-- An introductory text is David Raymond Christiansen 2013 Bidirectional Typing
-- Rules: A Tutorial
-- http://www.davidchristiansen.dk/tutorials/bidirectional.pdf
--
-- An example implementation is https://github.com/luc-tielen/typesystem
--
-- A longer text is
-- Jana Dunfield, Neelakantan R. Krishnaswami 2013
-- Complete and Easy Bidirectional Typechecking for Higher-Rank Polymorphism
-- https://arxiv.org/pdf/1306.6032.pdf
--
-- An example implementation is https://github.com/Gabriel439/grace
--
-- In this file, I try to re-create a small example (similar to Luc's code
-- above), but using the presentation of Gabriel.
--
-- The main differences (beside making it trivially small):
--
-- * No Monotype, since our Type is monomorphic already
-- * No Value, we re-use our Syntax data type
-- * Syntax is not parameterized, since we don't have an Embed variant
-- * The Normalize module is called Evaluate

module Main where

import Control.Monad (forM_)


import qualified Interpret
import qualified Syntax


--------------------------------------------------------------------------------
main :: IO ()
main = do
  forM_ examples $ \expression -> do
    (inferred, value) <- Interpret.interpret expression

    print inferred

    print value

examples =
  [ Syntax.True
  , Syntax.False
  , Syntax.Natural 42
  ]
