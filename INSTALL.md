### [Emacs](https://www.gnu.org/software/emacs/)

#### Supported Packages

You can find a complete of all supported packages on the [README](README.md) file.

#### Install using MELPA

This theme is hosted on MELPA repository

```
M-x package-install RET omni-theme
```

#### Install using Git

If you are a git user, you can install the theme by cloning the repo:

    $ git clone https://github.com/getomni/emacs.git

#### Install manually

Download using the [GitHub .zip download](https://github.com/getomni/emacs/archive/main.zip) option and unzip them.

#### Activating theme manually

1. Create a directory called `elisp` on your `emacs` config path.
2. Place the `omni.el` file on this directory
3. Add the following to your `init.el`:
```elisp
(add-to-list 'load-path "<emacs-config-path>/elisp/")

(load-theme 'omni t)
```
ps: replace `<emacs-config-path>` with the desired path, example: `~/.emacs.d/`

#### Activating theme installed from MELPA

1. Add the following to you `init.el`:
```elisp
(load-theme 'omni t)
```

Or execute `M-x load-theme RET omni RET`.
