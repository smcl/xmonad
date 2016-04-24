# xmonad

I accidentally nuked my config once and it was sorta tough to reproduce, so I thought it's better to keep it in source control.

# installing (xmonad from scratch)

```
$ cd ~
$ sudo apt-get install xmonad libghc-xmonad-contrib-dev xmobar dmenu cabal-install
$ git clone github.com/smcl/xmonad .xmonad
```

Then configure X11 to load xmonad when it starts - different for each distro/greeter etc.

# todo

There are a handful of things still sorta-wrong:

* hard-coded weather (xmobar)
* hard-coded network interface (xmobar)
* hard-coded user directory when loading xmobarrc - think I can either use "~/.xmonad/xmonadrc" or roll it into the main xmonad.hs somehow
* assumes presence of Adobe's "Source Code Pro" font - wonder if there's a way to fall back (or I should just use a standard monospaced font)