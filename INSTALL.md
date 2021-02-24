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

#### Mode-line format (optional)

Evaluate `omni-setup-modeline-format` to enable the custom mode-line-format:

<p align="center">
  <img alt="Emacs Mode-line based on Omni" src="./modeline_screenshot.png">
</p>


#### Note

The custom mode line provided with `omni-theme` uses the [all-the-icons](https://github.com/domtronn/all-the-icons.el) package. The package itself is installed along with `omni-theme`.

However, it is necessary to install the `fonts` in the `fonts` directory included in `all-the-icons` repository as explained in its `README`:

> in order for the icons to work you will need to install the Resource Fonts included in this package, they are available in the > fonts directory.

Or you can run the following command:

```
M-x all-the-icons-install-fonts RET
```

#### Activating theme

1. Add the following to you `init.el`:
```elisp
(load-theme 'omni t)
;; Optionally setup the modeline
(omni-setup-modeline-format)
```

Or execute `M-x load-theme RET omni RET`.
