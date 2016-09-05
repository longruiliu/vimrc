# My collection of 256-color vim colorschemes.
Because I don't care about the other vim colorschemes.

## Installation

#### Using [vundle](https://github.com/gmarik/vundle/) (**recommended!**)

    % echo 'Bundle noah/vim256-color' >> ~/.vimrc:
    % vim +BundleInstall!

#### Using [Pathogen](http://www.vim.org/scripts/script.php?script_id=2332)

    % cd ~/.vim/bundle
    % git clone --recursive git://github.com/noah/vim256-color.git

#### Manual install

    % git clone --recursive git://github.com/noah/vim256-color.git colors
    % cp ./colors/* ~/.vim/colors

#### Manual update

With a few exceptions (e.g., where a public git source is not
available), these themes references to git submodules.  So, they can be
updated *en masse* by doing the following:

    % git submodule foreach git pull
    % ./update_links.sh

`upadate_links.sh` is a git pre-commit hook, I provide it here since
these hooks aren't versioned by git...

## Including:

  256-grayvim 256-jungle beauty256 blacklight calmar256-lightdark
  desert256 donbass.vim The-Vim-Gardener icansee.vim inkpot
  jellybeans.vim vim-hybrid Zenburn khaki.vim lettuce.vim Liquid-Carbon
  leo256 lodestone Lucius lilypink pink peaksea mrkn256.vim molokai miko
  southernlights rdark-terminal vim-colors-solarized strange
  summerfruit256.vim synic.vim tabula.vim tchaba tir_black vilight.vim
  wombat256 vim-vividchalk vim-vividchalk-sexy xoria256.vim badwolf
  bubblegum Simple256 fu crt colorful256 charged-256 Gentooish
  greenvision mac-classic
  
## Adding a theme


    git submodule add git://github.com/nelstrom/vim-mac-classic-theme.git submodules/vim-mac-classic-theme
    ./update_links.sh
    git commit -a -m'blah'
    git push

## See also:

* Notes on the 256 color mode of xterm: http://frexx.de/xterm-256-notes/
* 256 colors in vim: http://vim.wikia.com/wiki/256_colors_in_vim
* 256 color chart: http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html
* Vivify vim theme editor: http://bytefluent.com/vivify/
