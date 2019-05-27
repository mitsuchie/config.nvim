" =============================================================================
" autocmdを初期化
" =============================================================================
augroup myvimrc
  autocmd!
augroup END

" =============================================================================
" terminal encoding
" =============================================================================
let &termencoding = has('win32') || has('win64') ? 'cp932' : 'utf-8'

" =============================================================================
" vimfilesの設定
" =============================================================================
let s:home = expand('<sfile>:h')

" =============================================================================
" dein
" =============================================================================
let &runtimepath .= ','.expand(s:home.'/dein/repos/github.com/Shougo/dein.vim')

if dein#load_state(s:home.'/dein')
  call dein#begin(s:home.'/dein')
  call dein#load_toml(s:home.'/dein.toml',      {'lazy': 0})
  call dein#load_toml(s:home.'/dein_lazy.toml', {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

" =============================================================================
" settings
" =============================================================================
set number              " 行数表示
set ts=2 sw=2 sts=2     " 基本インデント
set expandtab           " タブ展開
set incsearch           " インクリメントサーチ
set ignorecase          " 大文字小文字無視
set smartcase           " 大文字小文字検索
set smartindent         " スマートインデント
set nobackup            " バックアップなし
set noswapfile          " スワップなし
set undofile            " undoファイルあり
set tags=tags;          " タグの設定
set laststatus=2        " ステータス行を2行にする
set cmdheight=2         " コマンド行は1行に
set showcmd             " 常にステータス行を表示する
set clipboard+=unnamedplus " クリップボード共有
set showmatch           " 対応する括弧の表示
set hlsearch            " 検索結果のハイライト
set history=100         " ヒストリの最大
set backspace=indent,start,eol  " インデントを消せるようにする
set formatoptions-=ro   " 改行時にコメント継続させない
set list                " 不可視文字描画
set listchars=tab:^\_,trail:~,extends:.
set wildmenu wildmode=list,longest:full
set t_ut=
set cursorline

augroup myvimrc
  autocmd QuickFixCmdPost *grep* cwindow
  autocmd FileType cpp setlocal expandtab ts=4 sts=4 sw=4
augroup END

" =============================================================================
" keymapping
" =============================================================================
nnoremap s  <nop>
nnoremap si :<C-u>lcd %:h<CR>:pwd<CR>
nnoremap <silent> J 5j
nnoremap <silent> K 5k
" <ESC>連打でハイライトを消す
nnoremap <ESC><ESC> :nohlsearch<CR>
" タグ関係
nnoremap t <C-t>
" タブで移動
nnoremap <TAB> <C-w>w
" タブ移動
nnoremap <silent> } gt
nnoremap <silent> { gT
" ESC
tnoremap <silent> <ESC> <C-\><C-n>

" =============================================================================
" cache
" =============================================================================
let g:neosnippet#snippets_directory = s:home.'/snippets/'
let g:neosnippet#data_directory  = s:home.'/cache/neosnippet/'
let g:neomru#directory_mru_path  = s:home.'/cache/neomru/directory'
let g:neomru#file_mru_path       = s:home.'/cache/neomru/file'
let &undodir = s:home.'/cache/undo'
let &viminfo = &viminfo.',n'.s:home.'/cache/_viminfo'

" =============================================================================
" colorscheme
" =============================================================================
try
  colorscheme torte
  colorscheme hybrid
  set background=dark
catch
endtry

" =============================================================================
filetype plugin indent on
syntax enable
