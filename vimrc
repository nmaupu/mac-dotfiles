set nocompatible              " be iMproved, required
filetype off                  " required

" Make backspace behave like in most programs
set backspace=indent,eol,start

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'lifepillar/vim-solarized8'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'fatih/vim-go'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'MicahElliott/Rocannon'
Plugin 'ctrlpvim/ctrlp.vim'

" Ansible
Plugin 'pearofducks/ansible-vim'
Plugin 'vim-syntastic/syntastic'

" Terraform
Plugin 'juliosueiras/vim-terraform-completion'
Plugin 'hashivim/vim-terraform'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()

filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone

hi clear

" highlight groups
" hi Normal       guifg=White       guibg=grey20
hi Cursor       guibg=khaki       guifg=slategrey
hi VertSplit    guibg=#c2bfa5     guifg=grey50    gui=none
hi Folded       guibg=grey30      guifg=gold
hi FoldColumn   guibg=grey30      guifg=tan
hi IncSearch    guifg=slategrey   guibg=khaki
hi ModeMsg      guifg=goldenrod
hi MoreMsg      guifg=SeaGreen
hi NonText      guifg=LightBlue   guibg=grey30
hi Question     guifg=springgreen
hi Search       guibg=peru        guifg=wheat
hi SpecialKey   guifg=yellowgreen
hi StatusLine   guibg=#c2bfa5     guifg=black     gui=none
hi StatusLineNC guibg=#c2bfa5     guifg=grey50    gui=none
hi Title        guifg=indianred
hi Visual       guifg=khaki       guibg=olivedrab gui=none
hi WarningMsg   guifg=salmon

" syntax highlighting groups
hi Comment      guifg=SkyBlue
hi Constant     guifg=#ffa0a0
hi Identifier   guifg=palegreen
hi Statement    guifg=khaki
hi PreProc      guifg=indianred
hi Type         guifg=darkkhaki
hi Special      guifg=navajowhite
hi Ignore       guifg=grey40
hi Todo         guifg=orangered guibg=yellow2

" color terminal definitions
hi SpecialKey   ctermfg=darkgreen
hi NonText      cterm=bold ctermfg=darkblue
hi Directory    ctermfg=darkcyan
hi ErrorMsg     cterm=bold ctermfg=7 ctermbg=1
hi IncSearch    cterm=NONE ctermfg=yellow ctermbg=green
hi Search       cterm=NONE ctermfg=grey ctermbg=blue
hi MoreMsg      ctermfg=darkgreen
hi ModeMsg      cterm=NONE ctermfg=brown
hi LineNr       ctermfg=3
hi Question     ctermfg=green
hi StatusLine   cterm=bold,reverse
hi StatusLineNC cterm=reverse
hi VertSplit    cterm=reverse
hi Title        ctermfg=5
hi Visual       cterm=reverse
hi VisualNOS    cterm=bold,underline
hi WarningMsg   ctermfg=1
hi WildMenu     ctermfg=0 ctermbg=3
hi Folded       ctermfg=darkgrey ctermbg=NONE
hi FoldColumn   ctermfg=darkgrey ctermbg=NONE
hi DiffAdd      ctermbg=4
hi DiffChange   ctermbg=5
hi DiffDelete   cterm=bold ctermfg=4 ctermbg=6
hi DiffText     cterm=bold ctermbg=1
hi Comment      ctermfg=darkcyan
hi Constant     ctermfg=brown
hi Special      ctermfg=5
hi Identifier   ctermfg=6
hi Statement    ctermfg=3
hi PreProc      ctermfg=5
hi Type         ctermfg=2
hi Underlined   cterm=underline ctermfg=5
hi Ignore       ctermfg=darkgrey
hi Error        cterm=bold ctermfg=7 ctermbg=1

" Syntastic Config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" (Optional)Remove Info(Preview) window
set completeopt-=preview

" (Optional)Hide Info(Preview) window after completions
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" (Optional) Enable terraform plan to be include in filter
let g:syntastic_terraform_tffilter_plan = 1

