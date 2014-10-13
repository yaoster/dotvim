# common
ENV_NAME="DYAO_YELP"
HOME_DIR=$HOME

# ENV_NAME OPTIONS:
# DYAO_YELP
# LINUX

if [ "$ENV_NAME" == "DYAO_YELP" ]
then
    alias ll="ls -lh -G"
    alias ls="ls -h -G"
    alias dir="ls -al -G | more"
    alias duo="du -h -d 1"
    alias rm="rmtrash"
    alias tmptags="/usr/local/bin/ctags -R --tag-relative=yes -f $HOME_DIR/.vim/tags/tmp .; ls -lh $HOME_DIR/.vim/tags/tmp"
elif [ "$ENV_NAME" == "LINUX" ]
then
    alias ll="ls -lh --color=auto"
    alias ls='ls -h --color=auto'
    alias dir="ls -al --color=always | more"
    alias duo="du -h --max-depth=1"
    alias rm="mv --target-directory ~/Recycle"
    alias tmptags="ctags -R --tag-relative=yes -f $HOME_DIR/.vim/tags/tmp .; ls -lh $HOME_DIR/.vim/tags/tmp"
fi

alias la="ls -a"
alias gn="gnumeric"
alias vi="vim"
alias nf="find . \! -type d | wc -l"
alias Rnif="R --no-init-file"
#alias ipython="ipython -pylab"

echo "Custom aliases set for $ENV_NAME using a home directory of $HOME_DIR"
