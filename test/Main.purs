module Test.Main where

import Prelude
import Control.Monad.Eff.Console.Foreign
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import Control.Monad.Eff.Console.Foreign (logF, infoF, warnF, errorF)
import Data.Foreign (toForeign, Foreign)
import Data.Foreign.Class (class AsForeign, write)

type MyRecord = { sval :: String, ival :: Int }

newtype MyNewtypeRecord = MyNewtypeRecord MyRecord

instance myNewtypeRecordAsForeign :: AsForeign MyNewtypeRecord where
  write = toForeign

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  -- example type with `AsForeign` instance
  let ex1 = MyNewtypeRecord { sval: "test newtype wrapped record", ival: 1 }
  logF ex1
  -- example vanilla `Record` using `toForeign`
  let ex2 = toForeign { sval: "test record", ival: 2 }
  logF ex2
  -- example `Array` of `AsForeign`
  logF [ "Array of words:", "a", "b", "c", "d"]
