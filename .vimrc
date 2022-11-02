" <Vundle> ---------- {
    " Brief help
    " :PluginList       - lists configured plugins
    " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
    " :PluginSearch foo - searches for foo; append `!` to refresh local cache
    " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
    "
    " see :h vundle for more details or wiki for FAQ
    " Put your non-Plugin stuff after this line

    " change lang to english
    let $LANG='en_US.UTF-8'

    set nocompatible              " be iMproved, required
    filetype off                  " required

    " set the runtime path to include Vundle and initialize
    call plug#begin()

    " let Vundle manage Vundle, required
    " Plug 'VundleVim/Vundle.vim'

    " ----- Put you plugin here -----
    " <nerdtree>
    Plug 'scrooloose/nerdtree'
    Plug 'jistr/vim-nerdtree-tabs'
    " Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tpope/vim-fugitive'
    Plug 'ryanoasis/vim-devicons'
    " Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

    " <fzf>
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' },
    Plug 'junegunn/fzf.vim'
    Plug 'easymotion/vim-easymotion'

    " <syntax>
    Plug 'mustache/vim-mustache-handlebars'
    Plug 'posva/vim-vue'
    Plug 'cespare/vim-toml'
    Plug 'prettier/vim-prettier', {
        \ 'do': 'yarn install',
        \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

    " <code complete>
    Plug 'Valloric/YouCompleteMe'
    Plug 'Raimondi/delimitMate'
    Plug 'scrooloose/nerdcommenter'
    " Plug 'honza/vim-snippets'
    " Plug 'SirVer/ultisnips'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

    " <tag>
    Plug 'majutsushi/tagbar'
    Plug 'ludovicchabant/vim-gutentags'

    " <status bar>
    Plug 'mhinz/vim-startify'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " ----- Put you plugin here -----

    call plug#end()            " required
    filetype plugin indent on    " required
" }

" <General>  ---------- {
    " ==========================================
    " general
    " ==========================================
    " Use bash instead fish
    packloadall

    set shell=/bin/bash

    set laststatus=2

    " clipboard
    set clipboard=unnamed

    " set font
    set encoding=UTF-8
    " set guifont=Hack_Nerd_Font:h11

    " ==========================================
    " show and format
    " ==========================================
    " enable lines
    set number
    " set nowrap

    " show syntax
    syntax on

    " highlight search
    set hlsearch
    " ignore case
    set ignorecase
    " real time search
    set incsearch
    " When type upper case, will show it only
    set smartcase

    " by default, the indent is 4 spaces.
    set expandtab
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4

    " convert tab to space
    " :set list
    " :set expandtab
    " :retab
    " :set nolist

    " for yaml files, 2 spaces
    autocmd Filetype yaml setlocal expandtab ts=2 sw=2 sts=2
    " for vue files, 2 spaces
    autocmd Filetype vue setlocal expandtab ts=2 sw=2 sts=2
    " for html files, 2 spaces
    autocmd Filetype html setlocal expandtab ts=2 sw=2 sts=2
    " for js files, 2 spaces
    autocmd Filetype javascript setlocal expandtab ts=2 sw=2 sts=2
    " for tsx files, 2 spaces
    autocmd Filetype typescriptreact setlocal expandtab ts=2 sw=2 sts=2

    " don't insert comment leader automatically when clicking o/O
    au FileType * set fo-=o
    "" don't insert comment leader automatically when clicking enter
    "au FileType * set fo-=r
    "" don't auto-wrap textwidth when inserting comment header
    "au FileType * set fo-=c

    " buffer switch
    " nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
    " nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

    " ==========================================
    " edit and modify
    " ==========================================
    "nnoremap <leader>s :update<CR>
    nnoremap jk <esc>:update<CR>
    nnoremap kj <esc>:update<CR>
    inoremap jk <esc>:update<CR>
    inoremap kj <esc>:update<CR>
" }

" <status bar> ---------- {
    " ==========================================
    " Plugin mhinz/vim-startify
    " ==========================================
    let g:startify_session_persistence = 1
    let g:startify_session_autoload = 1

    " mapping command
    nnoremap <leader>so :SLoad
    nnoremap <leader>ss :SSave
    nnoremap <leader>sd :SDelete<CR>
    nnoremap <leader>sc :SClose<CR>
    " mapping special commands
    nnoremap <leader>ss! :SSave!<CR> :NERDTreeTabsOpen<CR>

    " after loading session event
    autocmd SessionLoadPost * NERDTreeTabsOpen
    " before saving session event
    let g:startify_session_before_save = [
        \ 'echo "Cleaning up before saving.."',
        \ 'silent! NERDTreeTabsClose'
    \ ]

    " ==========================================
    " Plugin vim-airline
    " ==========================================
    " enable powerline font and tabline
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1

    " config tabline
    let g:airline#extensions#tabline#show_tab_type = 0
    let g:airline#extensions#tabline#show_tab_nr = 1
    let g:airline#extensions#tabline#tab_nr_type = 1
    let g:airline#extensions#tabline#show_buffers = 0
    let g:airline#extensions#tabline#buffer_nr_show = 0
    let g:airline#extensions#tabline#show_splits = 0
    let g:airline#extensions#tabline#show_close_button = 0

    "" set left separator
    "let g:airline#extensions#tabline#left_sep = ' '
    "" set left separator which are not editting
    "let g:airline#extensions#tabline#left_alt_sep = '|'
    "" show buffer number
    "let g:airline#extensions#tabline#buffer_nr_show = 1
    " let g:airline_theme='badwolf'
    " map num buffer
    nnoremap <leader>1 1gt<CR>
    nnoremap <leader>2 2gt<CR>
    nnoremap <leader>3 3gt<CR>
    nnoremap <leader>4 4gt<CR>
    nnoremap <leader>5 5gt<CR>
    nnoremap <leader>6 6gt<CR>
    nnoremap <leader>7 7gt<CR>
    nnoremap <leader>8 8gt<CR>
    nnoremap <leader>9 9gt<CR>
" }

" <fzf> ---------- {
    " ==========================================
    " Plugin fzf
    " ==========================================

    " RG function
    function! RipgrepFzf(query, fullscreen)
      let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
      let initial_command = printf(command_fmt, shellescape(a:query))
      let reload_command = printf(command_fmt, '{q}')
      let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
      call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
    endfunction

    " Use Ag for file content only instead file name
    command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
    " Use Rg for file content only instead file name
    command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
      \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
      \   <bang>0)
    " Use RG for file content only instead file name with preview windows
    command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

    " brew install fzf
    " brew install the_silver_searcher
    nnoremap <silent> <expr> <leader>ff (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
    " nnoremap <silent> <expr> <leader>fl (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":BLines\<cr>"
    " nnoremap <silent> <expr> <leader>fb (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Lines\<cr>"
    " nnoremap <silent> <expr> <leader>fh (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":History\<cr>"
    " nnoremap <silent> <expr> <leader>fc (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Ag\<cr>"
    nnoremap <silent> <expr> <leader>fc (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Rg\<cr>"
    " nnoremap <silent> <expr> <leader>fc (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":RG\<cr>"
    nnoremap <silent> <expr> <leader>gs (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":GFiles?\<cr>"
    nnoremap <silent> <expr> <leader>gc (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":BCommits\<cr>"

    let g:fzf_action = {
        \ 'ctrl-t': 'tab drop',
        \ 'ctrl-i': 'split',
        \ 'ctrl-s': 'vsplit' }
" }

" <tag> ---------- {
    " ==========================================
    " Plugin ctags
    " ==========================================
    " set tags=./tags,./TAGS,tags;~,TAGS;~

    " ==========================================
    " Plugin vim-gutentags
    " ==========================================
    " root direcroty
    let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

    " tagfile name
    " let g:gutentags_trace = 1
    let g:gutentags_ctags_tagfile = '.tags'

    " enable ctags
    let g:gutentags_modules = []
    if executable('ctags')
        let g:gutentags_modules += ['ctags']
    endif

    " add the tags file in to ~/.cache/tags
    let s:vim_tags = expand('~/.cache/tags')
    let g:gutentags_cache_dir = s:vim_tags

    " " Configure ctags parameter
    let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
    let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
    let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

    " create it if not exist
    if !isdirectory(s:vim_tags)
       silent! call mkdir(s:vim_tags, 'p')
    endif

    " ==========================================
    " Plugin tagbar
    " ==========================================
    " toggle tagbar display
    nnoremap <silent> <leader>t :TagbarToggle<CR>
    " autofocus on tagbar open
    let g:tagbar_autofocus = 1
    let g:tagbar_width = 30
    " let g:tagbar_type_go = {
        " \ 'ctagstype' : 'go',
        " \ 'kinds'     : [
            " \ 'p:package',
            " \ 'i:imports:1',
            " \ 'c:constants',
            " \ 'v:variables',
            " \ 't:types',
            " \ 'n:interfaces',
            " \ 'w:fields',
            " \ 'e:embedded',
            " \ 'm:methods',
            " \ 'r:constructor',
            " \ 'f:functions'
        " \ ],
        " \ 'sro' : '.',
        " \ 'kind2scope' : {
            " \ 't' : 'ctype',
            " \ 'n' : 'ntype'
        " \ },
        " \ 'scope2kind' : {
            " \ 'ctype' : 't',
            " \ 'ntype' : 'n'
        " \ },
        " \ 'ctagsbin'  : 'gotags',
        " \ 'ctagsargs' : '-sort -silent'
    " \ }
" }

" <code complete> ---------- {
    " ==========================================
    " Plugin YouCompleteMe
    " ==========================================

    " 默認配置文件路徑
    let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
    let g:ycm_confirm_extra_conf = 0

    " 開啟基於 tag 的補全，可以在這之後添加需要的標籤路徑
    let g:ycm_collect_identifiers_from_tags_files = 1

    " 開啟語義補全
    let g:ycm_seed_identifiers_with_syntax = 1

    " 開始補全的字符數
    let g:ycm_min_num_of_chars_for_completion = 2

    " 禁止緩存匹配項,每次都重新生成匹配項
    let g:ycm_cache_omnifunc = 0

    " 是否在註釋中也開啟補全
    let g:ycm_complete_in_comments = 1
    let g:ycm_collect_identifiers_from_comments_and_strings = 0

    " 字符串中也開啟補全
    let g:ycm_complete_in_strings = 1

    " don't popup the fuction definition on top
    set completeopt=menu,menuone
    let g:ycm_add_preview_to_completeopt = 0

    " don't do static variable diagnosis
    let g:ycm_show_diagnostics_ui = 0

    " 定義快捷鍵補全
    let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
    inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"
    inoremap <expr> <Down>  pumvisible() ? "\<C-n>" : "\<Down>"
    inoremap <expr> <Up>    pumvisible() ? "\<C-p>" : "\<Up>"

    " 設置在下面幾種格式的文件上屏蔽 ycm
    let g:ycm_filetype_blacklist = {
                \ 'tagbar' : 1,
                \ 'qf' : 1,
                \ 'notes' : 1,
                \ 'markdown' : 1,
                \ 'unite' : 1,
                \ 'text' : 1,
                \ 'vimwiki' : 1,
                \ 'pandoc' : 1,
                \ 'infolog' : 1,
                \ 'mail' : 1
                \}

    " 設置關鍵字觸發補全
    let g:ycm_semantic_triggers =  {
                \   'c' : ['->', '.', ' ', '(', '[', '&'],
                \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
                \             're!\[.*\]\s'],
                \   'ocaml' : ['.', '#'],
                \   'cpp,objcpp' : ['->', '.', '::'],
                \   'perl' : ['->'],
                \   'php' : ['->', '::'],
                \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
                \   'ruby' : ['.', '::'],
                \   'lua' : ['.', ':'],
                \   'erlang' : [':'],
                \ }

    let g:ycm_cache_omnifunc = 1
    let g:ycm_use_ultisnips_completer = 1

    " 定義函數跟蹤快捷鍵
    nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
    nnoremap <leader>ji :YcmCompleter GoToImplementation<CR>
    nnoremap <leader>jr :YcmCompleter GoToReferences<CR>

    " ==========================================
    " Plugin scrooloose/nerdcommenter
    " ==========================================
    " let g:ft = ''
    " function! NERDCommenter_before()
      " if &ft == 'vue'
        " let g:ft = 'vue'
        " let stack = synstack(line('.'), col('.'))
        " if len(stack) > 0
          " let syn = synIDattr((stack)[0], 'name')
          " if len(syn) > 0
            " exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
          " endif
        " endif
      " endif
    " endfunction
    " function! NERDCommenter_after()
      " if g:ft == 'vue'
        " setf vue
        " let g:ft = ''
      " endif
    " endfunction

    " ==========================================
    " Plugin scrooloose/nerdcommenter
    " ==========================================
    " will app space before comment
    let g:NERDSpaceDelims = 1

    " ==========================================
    " Plugin fatih/vim-go
    " ==========================================
    let g:go_highlight_types = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_function_calls = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_extra_types = 1
    let g:go_highlight_build_constraints = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_generate_tags = 1

    let g:go_metalinter_autosave = 1
    let g:go_auto_type_info = 1

    let g:go_fmt_command = "goimports"
    let g:go_list_type = "quickfix"

    autocmd FileType go nmap <leader>gb  <Plug>(go-build)
    autocmd FileType go nmap <leader>gr  <Plug>(go-run)
    autocmd FileType go nmap <leader>gt  <Plug>(go-test)
    autocmd FileType go nmap <leader>gd  :GoDef<CR>
" }


" <nerdtree> ---------- {
    " ==========================================
    " Plugin NERDTree
    " ==========================================
    " open a NERDTree automatically when vim starts up
    " autocmd vimenter * NERDTree
    " shortcut to open NERDTree
    " nnoremap <silent> <F2> :NERDTreeToggle<CR>
    nnoremap <silent> <F2> :NERDTreeTabsToggle<CR>
    " nnoremap <silent> <F3> :NERDTreeFind<CR>
    nnoremap <silent> <F3> :NERDTreeTabsFind<CR>
    nnoremap <silent> <leader>` :NERDTreeFocus<CR>
    " close vim if the only window left open is a NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    " let NERDTreeShowLineNumbers = 1
    " let NERDTreeAutoCenter = 1

    " Open doc and close NERDTree
    " let NERDTreeShowBookmarks = 1
    let NERDTreeChDirMode = 2
    " let NERDTreeQuitOnOpen = 1
    let NERDTreeShowBookmarks = 1
    let NERDTreeMinimalUI = 1
    let NERDTreeWinSize = 30

    " let NERDChristmasTree = 1
    " let NERDTreeAutoCenter = 1
    " let NERDTreeBookmarksFile = $VIM.'\Data\NerdBookmarks.txt'
    " let NERDTreeShowBookmarks = 1
    " let NERDTreeMouseMode = 2
    " let NERDTreeShowFiles = 1
    let NERDTreeShowHidden = 1
    " let NERDTreeShowLineNumbers = 1
    let NERDTreeIgnore=['.git$', '__pycache__$', '\.swp$', '\.DS_Store$']

    " ==========================================
    " Plugin NERDTree Tabs
    " ==========================================
    let g:nerdtree_tabs_open_on_console_startup = 0
    let g:nerdtree_tabs_open_on_gui_startup = 0
" }
