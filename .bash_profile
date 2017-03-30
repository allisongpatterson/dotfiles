[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Set Prompt
PS1="$ "
#PS1="________________________________________________________________________________\n| \w @ \h (\u) \n| => "

# Set Path
export PATH="$PATH:/usr/local/bin/"
export PATH="/usr/local/git/bin:/sw/bin/:/usr/local/bin:/usr/local/:/usr/local/sbin:$HOME/bin:$PATH"

# Set Editor
export EDITOR='subl'
#export EDITOR=/usr/bin/

# Keep SSH agent active between terminal sessions
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi

# Load ssh key at start of each session
ssh-add -A &> /dev/null

# Aliases
alias pgboot='pg_ctl -D ~/Dev/kufak-suite/pg_db start'
alias cp='cp -iv'                    # Preferred 'cp' implementation
alias mv='mv -iv'                    # Preferred 'mv' implementation
alias mkdir='mkdir -pv'              # Preferred 'mkdir' implementation
alias ll='ls -GlAhp'                 # Preferred 'ls' implementation
alias hell='cd ~/Dev/hellblazer'	 # skip straight to hellblazer

# Functions
cd() { builtin cd "$@"; ls; } # automatically run ls after changing directories

extract () { 				  # unzip ALL the things!
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
             esac
         else
             echo "'$1' is not a valid file"
         fi
    }