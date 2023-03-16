-- Mostrar numeros de linea
vim.opt.number = true

-- No mostrar barra de estado
vim.opt.laststatus = 0

-- No usar archivo de swap
vim.opt.swapfile = false

-- Tabulaciones como 4 espacios (comentar para una tabulacion clasica)
vim.opt.shiftwidth = 4

-- Copiar y pegar directamente al portapapeles
vim.opt.clipboard = 'unnamedplus'

-- No redibujar la pantalla durante la ejecución de macros
vim.opt.lazyredraw = true

-- Mostar 8 elementos como máximo en el menú desplegable
vim.opt.pumheight = 8

-- Las nuevas ventanas aparecen abajo y/o a la derecha
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Path donde se buscarán los archivos mencionados si se desea saltar a ellos
vim.opt.path = '.,/usr/include'
vim.opt.mousemodel = 'extend'

-- "Coma" como tecla líder
vim.g.mapleader = ','

-- Colorear las cabeceras de c como código fuente
vim.g.c_syntax_for_h = true

-- "ñ" para entrar en modo comando
vim.keymap.set('n', 'ñ', ':', {})

-- "jk" para salir de modo insertar
vim.keymap.set('i', 'jk', '<Esc>', {})

-- ",r" para buscar y reemplazar (ej. :%s/antiguo/nuevo/g)
vim.keymap.set('n', '<Leader>r', ':%s//g<Left><Left>', {})

-- ",t" para despleagar una terminal
vim.keymap.set('n', '<Leader>t', ':split<CR>:term<CR>i', {})

-- ",c" para compilar desde el cirectorio actual (hace falta Makefile)
vim.keymap.set('n', '<Leader>c', ':!make<CR>', {})

-- Salir de la terminal cuando se acaba con ella
vim.api.nvim_create_autocmd("TermClose", { command = "call nvim_input('<CR>')" })
