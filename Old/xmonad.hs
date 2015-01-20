
--
--  My ~/.xmonad/xmonad.hs file.
--  It overrides a few basic settings, reusing all the other
--  defaults.
--


--  Imports     --
import XMonad


-- imports for applications
import Control.Monad
import qualified XMonad.StackSet as W


-- imports for workspaces:
import XMonad.Layout.Gaps
import XMonad.Layout.Spacing
import XMonad.Layout.SimpleFloat
import XMonad.Layout.ResizableTile
import XMonad.Layout.NoBorders    (noBorders)
import XMonad.Layout.PerWorkspace (onWorkspace)


-- imports for statusbar:
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
--import System.IO


-- imports for keybindings:
import XMonad.Util.Run
import XMonad.Actions.CycleWS
import XMonad.Actions.UpdatePointer
import qualified Data.Map as M



--  Config Opts --
myTerm          = "urxvt"
myMod           = mod4Mask
myBorderWidth   = 1

myWorkspaces    = clickable $ [
					 "^i(/home/atarrh/.xmonad/icns/music.xbm) 1"
					,"^i(/home/atarrh/.xmonad/icns/dish.xbm) 2"
					,"^i(/home/atarrh/.xmonad/icns/term.xbm) 3"
					,"^i(/home/atarrh/.xmonad/icns/cat.xbm) 4"]

    where clickable l = ["^ca(1,xdotool key super+" ++ show (n) ++ ")" ++ ws ++ "^ca()" |
                        (i,ws) <- zip [1..] l,
                        let n = i ]

------------------
--  Colors      --
------------------

-- myFont      = "-*-clean-*-*-*-*-*-*-*-*-*-*-*-*"

--  (Erosion Edit)
background  = "#181512"
foreground  = "#D6C3B6"
color0      = "#332d29"
color8      = "#817267"
color1      = "#8c644c"
color9      = "#9f7155"
color2      = "#746C48"
color10     = "#9f7155"
color3      = "#bfba92"
color11     = "#E0DAAC"
color4      = "#646a6d"
color12     = "#777E82"
color5      = "#766782"
color13     = "#897796"
color6      = "#4B5C5E"
color14     = "#556D70"
color7      = "#504339"
color15     = "#9a875f"




------------------
--  Keybindings --
------------------
keysToAdd x =
    [ 
    --Volume media keys
      ((0,      0x1008ff11 ), spawn "amixer -q set Master 5-")
    , ((0,      0x1008ff13 ), spawn "amixer -q set Master 5+")
    , ((0,      0x1008ff12 ), spawn "amixer -q set Master toggle")

    --Screen Brightness media keys
    , ((0,      0x1008ff02 ), spawn "sudo /home/atarrh/scripts/brightness up")
    , ((0,      0x1008ff03 ), spawn "sudo /home/atarrh/scripts/brightness down")

    --Keyboard Brightness media keys
    , ((0,      0x1008ff05 ), spawn "sudo /home/atarrh/scripts/keyboard up")
    , ((0,      0x1008ff06 ), spawn "sudo /home/atarrh/scripts/keyboard down")

    --Music Control media keys
    , ((0,      0x1008ff14 ), spawn "ncmpcpp toggle")
    , ((0,      0x1008ff16 ), spawn "ncmpcpp prev")
    , ((0,      0x1008ff17 ), spawn "ncmpcpp next")



	--Toggle Trackpad Enable/Disable:
	, ((myMod,	xK_d), spawn "/home/atarrh/scripts/trackpad")

    , ((myMod,  xK_a), sendMessage MirrorShrink)
    , ((myMod,  xK_z), sendMessage MirrorExpand)
    ]
    
keysToRemove x = 
    [

    ]



strippedKeys x = foldr M.delete (keys defaultConfig x) (keysToRemove x)
myKeys x = M.union (strippedKeys x) (M.fromList (keysToAdd x))




