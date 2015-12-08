#!/usr/bin/env sh
find . -name "*.rb" -exec vim -c 'set expandtab | set shiftwidth=2 | set softtabstop=2 | exe "normal gg=G" | write | quit ' {} \; 
find . -name "*.erb" -exec vim -c 'set expandtab | set shiftwidth=2 | set softtabstop=2 | exe "normal gg=G" | write | quit ' {} \; 
find . -name "*.css" -exec vim -c 'set expandtab | set shiftwidth=2 | set softtabstop=2 | exe "normal gg=G" | write | quit ' {} \; 
find . -name "*.scss" -exec vim -c 'set expandtab | set shiftwidth=2 | set softtabstop=2 | exe "normal gg=G" | write | quit ' {} \; 
find . -name "*.js" -exec vim -c 'set expandtab | set shiftwidth=2 | set softtabstop=2 | exe "normal gg=G" | write | quit ' {} \; 
find . -name "*.coffee" -exec vim -c 'set expandtab | set shiftwidth=2 | set softtabstop=2 | exe "normal gg=G" | write | quit ' {} \; 
find . -name "*.feature" -exec vim -c 'set expandtab | set shiftwidth=2 | set softtabstop=2 | exe "normal gg=G" | write | quit ' {} \; 
find . -name "*.md" -exec vim -c 'set expandtab | set shiftwidth=2 | set softtabstop=2 | exe "normal gg=G" | write | quit ' {} \; 
