# $FreeBSD: src/share/skel/dot.cshrc,v 1.14 2007/05/29 22:07:57 dougb Exp $ #
# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
#

# vim: filetype=tcsh

# A righteous umask
umask 22

set path = (/bin /sbin /usr/bin /usr/sbin /usr/games /usr/local/bin /usr/local/sbin $HOME/bin)

setenv	EDITOR	vim
setenv	PAGER	less
setenv	BLOCKSIZE	K

setenv  LANG zh_TW.UTF-8
setenv  LC_ALL zh_TW.UTF-8

set autolist
set autologout=60
set correct=cmd
set dspmbyte=utf8
set ellipsis
set noclobber
set recexact

set promptchars = "%#"
set prompt = "(%P) %{[34m%}%n%{[1;37m%}@%{[0;31m%}%m%{[m%}[%{[30;42m%}%c2%{[m%}] %{[m%}"
set prompt2 = "(%P) %# "
set prompt3 = "(%P) Do you mean %B%R%B(y|n|e|a)? "
set default_prompt = "$prompt"
alias precmd "source $HOME/.csh/git-branch"

if ($?prompt) then
    # An interactive shell -- set some stuff up
    set filec
    set history = 100
    set savehist = 100
    set mail = (/var/mail/$USER)
    if ( $?tcsh ) then
        bindkey "^W" backward-delete-word
        bindkey -k up history-search-backward
        bindkey -k down history-search-forward
    endif
endif

if (-d $HOME/.csh) then
    foreach f ( `ls $HOME/.csh/*.rc` )
        # echo -n "loading $f..."
        source $f
        # echo done
    end
endif
