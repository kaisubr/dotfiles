
# https://github.com/blinks zsh theme
# https://github.com/agnoster/agnoster-zsh-theme
# https://en.wikipedia.org/wiki/Guillemet
function _test_all() {
    echo "\ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699"
}

function _after_char() {
    echo ' ⟩' # ' λ'
}

function _middle_char() {
    echo ' • ' # ':'
}

function _prompt_char() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    echo "%{%F{blue}%}±%{%f%k%b%}"
  elif $(hg root > /dev/null 2>&1); then
    echo "%{%F{blue}%}☿%{%f%k%b%}"
  else
    echo ''
  fi
}

function _prompt_info() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    echo $(git_prompt_info)
  elif $(hg root &> /dev/null); then
    echo $(hg_prompt_info 2> /dev/null) || ""
  fi
}

# This theme works with both the "dark" and "light" variants of the
# Solarized color schema.  Set the SOLARIZED_THEME variable to one of
# these two values to choose.  If you don't specify, we'll assume you're
# using the "dark" variant.

case ${SOLARIZED_THEME:-dark} in
    light) bkg=white;;
    *)     bkg=black;;
esac

ZSH_THEME_GIT_PROMPT_PREFIX=" [%{%B%F{blue}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%k%b%K{${bkg}}%B%F{green}%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}*%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_HG_PROMPT_PREFIX=" [%{%B%F{blue}%}"
ZSH_THEME_HG_PROMPT_SUFFIX="%{%f%k%b%K{${bkg}}%B%F{green}%}]"
ZSH_THEME_HG_PROMPT_DIRTY=" %{%F{red}%}*%{%f%k%b%}"
ZSH_THEME_HG_PROMPT_CLEAN=""

# if desired a new line, https://stackoverflow.com/a/44301984
PROMPT='%{%K{${bkg}}%B%F{green}%}%n%{%B%F{blue}%}$(_middle_char)%{%F{yellow}%K{${bkg}}%}%~%{%B%F{green}%}$(_prompt_info)%E%{%f%k%b%}%{%K{${bkg}}%}$(_prompt_char)%{%K{${bkg}}%}$(_after_char)%{%f%k%b%}'
RPROMPT='%{%K{${bkg}}%B%F{cyan}%}%D{%H:%M - %d/%m/%Y}%{%f%k%b%}'
# RPROMPT='%{%K{${bkg}}%B%F{cyan}%}%D{%H:%M - %d/%m/%Y}%{%f%k%b%}'
