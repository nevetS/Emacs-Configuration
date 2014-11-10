Emacs Configuration
===================


The goal of setting this up is to be able to easily pull my emacs configuration
from machine to machine.  You can use my emacs configuration by following the
installation instructions below.


# CUSTOMIZATIONS #

 * file backups
    * file backups are all stored in ~/.emacs.d/backup
    * 20 new versions of backups are saved
    * 5 old versions of backups
    * backup by copy is enabled
 * autosaves
    * autosaves are stored in ~/.emacs.d/autosaves
 * font is set to [DejaVu Sans Mono](http://dejavu-fonts.org/wiki/Main_Page)
 * delete-selection-mode is set to 1 (enables replacing of highlighted text)
 * color-theme is installed
    * color theme selected is zenburn
	  ![ ](http://orgmode.org/worg/images/color-themes/color-theme-zenburn.png)
 * unbound plugin (finds unbound keys)
 * M-n in c-mode goes to the end of the line, inserts a ; returns and auto-indents
 * M-p is tied to return,tab for c-mode
 * linum mode installed and enabled by default (line numbers in left column)
 * startup screen is disabled
 * startup is in single-buffer mode (no split screen)
 * autopair is installed (parens and quotes automatically generate a matching
   closing entity)
 * python-mode.el
    * pymacs
    * ropemacs
 
   


# TODO #

   * more extensive itemization of emacs customizations


## NOTE ##

 - Ubuntu shows Gtk-WARNING **: Unable to locate theme engine in
module_path: "pixmap", repeatedly.  The resolution to this is to install the
gtk2-engines-pixbuf package

# INSTALL #

    cd ~/.emacs.d
    git clone https://github.com/nevetS/Emacs-Configuration.git ./
    mkdir ~/.emacs.d/autosaves
    mkdir ~/.emacs.d/backup

