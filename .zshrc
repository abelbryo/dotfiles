# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git play sublime)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin
export PATH=$PATH:/Users/terefea1/adt-bundle-mac-x86_64/sdk/tools
export PATH=$PATH:/Users/terefea1/adt-bundle-mac-x86_64/sdk/platform-tools
export PATH=$PATH:/Library/Framworks/GDAL.framework/Programs
export PATH=$PATH:/Users/terefea1/google_appengine
export PATH=$PATH:/Users/terefea1/google_appengine/goroot/bin   # go programming language bin file 
export PATH=$PATH:/usr/local/share/npm/bin
export PYTHONPATH=/usr/local/lib/python2.7/site-packages
export GOPATH=$PATH/User/terefea1/google_appengine/goroot


# Colorize the Terminal
export CLICOLOR=1;
[ "$TERM" = "xterm" ] && TERM="xterm-256color"

# TMUX
if which tmux 2>&1 >/dev/null; then
    # if no session is started, start a new session
    test -z ${TMUX} && tmux

    # when quitting tmux, try to attach
    while test -z ${TMUX}; do
        tmux attach || break
    done
fi


alias cal="gcal"


