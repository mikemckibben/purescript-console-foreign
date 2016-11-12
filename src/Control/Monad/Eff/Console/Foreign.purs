--| Support for logging native javascript objects to the console using
--| the `AsForeign` class.
module Control.Monad.Eff.Console.Foreign
       ( logF
       , infoF
       , warnF
       , errorF) where

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import Control.Semigroupoid ((<<<))
import Data.Foreign (Foreign)
import Data.Foreign.Class (class AsForeign, write)
import Data.Unit (Unit)

-- | Write a message to the native console using `console.log`.
logF :: forall a e. AsForeign a => a -> Eff (console :: CONSOLE | e) Unit
logF = _log <<< write

-- | Write an info message to the native console using `console.info`.
infoF :: forall a e. AsForeign a => a -> Eff (console :: CONSOLE | e) Unit
infoF = _info <<< write

-- | Write a warning message to the native console using `console.warn`.
warnF :: forall a e. AsForeign a => a -> Eff (console :: CONSOLE | e) Unit
warnF = _warn <<< write

-- | Write an error message to the native console using `console.error`.
errorF :: forall a e. AsForeign a => a -> Eff (console :: CONSOLE | e) Unit
errorF = _error <<< write

foreign import _log :: forall e. Foreign -> Eff (console :: CONSOLE | e) Unit
foreign import _info :: forall e. Foreign -> Eff (console :: CONSOLE | e) Unit
foreign import _warn :: forall e. Foreign -> Eff (console :: CONSOLE | e) Unit
foreign import _error :: forall e. Foreign -> Eff (console :: CONSOLE | e) Unit
