let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +2 lua/plugins/lsp/lspconfig/on_attach.lua
badd +128 lua/plugins/lsp/lspconfig/init.lua
badd +2 init.lua
badd +32 lua/plugins/others/copilot.lua
badd +11 lua/plugins/primary/telescope.lua
badd +23 lua/plugins/others/telescope-undo.lua
badd +3 lua/plugins/primary/nvim-autopairs.lua
badd +3 lua/plugins/primary/nvim-surround.lua
badd +4 lua/plugins/primary/nvim-treesitter.lua
badd +31 lua/plugins/primary/toggleterm.lua
badd +3 lua/plugins/primary/vim-visual-multi.lua
badd +33 lua/plugins/lsp/lspconfig/nvim-lspconfig.lua
badd +3 lua/plugins/others/hardtime.lua
badd +3 lua/plugins/others/kulala.lua
badd +1 lua/plugins/others/colorizer.lua
badd +106 lua/core/keys.lua
badd +1 lua/plugins/others/obsidian.lua
badd +23 lua/plugins/colorschemes/catppuccin.lua
badd +2 lua/plugins/colorschemes/rose-pine.lua
badd +1 lua/plugins/lsp/mason.lua
badd +1 lua/plugins/lsp/lspconfig/mason-lspconfig.lua
badd +7 lua/core/init.lua
badd +3 lua/plugins/others/avante.lua
badd +5 lua/plugins/lsp/conform/mason-conform.lua
badd +99 lua/core/options.lua
badd +6 lua/plugins/lsp/vimtex.lua
badd +65 lua/plugins/others/gitsigns.lua
argglobal
%argdel
edit lua/plugins/lsp/lspconfig/nvim-lspconfig.lua
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
balt lua/plugins/lsp/lspconfig/init.lua
setlocal foldmethod=expr
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal nofoldenable
let s:l = 33 - ((12 * winheight(0) + 11) / 22)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 33
normal! 013|
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
