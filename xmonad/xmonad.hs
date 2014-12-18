import XMonad
import XMonad.Config.Desktop
import XMonad.Config.Kde
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders
import XMonad.Layout.Accordion
import qualified XMonad.StackSet as W

standardConfig = ewmh kde4Config

main = xmonad $ standardConfig {
                    modMask = mod4Mask,
                    manageHook = manageHook kde4Config <+> myManageHook,
                    handleEventHook = handleEventHook kde4Config <+> fullscreenEventHook,
                    layoutHook = myLayoutHook
                }

myManageHook = composeAll . concat $
    [ [ className   =? c --> doFloat           | c <- myFloats]
    , [ title       =? t --> doFloat           | t <- myOtherFloats]
    , [ className   =? c --> doF (W.shift "2") | c <- webApps]
    , [ className   =? c --> doF (W.shift "3") | c <- ircApps]
    ]
  where myFloats      = ["MPlayer", "Gimp", "Yakuake", "krunner", "Plasma-desktop"]
        myOtherFloats = ["alsamixer"]
        webApps       = ["Firefox-bin", "Opera"] -- open on desktop 2
        ircApps       = ["Ksirc"]                -- open on desktop 3

kdeManageHook = composeOne [
             isKDETrayWindow -?> doIgnore,
             transience,
             isFullscreen -?> doFullFloat,
             resource =? "stalonetray" -?> doIgnore
         ]

myLayoutHook = smartBorders $ layoutHook standardConfig