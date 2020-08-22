<code>dotfiles</code>

<!--

## Contents
- [Contents](#contents)
- [Usage](#usage)
  * [Vim](#vim)
    + [Install Vim](#install-vim)
    + [Setup global settings](#setup-global-settings)
    + [Setup local settings](#setup-local-settings)
  * [KDE-specific](#kde-specific)
  * [Konsole](#konsole)
  * [LaTeX](#latex)
  * [Jupyter](#jupyter)
  * [etc](#etc)
    + [Printer and scanner drivers](#printer-and-scanner-drivers)
  * [Preview](#preview)

## Usage

### Vim
The config files can be found under vim/ in this repository.

#### Install Vim
```bash
sudo apt-get install vim
# Optional, gvim:
sudo apt-get install vim-gtk3
```

#### Setup global settings
I've uncommented the recommended lines in  `/etc/vim/vimrc`:
```vim
...

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set autowrite           " Automatically save before commands like :next and :make
set hidden              " Hide buffers when they are abandoned
set mouse=a             " Enable mouse usage (all modes)

...
```

#### Setup local settings
* (where ~ expands to $HOME)
* Copy the .vimrc to _`~/.vimrc`_
* (optional) Copy the .gvimrc to _`~/.gvimrc`_
* Install [Vim-Plug package manager](https://github.com/junegunn/vim-plug#vim).
```bash
sudo curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
* Copy .vimrc.plug to _`~/.vimrc.plug`_
* Verify both files.
  * Near the end of your ~/.vimrc, and before plugin-specific settings, you should see:
  ```bash
   if filereadable(expand("~/.vimrc.plug"))
       source ~/.vimrc.plug
   endif
  ```
  * In your ~/.vimrc.plug, you should see:
  ```vim
  call plug#begin('~/.vim/plugged')

  " Plugins here...

  call plug#end()
  ```
* Restart Vim :wqall ; gvim/vim.
  * If you see an error E117, execute `sudo chmod -R 0755 ~/.vim/` and try again.
* On Vim command mode, `:PlugInstall`, which will populate ~/.vim/plugged.
* Next, `:PlugStatus`.
```
- ale: OK
- vim-fugitive: OK
- lightline.vim: OK
- vim-gitgutter: OK
- jedi-vim: OK
```

### KDE-specific
The config files can be found under kde/ in this repository.

* The kdeglobals file comes straight from the directory `~/.config/`.
* I use custom color schemes. Copy them to `~/.local/share/color-schemes/`. Then, enable one of them in System Settings > Colors.
* I have tried other Plasma Styles, especially Zren's Breeze Alpha-Black (Plasma Styles > Get New; `Panel, Text, Highlight = "#f5f5f5", "#000000", "#EF8030"`) for a while, but in the end went back to Breeze + custom color schemes.
* I also run some scripts to log battery events on my laptop using `upower`.

### Konsole
Konsole is the default terminal for KDE.
* Save the `konsole.css` file and enable it under Konsole > Menu > Configure Konsole > Tab Bar > Miscellaneous > Use user-defined stylesheet.
* Note that Konsole > Menu > Edit current profile > Appearance can be used to edit colors and transparency.

### LaTeX
What you need: a LATEX Compiler + Packages (6G) and an IDE (about 30M)
* The compiler - if you install TexLive as a portable version. (https://www.tug.org/texlive/quickinstall.html)
    1. Download the tar.gz file from https://www.tug.org/texlive/acquire-netinstall.html
    2. Run the install-tl script
    3. Select <V> for portable installation. Don't select this if you don't want it. 
    4. Configure the directory (such as /???/texlive/2020...)
    5. Install full (about 6G, an hour to install)
    6. Add PATH, INFOPATH, and MANPATH export lines to ~/.bashrc or ~/.profile
         ```bash
            # end of .bashrc
            PATH="/home/kailash/.local/bin":"/???/texlive/2020/bin/x86_64-linux":$PATH; export PATH
            MANPATH="/???/texlive/2020/texmf-dist/doc/man":$MANPATH; export MANPATH
            INFOPATH="/???/texlive/2020/texmf-dist/doc/info":$INFOPATH; export INFOPATH
        ```
* The IDE - TeXstudio can be installed from the repositories.
    1. Install:
        sudo apt-get --no-install-recommends install texstudio
            
        The flag --no-install-recommends will disable installation of dependencies (such as texlive), because we are handling texlive portably! Also see https://tex.stackexchange.com/questions/355771/how-to-install-a-tex-editor-without-texlive-on-ubuntu-16-04
        
    2. Configure TeXstudio
        * Configure command settings
            - Typically refrain from messing with this unless you are handling a portable installation, in which case it is necessary to modify certain commands.
            - Options > Configure TexStudio > Commands > PdfLaTeX:
            - Change the PdfLaTeX command based on the portable installation of TexLive:
                ```"/???/texlive/2020/bin/x86_64-linux/pdflatex" -synctex=1 -interaction=nonstopmode %.tex```
        * Configure default compiler settings
            - Options > Configure TexStudio > Build >
                ```
                    Default Compiler: PdfLatex
                    Default Viewer  : PDF Viewer
                    PDF Viewer      : Internal PDF Viewer (embedded)  
                ```
            - Options > Configure TexStudio > Preview > Command: Preview with pdflatex
            
        * Configure magnifier settings
            - Options > Configure TexStudio > Internal PDF Viewer > magnifier shape > Square
            
        * Configure compile shortcuts
            - TeXstudio saves the file before Build&View.
            - Change the binding of Build & View from F5 to CTRL+S, to get automatic preview when you press CTRL+S.
            - Options > Configure TexStudio > Shortcuts > Menus, Tools, Build View, Double click current shortcuts column > Hit CTRL+S
                
        * Enable scrolling follows cursor
            1. View PDF (F7)
            2. At the bottom of the embedded preview, click the lock icon with right arrow 
            3. Now, as you navigate the text editor with the blinking cursor, the corresponding section on the PDF will be highlighted yellow.

### Jupyter
* Use Anaconda, and install on top of existing Python installation. Anaconda will take care of it.

### etc
#### Printer and scanner drivers
I had luck with `utsushi` drivers (Image Scan v3) on 3720.
* http://download.ebz.epson.net/dsc/search/01/search/searchModule
* http://support.epson.net/linux/en/imagescanv3.php
* https://download3.ebz.epson.net/dsc/f/03/00/11/31/67/0392acfd2ca5e1d984e2d96d1ca833c1c89cca91/imagescanv3_man_e.pdf
* http://download.ebz.epson.net/man/linux/imagescanv3_e.html#sec6-4-3
* http://gscan2pdf.sourceforge.net/
     * `sudo apt-get install gscan2pdf`
     * `~/.config/gscan2pdfrc`
* References - https://wiki.archlinux.org/index.php/SANE/Scanner-specific_problems#Image_Scan!_for_Linux

### Dual booting
`PROGRAMS.zip/Rufus/README.txt`:

A] Create a bootable USB

- If UEFI, https://www.vanstechelman.eu/content/creating-an-uefi-bootable-linux-usb-stick
- Write with GPT, UEFI; and DD Mode. 
  - (That means set “Partition scheme and target system type” to “GPT partition scheme for UEFI computer”, and select "DD mode")
- Set “File system” to “FAT32 (default)”
- Set “Cluster size” to “4096 bytes (default)”
- Select “Create a bootable disk using ISO”
- Select the Ubuntu ISO.
- Make sure that Rufus hasn’t changed the partitioning scheme after you have selected the ISO.


A.1] While still in Windows
- Disable fast startup with `powercfg -h off`. (https://www.computerhope.com/issues/ch001762.htm)

A.2] Boot in Dell
Press F2 to enter BIOS. Follow https://www.dell.com/support/article/us/en/04/sln142679/how-to-enable-boot-from-dvd-option-with-uefi-boot-mode-enabled-windows-10-8-1-8?lang=en 
- You need to ensure the BIOS is set to UEFI, not Legacy. Secure boot/startup should also be disabled. The steps below will help with the process.
- Tap F2 key at the Dell logo screen to enter System Setup or BIOS
- On the left pane, click Boot Sequence.
- Boot mode should be selected as UEFI (not legacy) within the BIOS go to the General > Boot Sequence click Apply
- Check that Secure Boot is set to Disabled. Within the BIOS go to Secure Boot > Secure Boot Enable, and set the checkbox to Disabled (Figure 2)
- Go to the 'Boot Sequence' tab in the BIOS
- Thus, notice the option entitled 'USB Storage Device'. Move to the top.
https://askubuntu.com/questions/726938/how-to-boot-from-a-usb-in-uefi-mode-on-a-dell-inspiron

A.3] Restart
- Most distros have an option to "test it out" before installing. After you've finished testing it out, you can exit, restart, and proceed installation as normal.

B] Convert bootable back to normal USB stick, from Windows:

- Run CMD as Administrator
- Type DISKPART
- list disk
- select disk 1 (if your usb drive mine was 1)
- detail disk (to confirm its the right drive)
- clean
- create partition primary
- active
- Choose a format (use FAT32).
  - FAT32 is the standard for USBs: format fs=fat32 quick
  - NTFS is more modern, but isn't as widely supported: format fs=ntfs quick
- assign
- exit
- exit


### Preview
```bash
clear && echo -e "\n\n\n\n\n" && neofetch --ascii_distro kubuntu && echo -e "\n\n\n\n\n\n\n\n\n"
```

-->
