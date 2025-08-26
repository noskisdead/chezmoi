set EDITOR nvim
set aurhelper paru

function fish_greeting
  enable_transience
  fish_hybrid_key_bindings
  pokego --no-title --random 1,3,5,7
end

# List Directory
alias l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree

alias pyenv 'source env/bin/activate.fish'
alias cat bat
alias emacs 'emacs -nw'
alias vencord 'sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"'

abbr ani-cli "ani-cli --skip"
abbr g git
abbr push "git add . && git commit -m 'idk fr' && git push"
abbr g git
abbr vim nvim
abbr vi nvim
abbr v nvim
abbr n nvim
abbr mkdir 'mkdir -p'
abbr sl ls
abbr pdw pwd
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr .3 'cd ../../..'
abbr .4 'cd ../../../..'
abbr .5 'cd ../../../../..'

abbr mkdir 'mkdir -p'
abbr mv 'mv -i'
abbr shred 'shred -vzu -n5'
abbr wipe 'wipe -r'
abbr htop btop
abbr top btop

abbr v nvim
abbr n nvim
abbr ranger yazi
abbr ssh 'kitten ssh'

zoxide init fish --cmd cd | source
starship init fish | source