------------------
--  App(s)      --
------------------
myManageHook = composeAll . concat $
    [
        -- Applications that go to web
        [ className =? b --> viewShift "ffox"      | b <- myClassWebShifts  ]

    ]
    where
    viewShift = doF . liftM2 (.) W.greedyView W.shift
    myClassWebShifts = ["firefox"]





------------------
--  Workspaces  --
------------------

-- Note: avoidStruts forces windows to tile w/ dzen (methinks)
defaultLayouts = avoidStruts (tiled 
                         ||| spaced 
                         ||| Mirror tiled
                         ||| music
                         ||| simpleFloat)
                         ||| Full
    where
        -- default tiling algorithm partitions the screen into two panes
        tiled   = spacing 10 $ ResizableTall nmaster delta ratio []
        spaced  = spacing 50 $ ResizableTall nmaster delta ratio []
        music   = gaps [(R,1000)] $ Tall 3 delta ratio
        -- The default number of windows in the master pane
        nmaster = 1
        -- Default proportion of screen occupied by master pane
        ratio   = 1/2
        -- Percent of screen to increment by when resizing panes
        delta   = 5/100

musicLayouts    = avoidStruts (music ||| tiled)
    where
        --tiling algorithm again
        tiled   = ResizableTall nmaster delta ratio []
        music   = gaps [(R,1120)] $ Tall 3 delta ratio
        -- The default number of windows in the master pane
        nmaster = 1
        -- Default proportion of screen occupied by master pane
        ratio   = 2/3
        -- Percent of screen to increment by when resizing panes
        delta   = 5/100



myLayoutHook = onWorkspace  (myWorkspaces !! 0) musicLayouts $
               onWorkspace "fart" musicLayouts $
               defaultLayouts





------------------
--  Statusbar   --
------------------
myXmonadBar = "dzen2 -x '0' -y '0' -h '20' -w '500' -ta 'l' -fg '"++foreground++"' -bg '"++background++"'"
myStatusBar = "/home/atarrh/.xmonad/status_bar '"++foreground++"' '"++background++"'"



myLogHook h = dynamicLogWithPP ( defaultPP
    {
        --  ppCurrent         = dzenColor color14 background . pad
		  ppCurrent         = dzenColor color14 color0 . pad


        , ppVisible         = dzenColor color3  background . pad
        , ppHidden          = dzenColor color3  background . pad
        , ppHiddenNoWindows = dzenColor color0  background . pad
        , ppWsSep           = ""
        , ppSep             = "    "

        , ppLayout          = wrap "^ca(1,xdotool key alt+space)" "^ca()" . dzenColor color2 background .
            (\x -> case x of
                "Full"      ->  "^i(/home/atarrh/.xmonad/icns/layout_full.xbm)"
                "Spacing 10 ResizableTall"   ->  "^i(/home/atarrh/.xmonad/icns/layout_tall.xbm)"
                "Spacing 50 ResizableTall"   ->  "^i(/home/atarrh/.xmonad/icns/layout_spac.xbm)"
                "ResizableTall" ->  "^i(/home/atarrh/.xmonad/icns/layout_tall.xbm)"
                "Tall" -> "^i(/home/atarrh/.xmonad/icns/layout_gaps.xbm)"
                _               ->        "^i(/home/atarrh/.xmonad/icns/grid.xbm)"
                
            )
        , ppOrder           = \(ws:l:t:_) -> [ws,l, t]
		, ppOutput			= hPutStrLn h
    } )







------------------
--  Main        --
------------------
main = do
    dzenLeftBar         <- spawnPipe myXmonadBar
    dzenRightBar        <- spawnPipe myStatusBar
    xmonad $ defaultConfig
        { terminal                  = myTerm
        , keys                      = myKeys
        , modMask                   = myMod

        , XMonad.focusFollowsMouse  = False

        , workspaces                = myWorkspaces
        , manageHook                = myManageHook
        , layoutHook                = myLayoutHook
        , logHook                   = myLogHook dzenLeftBar >> updatePointer (Relative 1 1)

        , normalBorderColor         = color0
        , focusedBorderColor        = color8
        , borderWidth               = myBorderWidth
    }


