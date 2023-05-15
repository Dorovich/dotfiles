-- Activamos la compilación para agilizar la carga...
vim.loader.enable()

-- Cargamos los distintos cachos de la configuración...
require('core/options')
require('core/keybinds')
require('core/autocmds')
require('core/plugins')
require('core/plugin_config')
