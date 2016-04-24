import XMonad
import XMonad.Layout
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders
import XMonad.Layout.Gaps
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import Graphics.X11.ExtraTypes.XF86
import XMonad.Actions.Volume(toggleMute, lowerVolume, raiseVolume)
 
-- NOTES: 0.10 works much better than 0.9, unfortunately distros mostly package 0.9 atm
-- xmobar and fullscreen flash vids (youtube): http://code.google.com/p/xmobar/issues/detail?id=41
 
-- TODO: would still like fullscreen flash vids to not crop and leave xmobar drawn
-- TODO: remove the red border when doing fullscreen? tried adding 'smartBorders' to the layoutHook but that didn't work
-- TODO: hook in TopicSpaces, start specific apps on specific workspaces
 
main = do
  xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmonad/xmobarrc"
  xmonad $ defaultConfig {
    modMask = mod4Mask, 
    terminal = "xterm",
-- if you are using xmonad 0.9, you can avoid web flash videos getting cropped in fullscreen like so:
-- manageHook = ( isFullscreen --> doFullFloat ) <+> manageDocks <+> manageHook defaultConfig,
-- (no longer needed in 0.10)
    layoutHook = avoidStruts $ layoutHook defaultConfig,
    --manageHook = manageDocks <+> manageHook defaultConfig,
    --layoutHook = avoidStruts ( smartBorders (Full ||| Mirror tiled )),
    manageHook = composeOne [ isFullscreen -?> doFullFloat,
                              isDialog     -?> doCenterFloat ]
    <+> composeAll [ className =? "fontforge" --> doFloat,
                     className =? "MPlayer"   --> doFloat,
                     title     =? "glxgears"  --> doFloat,
                     className =? "Gimp"      --> doFloat]
    <+> manageDocks,
    
    logHook = dynamicLogWithPP $ xmobarPP
                        { ppOutput = hPutStrLn xmproc,
                          ppTitle = xmobarColor "white" "" . shorten 50
                        }
  } `additionalKeys` [((0, xF86XK_AudioMute), toggleMute >> return ())
                     , ((0, xF86XK_AudioLowerVolume), lowerVolume 5 >> return ())
                     , ((0, xF86XK_AudioRaiseVolume), raiseVolume 5 >> return ())
                     , ((0, xF86XK_MonBrightnessUp), spawn "xbacklight +20")
                     , ((0, xF86XK_MonBrightnessDown), spawn "xbacklight -20")
                     ]
