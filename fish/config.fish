if status is-interactive
    # Commands to run in interactive sessions can go here
end

eval "$(/opt/homebrew/bin/brew shellenv)"

set fish_greeting
alias q="exit"
alias vim="nvim"
function fish_prompt
	printf '\n%s%s%s\nλ ' (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

# opam configuration
source /Users/bg/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

