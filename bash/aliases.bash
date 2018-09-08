alias ls='ls -h --color'
alias l='ls -l'
alias ll='ls -ortah'
alias la='ls -ha'
alias lsp='ls -s -Q -v -S -1p -H -i -X'
alias cp='cp -rpi'
alias update='source ~/.bash_aliases'
alias vi='vim'
alias gather-diff-patches='find . -iname "*.patch" -exec mv "{}" ~/quagga-patches \;'
alias update='source ~/.bash_aliases'
alias gather-diff-patches='find . -iname "*.patch" -exec mv "{}" ~/quagga-patches \;'
alias cls=clear
alias title='XTitle $1'
alias xt='xterm -bg black -fg white&'
alias pd='pushd'
alias pop='popd'
alias ?='history'
alias ssh='ssh -Y'
export MANPATH=usr/local/ActivePerl-5.16/man/:usr/local/ActivePerl-5.16/site/man/:share/man:usr/local/java/man:$MANPATH
alias psmreid='ps auxx | grep mreid'
alias sv='ct setview $1'
alias packageinstall='sudo apt-get -y install'
alias packageremove='sudo apt-get -y remove'
alias packageautoremove='sudo apt-get -y autoremove'
alias dist-upgrade='sudo apt-get -y dist-upgrade'
alias packagesearch='sudo apt-cache search'
alias update='. ~/.bash_aliases'

