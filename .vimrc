" Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Load plugins
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/seoul256.vim'

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'

Plug 'ciaranm/detectindent'
Plug 'scrooloose/syntastic'
Plug 'itchyny/lightline.vim'

Plug 'zah/nim.vim'

Plug 'jpalardy/vim-slime'
" Put your cursor over the text you want to send and type:
"   C-c, C-c       --- the same as slime
" Call :SlimeConfig if you need to send text elsewhere

" For switching between tmux panes in vim
Plug 'christoomey/vim-tmux-navigator'

function! HelpTagsFugitive(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    helptags '~/.vim/plugged/vim-fugitive/doc'
  endif
endfunction
Plug 'tpope/vim-fugitive', { 'do': function('HelpTagsFugitive') }

" Signs in the gutter showing add/delete/modify
Plug 'airblade/vim-gitgutter'

" On-demand loading of nerdtree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'ctrlpvim/ctrlp.vim'

Plug 'junegunn/vim-emoji'

Plug 'cespare/vim-toml'

" Add plugins to &runtimepath
call plug#end()

set timeoutlen=1000 ttimeoutlen=0

" Set tab options
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

au Filetype python set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" Auto-complete emojis in markdown files with Ctrl+X+U
augroup emoji_complete
  autocmd!
  autocmd FileType markdown setlocal completefunc=emoji#complete
augroup END

" to prefer expandtab to noexpandtab when detection is impossible:
let g:detectindent_preferred_expandtab = 1

" to set a preferred indent level when detection is impossible:
let g:detectindent_preferred_indent = 2

" To use preferred values instead of guessing:
let g:detectindent_preferred_when_mixed = 1

" Unified color scheme (default: dark)
syntax enable
colorscheme seoul256
" colorscheme solarized
set background=dark

" Show line numbers
set number

" Open file explorer
map <C-n> :NERDTreeToggle<CR>
map <C-p> :Files<CR>

" Open Fuzzy Finder
" map <C-p> :FZF<CR>

" Move up and down one row on the screen, even if the line wraps around.
nmap j gj
nmap k gk

" Use ctrl-h/j/k/l to switch between splits.
noremap <C-h> <C-W>h
noremap <C-j> <C-W>w
noremap <C-k> <C-W>W
noremap <C-l> <C-W>l

let mapleader=","
"Open a new tab.
nmap <Leader>t :tabnew <CR>
" nmap <Leader>q :q<CR>
" Paste the contents of the system clipboard.
nmap <Leader>v "+p
" Highlight all occurrences of the current word.
nmap <Leader>f :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls!<CR>
" Toggle wrap on and off.
nmap <Leader>w :set nowrap! <CR>
" Toggle showing whitespace characters.
nmap <Leader>s :set list! <CR>
" Toggle NERDTree.
"nmap <Leader>e :NERDTreeToggle<CR>
"nmap <Leader>y :w !pbcopy <CR><CR>
nmap <Leader>p :set paste!<CR>

"----------------------------------------------------------------------------
" Replace selected text with something else
" Escape special characters in a string for exact matching.
" This is useful to copying strings from the file to the search tool
" Based on this - http://peterodding.com/code/vim/profile/autoload/xolox/escape.vim
function! EscapeString (string)
  let string=a:string
  " Escape regex characters
  let string = escape(string, '^$.*\/~[]')
  " Escape the line endings
  let string = substitute(string, '\n', '\\n', 'g')
  return string
endfunction

" Get the current visual block for search and replaces
" This function passed the visual block through a string escape function
" Based on this - http://stackoverflow.com/questions/676600/vim-replace-selected-text/677918#677918
function! GetVisual() range
  " Save the current register and clipboard
  let reg_save = getreg('"')
  let regtype_save = getregtype('"')
  let cb_save = &clipboard
  set clipboard&

  " Put the current visual selection in the " register
  normal! ""gvy
  let selection = getreg('"')

  " Put the saved registers and clipboards back
  call setreg('"', reg_save, regtype_save)
  let &clipboard = cb_save

  "Escape any special characters in the selection
  let escaped_selection = EscapeString(selection)

  return escaped_selection
endfunction

" Start the find and replace command across the entire file
vmap <C-r> <Esc>:%s/<c-r>=GetVisual()<cr>//gc<left><left><left>
"----------------------------------------------------------------------------

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" {{syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <Leader>e :SyntasticCheck<CR> :SyntasticToggleMode<CR>
" syntastic}}

let g:lightline = {
    \ 'colorscheme': 'seoul256',
    \ }

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.pdf,*.gif

" Ignore folders for ctrlp
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"   \ 'file': '\v\.(exe|so|dll|jpg|png|pdf|gif)$',
"   \ 'link': 'some_bad_symbolic_links',
"   \ }

" let g:ctrlp_user_command = 'find %s -type f | grep -v node_modules/ | grep -v vendor/'
" let g:ctrlp_user_command = 'find %s -type f \( ! -iname "*.png" -and ! -iname "*.jpg" -and ! -iname "*.pdf" -and ! -iname "*.webp" -and ! -iname "*.svg" \) | grep -v node_modules/ | grep -v vendor/'
" let g:ctrlp_user_command = 'fd --type file --follow --hidden --exclude .git --exclude vendor/ --exclude .vim/ --exclude .git/ %s'

let g:slime_target = "tmux"

augroup reload_vimrc
    autocmd!
    autocmd bufwritepost $MYVIMRC nested source $MYVIMRC
augroup END

if has("multi_byte")
    if &termencoding == ""
        let &termencoding = &encoding
    endif
    set encoding=utf-8
    setglobal fileencoding=utf-8
    set fileencodings=ucs-bom,utf-8,latin1
endif

au BufRead,BufNewFile Snakefile,*.snakefile,*.snake set syntax=snakemake
