set nocompatible                      " Make vim more useful.
set encoding=utf-8 nobomb             " BOMB often causes trouble.
set nobackup                          " enable backups.
set noswapfile                        " it's 2013, Vim.
set autoindent                        " Copy indent from last line when
                                      " starting new line.

set backspace=indent,eol,start        " Allows backspace to indent.
set cursorline                        " Highlight current line.
set diffopt=filler                    " Add vertical spaces to keep right
                                      " and left aligned.

set diffopt+=iwhite                   " Ignore whitespace changes
                                      " (focus on code changes).
set expandtab                         " Expand tabs to spaces.
set formatoptions=                    " Reset defaults.
set formatoptions+=c                  " Format comments.
set formatoptions+=r                  " Continue comments by default.
set formatoptions+=o                  " Make comment when using o or O from
                                      " comment line.

set formatoptions+=q                  " Format comments with gq.
set formatoptions+=n                  " Recognize numbered lists.
set formatoptions+=2                  " Use indent from 2nd line of a
                                      " paragraph.

set formatoptions+=l                  " Don't break lines that are already
                                      " long.
set formatoptions+=1                  " Break before 1-letter words.
set hidden                            " When a buffer is brought to
                                      " foreground, remember undo history
                                      " and marks.

set hlsearch                          " Highlight searches.
set ignorecase                        " Ignore case of searches.
set incsearch                         " Highlight dynamically as pattern
                                      " is typed.

set laststatus=2                      " Always show status line.
set magic                             " Enable extended regexes.
set noerrorbells                      " Disable annoying and stupid error
                                      " bells.

set nojoinspaces                      " Only insert single space after a
                                      " '.', '?' and '!' with a join
                                      " command.

set noshowmode                        " Don't show the current mode
                                      " (airline.vim takes care of us).

set nostartofline                     " Don't reset cursor to start of line
                                      " when moving around.
set nowrap                            " Do not wrap lines.
set nu                                " Show line numbers
set ofu=syntaxcomplete#Complete       " Set omni-completion method.
set ruler                             " Show the cursor position.
set synmaxcol=200                     " Don't try to highlight lines longer
                                      " than 200 characters.
set title                             " Show the filename in the window
                                      " titlebar.
set ttyfast                           " Send more characters at a given
                                      " time.

set notimeout                         " Time out on key codes but not
                                      " mappings. Basically this makes
                                      " terminal Vim work sanely.

set ttimeout
set ttimeoutlen=10
set undofile                          " Persistent Undo.
set visualbell                        " Use visual bell instead of audible
                                      " bell (annnnnoying).

set winminheight=0                    " Allow splits to be reduced to a
                                      " single line.

set wrapscan                          " Searches wrap around end of file.
set wildchar=<TAB>                    " Character for CLI expansion
                                      " (TAB-completion).

set wildmenu                          " Hitting TAB in command mode will
                                      " show possible completions above
                                      " command line.

set wildmode=list:longest             " Complete only until point of
                                      " ambiguity.

set wildignore+=*.{jpg,gif,png,psd}
set wildignore+=*.min.js,*.min.css
set wildignore+=*/vendor/*
set wildignore+=*/node_modules/*
set wildignore+=*/.sass-cache/*
set wildignore+=*/log/*,*/tmp/*
set wildignore+=*/build/*
set wildignore+=*/ckeditor/*,
set wildignore+=*/doc/*,*/docs/*
set wildignore+=*/source_maps/*
set wildignore+=*.sw?
set wildignore+=*.DS_Store
set wildignore+=.hg,.git,.svn
set wildignore+=*.luac
set wildignore+=*.pyc
set wildignore+=*.orig
set wildignore+=*.o,*.obj,*.exe,*.dll

" vim.tiny occasionally ignores the `if !has' conditionals. If I manage to
" find it out I'm going to comment out the lines above and replace all its
" characters with 'FUCK'.
" Computers are bullshit.
if has ("autocmd")
  syntax enable
  set background=dark
  filetype plugin indent on
  colorscheme solarized
endif

