### [Emacs](https://www.gnu.org/software/emacs/)

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

#### Activating theme

1. Add the following to you `init.el`:
```elisp
(load-theme 'omni t)
;; Optionally setup the modeline
(omni-setup-modeline-format)
```

Or execute `M-x load-theme RET omni RET`.
