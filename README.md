The goal of setting this up is to be able to easily pull my emacs configuration from machine to machine, account to account and have it work seamlessly - the only necessary step being to initialize a git repository in emacs.d and pull from github.


This branch is deprecated, but should still work to create a CEDET enabled
emacs environment, at least with emacs 23.x, if not 24.

# CUSTOMIZATIONS

 * file backups
    * file backups are all stored in ~/.emacs.d/backup
    * 20 new versions of backups are saved
    * 5 old versions of backups
    * backup by copy is enabled
 * autosaves
    * autosaves are stored in ~/.emacs.d/autosaves
 * yasnippet is installed and enabled
    * snippets are stored in ~/.emacs.d/plubins/yasnippet-0.6.1c/snippets
    * some custom snippets that I've created as needed
 * haskell mode is installed
 * font customized
 * delete-selection-mode is set to 1 (enables replacing of highlighted text)
 * color-theme is installed
    * color theme selected is zenburn
 * cedet is installed (I believe this may be a problem for windows installs, haven't tested)
    * M-RET opens the semantic auto-complete menu
 * unbound plugin (??)
 * M-n in c-mode goes to the end of the line, inserts a ; returns and auto-indents
 * linum mode installed (M-x linum-mode will show line numbers along the left side of the screen)
 * M-p is tied to return,tab for c-mode
 * startup screen is disabled
 * startup is in single-buffer mode (no split screen)
 * autopair is installed (parens and quotes automatically generate a matching closing entity)


# TODO
   X move config from .emacs to init.el
   * edit init.el appropriately so that it works cross platform
   * move autohotkey script into this directory
   X build other setup instructions
   *X test
      tested another user on same machine
      tested configuration on Ubuntu machine with fresh emacs install
      still need to test windows
   X itemize emacs customizations


NOTE - I do have some packages installed from ELPA.  Not sure if those will copy cleanly cross-platform.
NOTE - Ubuntu shows  Gtk-WARNING **: Unable to locate theme engine in module_path: "pixmap", repeatedly.  The resolution to this is to install the gtk2-engines-pixbuf package

# INSTALL
 set up your github ssh keys
 cd ~/.emacs.d
 git clone git@github.com:nevetS/Emacs-Configuration.git ./
 Works for another user on the same machine (Fedora Core 14 / Emacs 23.2.1)

# UPDATE
 I've been using git gui for this - 
  Fetch from origin (github)
  local merge (Merge->Local Merge, select MASTER)


