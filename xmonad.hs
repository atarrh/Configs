--
-- An example, simple ~/.xmonad/xmonad.hs file.
-- It overrides a few basic settings, reusing all the other defaults.
--

import XMonad

-- Hooks

import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.Run (spawnPipe)
import XMonad.Layout.Spacing (spacing)
--import XMonad.Layout.SimpleFloat

import qualified Data.Map as M

myModMask       = mod4Mask
myManageHook    = composeAll
    [ manageDocks ]
myLayoutHook    = spacing 2 $ avoidStruts (tiled ||| Mirror tiled ||| Full)
  where
    tiled   = Tall nmaster delta ratio
    nmaster = 1
    ratio   = 1/2
    delta   = 3/100

------------------
-- Keybindings --
------------------
keysToAdd x =
    [
      -- Volume Keys
      ((0, 0x1008ff11), spawn "amixer -q set 'Master' 2%-")
    , ((0, 0x1008ff13), spawn "amixer -q set 'Master' 2%+")
    , ((0, 0x1008ff12), spawn "amixer -q set 'Master' toggle")

      -- Screen Brightness Keys
    , ((0, 0x1008ff03), spawn "xbacklight -dec 5")
    , ((0, 0x1008ff02), spawn "xbacklight -inc 5")
    ]

myKeys x = M.union (keys defaultConfig x) (M.fromList (keysToAdd x))




main = do
    bar <- spawnPipe "~/Documents/panel.sh | bar"
    --bar <- spawnPipe "~/Documents/panel.sh | bar -f {'xft:Inconsolata','-*-terminus-medium-*-*-*-*-140-*-*-*-*-iso8859-1'}"
    --bar <- spawnPipe "~/Documents/panel.sh | bar -f {'-*-nimbus mono l-medium-r-*-*-*-*-*-*-*-*-*-*','-*-terminus-medium-*-*-*-*-140-*-*-*-*-iso8859-1'}"

    xmonad $ ewmh defaultConfig
        { borderWidth        = 2
        , modMask            = myModMask
        , keys               = myKeys
        , layoutHook         = myLayoutHook
        , terminal           = "urxvtc"
        , normalBorderColor  = "#cccccc"
        , focusedBorderColor = "#cd8b00" 
        , manageHook         = myManageHook <+> manageHook defaultConfig -- uses default too
        }

