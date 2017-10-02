# a couple things I want to do with this theme:
# 1. clear prompt (λ) color when not in a git repo
# 2. show # of commits ahead/behind before prompt
# 3. set prompt yellow with uncomitted changes, red with untracked files
# 4. probably find a new color for the git branch, as it kind of blends in atm
# maybe one day...

local blue="%{$fg[blue]%}"
local cyan="%{$fg[cyan]%}"
local green="%{$fg[green]%}"
local grey="%{$fg_bold[black]%}"
local red="%{$fg[red]%}"
local reset="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX=''
ZSH_THEME_GIT_PROMPT_SUFFIX=''
ZSH_THEME_GIT_PROMPT_DIRTY="${red}λ${reset}"
ZSH_THEME_GIT_PROMPT_CLEAN="${green}λ${reset}"

local user_host="$blue%n@%m$reset"
local working_dir="$grey%c$reset"
local git_prompt='$(parse_git_dirty)'

local git_branch='$(git_current_branch)'
local git_branch_c="${grey}${git_branch}${reset}"
local return_code="%(?..$red %? ↵$reset)"
local systime="${cyan}%*${reset}"

PROMPT="${user_host}:${working_dir} ${git_prompt} "
RIGHT_PROMPT="${return_code} ${git_branch_c} ${systime}"

RPS1=$RIGHT_PROMPT

function zle-line-init zle-keymap-select {
  RPS1="${RIGHT_PROMPT} ${${KEYMAP/vicmd/☆}/(main|viins)/★}"

  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
