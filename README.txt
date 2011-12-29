This is the README for the git repository.

This emacs configuration is not functional at this time.

The goal of setting this up is to be able to easily pull my emacs configuration from machine to machine, account to account and have it work seamlessly - the only necessary step being to initialize a git repository in emacs.d and pull from github.

So far, all I've done is figuring out how to initialize the repo and do an initial push to github.

TODO
   X move config from .emacs to init.el
   * edit init.el appropriately so that it works cross platform
   * move autohotkey script into this directory
   * build other setup instructions
   *X test
      tested another user on same machine
      still need to test windows
      still need to test ubuntu (other linux platforms)
   * itemize emacs customizations

Off the top of my head, the following are included here:
  YASnippet
  CEDET (would like to make this optional, or maybe even turned on by an M-x command)
  Some custom keybindings
  Color formatting

NOTE - I do have some packages installed from ELPA.  Not sure if those will copy cleanly cross-platform.

INSTALL
 set up your github ssh keys
 cd ~/.emacs.d
 git clone git@github.com:nevetS/Emacs-Configuration.git ./
 Works for another user on the same machine (Fedora Core 14 / Emacs 23.2.1)
