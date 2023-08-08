# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/arjit/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
source ~/powerlevel10k/powerlevel10k.zsh-theme


alias c="clear"
alias q="exit"
alias l="ls -la"
alias ls="exa --long -all --icons --header"
alias kitconf="nvim ~/.config/kitty/kitty.conf"
alias i3conf="nvim ~/.config/i3/config"
alias n="nvim"
alias poly="nvim ~/.config/polybar/config.ini"
alias gits="git status"
alias files="cd /run/media/arjit/FILES/"
alias down="cd /run/media/arjit/DOWNLOADS/"
alias co="cd /run/media/arjit/CODE/"
alias misc="cd /run/media/arjit/MISC/"
alias tmux="tmux -u"
alias ses="tmux -u a -t"
alias t="cd /run/media/arjit/CODE/ && tmux -u new -s"
alias inv="cd /run/media/arjit/CODE/invoila/webapp"
alias fixkde="kquitapp5 plasmashell && kstart5 plasmashell"
alias ts="nvim tasks.txt"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Load Angular CLI autocompletion.
source <(ng completion script)
