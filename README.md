<h1 align="center">
  <br>
  <img src="https://storage.googleapis.com/golden-wind/github/omni/omni.png" alt="Omni Logo" width="100">
  <br>
  Omni for <a href="https://www.gnu.org/software/emacs/">Emacs</a>
  <br>
</h1>

<p align="center">
  <strong>Dark theme for <a href="https://www.gnu.org/software/emacs/">Emacs</a></strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/PRs-welcome-%235FCC6F.svg" alt="PRs welcome!" />

  <img alt="License" src="https://img.shields.io/badge/license-MIT-%235FCC6F">
</p>

<p align="center">
  <a href="#install">Install</a> •
  <a href="#team">Team</a> •
  <a href="#license">License</a>
</p>

<p align="center">
  <img alt="Omni screnshoot for Emacs" src="./screenshot.png">
</p>

## Install

All instructions can be found at [INSTALL.md](./INSTALL.md).

## Mode-line format (optional)

Evaluate `omni-setup-modeline-format` to enable the custom mode-line-format:

<p align="center">
  <img alt="Emacs Mode-line based on Omni" src="./modeline_screenshot.png">
</p>


### Note

The custom mode line provided with `omni-theme` uses the [all-the-icons](https://github.com/domtronn/all-the-icons.el) package. The package itself is installed along with `omni-theme`.

However, it is necessary to install the `fonts` in the `fonts` directory included in `all-the-icons` repository as explained in its `README`:

> in order for the icons to work you will need to install the Resource Fonts included in this package, they are available in the > fonts directory.

Or you can run the following command:

```
M-x all-the-icons-install-fonts RET
```

## Supported packages

Omni has supports for many packages, including the following:

- ace-window
- anzu
- avy
- clojure-mode
- company-mode
- diff-hl
- ediff
- elfeed
- erc
- eshell
- flycheck
- helm
- hydra
- ido
- ivy
- jabber.el
- js2-mode
- ledger
- linum
- magit
- markup-face
- notmuch
- orgmode
- powerline
- show-paren
- visible-mark
- web-mode
- wgrep
- whitespace-mode

## Team

This theme is maintained by the following person(s) and a bunch of [awesome contributors](https://github.com/getomni/template/graphs/contributors).

| [![Matheus Pessanha](https://github.com/Mdsp9070.png?size=100)](https://github.com/Mdsp9070)     |
| ------------------------------------------------------------------------------------------------ |
| [Matheus Pessanha](https://github.com/Mdsp9070)                                                  |

## License

[MIT License](./LICENSE.md)
