--[[ opts.lua ]]
local opt = vim.opt

-- [[ Context ]]
opt.number = true               -- bool: Show line numbers
opt.signcolumn = "yes"          -- str:  Show the sign column
opt.clipboard = "unnamedplus"
opt.mouse = ""

-- [[ Encoding ]]
opt.encoding = 'utf8'           -- str:  String encoding to use

-- [[ Theme ]]
opt.syntax = "ON"               -- str:  Allow syntax highlighting

-- [[ Search ]]
opt.ignorecase = true           -- bool: Ignore case in search patterns
opt.smartcase = true            -- bool: Override ignorecase if search contains capitals

-- [[ Whitespace ]]
opt.expandtab = true            -- bool: Use tabs instead of spaces
opt.shiftwidth = 4              -- num:  Size of an indent
opt.softtabstop = 4             -- num:  Number of spaces tabs count for in insert mode
opt.tabstop = 4                 -- num:  Number of spaces tabs count for

-- [[ Splits ]]
opt.splitright = true           -- bool: Place new window to right of current one
opt.splitbelow = true           -- bool: Place new window below the current one

-- [[ Keymap ]]
opt.timeoutlen = 2000           -- int:  Set key sequence wait length

-- [[ Fold and conceal ]]
opt.foldlevel = 99              -- int: How deep to fold on start up, 0 to fold all, 99 for none
opt.conceallevel = 2            -- int: How text with syntax attribute should be display

