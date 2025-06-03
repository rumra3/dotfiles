if status is-interactive
	fish_vi_key_bindings

	set -U fish_greeting "🐟"

	source $HOME/.aliases

	export EDITOR='nvim'
	export VISUAL='nvim'

	export LC_CTYPE=en_US.UTF-8
	export LC_ALL=en_US.UTF-8
end
