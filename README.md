# xmonad

I accidentally nuked my config once and it was sorta tough to reproduce, so I thought it's better to keep it in source control.

# installing (xmonad from scratch)

```
$ cd ~
$ sudo apt-get install xmonad libghc-xmonad-contrib-dev xmobar dmenu cabal-install
$ git clone github.com/smcl/xmonad .xmonad
```

Then configure X11 to load xmonad when it starts - different for each distro/greeter etc.

# using

When XMonad loads it'll just be a blank screen with a mouse pointer - clicking all over the place won't do anything. You'll eventually figure out a setup that's comfortable for you, but here's a set of steps that'll create two workspaces - one running `firefox` and the other with two `xterm`s side-by-side.

# <kbd>Windows</kbd>+<kbd>Shift</kbd>+<kbd>Enter</kbd> (creates xterm 1)
# <kbd>Windows</kbd>+<kbd>Shift</kbd>+<kbd>Enter</kbd> (creates xterm 2)
# <kbd>Windows</kbd>+<kbd>2</kbd> (create and switch to a new workspace)
# <kbd>Windows</kbd>+<kbd>p</kbd>, `firefox`, <kbd>Enter</kbd> (launch firefox using dmenu)

# todo

There are a handful of things still sorta-wrong:

* hard-coded weather (xmobar)
* hard-coded network interface (xmobar)
* hard-coded user directory when loading xmobarrc - think I can either use "~/.xmonad/xmonadrc" or roll it into the main xmonad.hs somehow
* assumes presence of Adobe's "Source Code Pro" font - wonder if there's a way to fall back (or I should just use a standard monospaced font)