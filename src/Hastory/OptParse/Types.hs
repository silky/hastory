module Hastory.OptParse.Types where

import Introduction

import Options.Applicative

type Arguments = (Command, Flags)
type Instructions = (Dispatch, Settings)
data Command
    = Command
    deriving (Show, Eq)

data Flags
    = Flags
    deriving (Show, Eq)

data Configuration
    = Configuration
    deriving (Show, Eq)

data Dispatch
    = Dispatch
    deriving (Show, Eq)

data Settings
    = Settings
    deriving (Show, Eq)
