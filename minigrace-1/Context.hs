module Context where

import Type (Type)


--------------------------------------------------------------------------------
type Context = [Entry]

data Entry = Entry


--------------------------------------------------------------------------------
complete :: Context -> Type -> Type
complete _ = id