set encoding=utf-8
set fileencoding=utf-8

syntax reset
syntax enable


set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark
colorscheme solarized8

set relativenumber
set number
set hlsearch

" Disable code folding
set nofoldenable

" Renaming some commands
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Qa! qa!
cnoreabbrev Wq wq
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
cnoreabbrev X x
cnoreabbrev X! x!

"""""""""""""""""""
" Remap shortcuts "
"""""""""""""""""""
" Hint :
"   - To use C-x and C-S-x to work in vim at the same time
"     We need to remap those shortcut in rxvt
"     from .Xresources using the following:
"       URxvt.keysym.Control-0x43: \033x
"     0x43 is upper C (example) in ascii table
"     in vim:
"       map <ESC>x :echo "C-S-C has been pressed"
"       map <C-C>  :echo "C-C" has been pressed"

" Remap Ctrl+arrows to the correct escape sequence
" To Get the sequence, use Ctrl+V Ctrl+Left/Right/Up/Down
" in a term (or in vim)
" In mac os handle that using correct profiles in iTerm2
" map  <ESC>Oa <C-Up>
" map  <ESC>Ob <C-Down>
" map  <ESC>Od <C-Left>
" map  <ESC>Oc <C-Right>
" map! <ESC>Oa <C-Up>
" map! <ESC>Ob <C-Down>
" map! <ESC>Od <C-Left>
" map! <ESC>Oc <C-Right>

" Remap ctrl+shift+Left/Right
" to simple shortcut (done in .Xresources file via rxvt remapping)
" map  <ESC>f  <C-S-Left>
" map  <ESC>g  <C-S-Right>
" map  <ESC>w  <C-S-W>
" map! <ESC>f  <C-S-Left>
" map! <ESC>g  <C-S-Right>
" map! <ESC>w  <C-S-W>

" Remap windows navigation to something easier
nmap <silent> <C-Up>    <ESC>:wincmd k<CR>
nmap <silent> <C-Down>  <ESC>:wincmd j<CR>
nmap <silent> <C-Left>  <ESC>:wincmd h<CR>
nmap <silent> <C-Right> <ESC>:wincmd l<CR>

" Tabs handling - all modes
map  <silent> <C-S-Right> <ESC>:tabnext<CR>
map  <silent> <C-S-Left>  <ESC>:tabprevious<CR>
map  <silent> <C-T>       <ESC>:tabnew<CR>
" map  <silent> <C-S-W>     <ESC>:tabclose<CR>
map! <silent> <C-S-Right> <ESC>:tabnext<CR>
map! <silent> <C-S-Left>  <ESC>:tabprevious<CR>
map! <silent> <C-T>       <ESC>:tabnew<CR>
" map! <silent> <C-S-W>     <ESC>:tabclose<CR>

" Spell check
map <silent> <F7> "<ESC>:silent setlocal spell! spelllang=en<CR>"
map <silent> <F6> "<ESC>:silent setlocal spell! spelllang=fr<CR>"

" Disable "ex mode" shortcut
map Q <Nop>

" Make tabs (tabulator) visible
" Beware: shortcut is also C-S-T (see .Xresources for rxvt remapping)
set listchars=tab:>-
map  <ESC>t :set list!<CR>
map! <ESC>t <ESC>:set list!<CR>

" toggle relative numbers and line numbers
map <silent> <C-l> <ESC>t :set relativenumber!<CR>:set number!<CR>

" make command from shortcut
" Cannot use <C-M> as it will also be mapped as <CR> :(
" So when pressing enter, that launch make command.
" Using <C-B> instead
map <C-B> :!make<CR>

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <C-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" autocmd vimenter * NERDTree
map <C-N> :NERDTreeToggle<CR>
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Airline stuff
" https://github.com/vim-airline/vim-airline
let g:airline_theme='base16'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_skip_empty_sections = 1

" Ctrlp
let g:ctrlp_map = '<C-P>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.swo,*.zip

" Indentation
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4

" Display the current line we are in
set cursorline
