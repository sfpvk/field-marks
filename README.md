![](https://github.com/sfpvk/field-marks/blob/main/example.gif)
# field-marks
neovim plugin for creating marks in the line number column
## Installation
```shell
$ cd ~/.config/nvim/pack/nvim/start
$ git clone {field-marks repository}
```
~/.config/nvim/init.lua :
```lua
-- just an example, keyboard shortcuts can be any
vim.keymap.set('n', '<leader>m', require('field-marks').field_mark_toggle)
vim.keymap.set('n', '<leader>mm', require('field-marks').field_mark_delall)
```
