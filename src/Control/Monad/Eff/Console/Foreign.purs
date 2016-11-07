--| Support for logging native javascript objects to the console using
--| the `AsForeign` class.
module Control.Monad.Eff.Console.Foreign
       ( log
       , info
       , warn
       , error) where

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import Control.Semigroupoid ((<<<))
import Data.Foreign (Foreign)
import Data.Foreign.Class (class AsForeign, write)
import Data.Unit (Unit)

-- | Write a message to the native console using `console.log`.
log :: forall a e. AsForeign a => a -> Eff (console :: CONSOLE | e) Unit
log = _log <<< write

-- | Write an info message to the native console using `console.info`.
info :: forall a e. AsForeign a => a -> Eff (console :: CONSOLE | e) Unit
info = _info <<< write

-- | Write a warning message to the native console using `console.warn`.
warn :: forall a e. AsForeign a => a -> Eff (console :: CONSOLE | e) Unit
warn = _warn <<< write

-- | Write an error message to the native console using `console.error`.
error :: forall a e. AsForeign a => a -> Eff (console :: CONSOLE | e) Unit
error = _error <<< write

foreign import _log :: forall e. Foreign -> Eff (console :: CONSOLE | e) Unit
foreign import _info :: forall e. Foreign -> Eff (console :: CONSOLE | e) Unit
foreign import _warn :: forall e. Foreign -> Eff (console :: CONSOLE | e) Unit
foreign import _error :: forall e. Foreign -> Eff (console :: CONSOLE | e) Unit
