# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#
# ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git docker)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#######
#
# Example aliases
alias zshconfig="v ~/.zshrc"
#alias ohmyzsh="mate ~/.oh-my-zsh"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias checknotifications='tail /home/ryan/notes/notifications.txt | tac | less'
alias servercheck='~/scripts/cronjobs/remind.sh servercheck && servercpu'
alias servercpu="ssh fedora-server 'ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head'"
alias mybible='v -o /mnt/hdd/Documents/bsb-last.txt ~/notes/biblenotes.txt'
#alias nemovids='nemo -t "/mnt/hdd/Videos/" "/mnt/hdd/Videos/Racing/" "/mnt/server-hdd/media/Videos/" &> /dev/null &'
alias ashshutdown="ssh ashleyhp 'shutdown -h now'"
alias jup='jupyter --no-browser'
alias birthdays='bat /mnt/hdd/Desktop/BIRTHDAYS.txt'
alias fix='sudo $(history -p !!)'
alias o='xdg-open'
alias meallist='cat ~/notes/meals.list | shuf -n 10'
alias bdideas='v ~/notes/ashleybirthdayideas.txt'
alias sudo='sudo '
alias today='v ~/notes/today.txt'
#alias menno10meals='find /mnt/hdd/Downloads/websitedownload/MennoniteGirls/www.mennonitegirlscancook.ca/ -type f ! -path 'search' ! -iname 'bread-for-journey*' ! -iname 'index.html' | shuf -n 10'
alias myreminders='v ~/notes/reminders.txt'
#alias z='v ~/.zshrc'
#alias z='zoxide'
#alias mytodo='v ~/notes/todo.txt'
#alias teatime='sleep 300 && cvlc -R file:///home/ryan/Music/mixkit-scanning-sci-fi-alarm-905.wav'
alias h='history | fzy'
alias webdownload='cd /mnt/hdd/downloads/websitedownload/'
alias asendryan-download='scp ashleyhp:/home/ashley/.sendtoryan /home/ryan/notes/asendryan.txt'
alias vids='ranger /mnt/server-hdd/media/Videos /mnt/hdd/Videos /mnt/hdd/Videos/Racing'
alias checkvlc="cat /$HOME/.config/vlc/vlc-qt-interface.conf | grep list= | awk -F "," '{print $0}'"
#alias mylastwatched='cat /$HOME/.config/vlc/vlc-qt-interface.conf | grep list= | awk -F "," '{for (i=1; i<=NF; i++) print $i}' | awk -F "/" '{print $(NF-2)"/"$(NF-1)"/"$(NF)}' | sed -E 's/%20/ /g;s/%2C/,/g' | head -30 | less'
alias servervideobackup='rsync -rauhL --progress --exclude-from=/mnt/hdd/Videos/.exclude-shows.txt /mnt/hdd/Videos /mnt/server-hdd/media'
alias dzlauncher='~/gitclones/dztui/dzgui.sh'
alias v='nvim'
alias e='exa --group-directories-first'
alias fd='fdfind'
alias diff='diff --color="always"'
alias myprayers='v ~/notes/prayers.txt'
alias accsetups='cd /home/ryan/.var/app/com.valvesoftware.Steam/.local/share/Steam/steamapps/compatdata/805550/pfx/drive_c/users/steamuser/Documents/Assetto\ Corsa\ Competizione/Setups'
alias f='cd $(find . -type d | fzf)'
alias sm='xmodmap -e "pointer = 1 2 3"'
alias lm='xmodmap -e "pointer = 3 2 1"'
#alias shopping='bat ~/notes/myshoppinglist.list | fzy'
#alias mybins='bat ~/notes/binstoremember.list | fzy'
#alias ls='echo "testing"'
#alias aaasearchtest='find /home/ryan/Downloads'
#alias ttttt='searchfunct $@ /home/ryan/Downloads'
#alias ..='cd ..'
#alias ...='cd ../..'
#alias ....='cd ../../..'
#alias .....='cd ../../../..'
#alias up='cd ..'
#alias mennosearch='bash /home/ryan/scripts/aliases/menosearch.sh'
#alias fuck='sudo !!'

# Custom file where I add functions
if [ -f ~/.bash_functions ]; then
	. ~/.bash_functions
fi

if [ -f ~/.bash_secrets ]; then
	. ~/.bash_secrets
fi

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
#else
#    echo -e "\tNo 'bash_aliases' found"
fi

### VIM motions MUST be set before fzf zsh files in order to get fzf history
set -o vi

# source /usr/share/doc/fzf/examples/completion.zsh
# source /usr/share/doc/fzf/examples/key-bindings.zsh
#echo $PATH
#echo $SHLVL

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if ! [[ $PATH == *"/home/ryan/.cargo/bin:/home/ryan/scripts:/usr/local/go/bin:/home/ryan/go/bin"* ]]; then
    PATH="$PATH:/home/ryan/.cargo/bin:/home/ryan/scripts:/usr/local/go/bin:/home/ryan/go/bin"
fi

export EDITOR=nvim
export VISUAL=nvim
#neofetch
eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"

# opam configuration
test -r /home/ryan/.opam/opam-init/init.zsh && . /home/ryan/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
