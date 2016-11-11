export HOMEBREW_GITHUB_API_TOKEN=a680c42052b44d2dd8ba4330abee825309ad006f
export PATH=/usr/local/bin:/usr/local/sbin:$HOME/.composer/vendor/bin:$PATH

# this is in .profile because you need it to be able to run node stuff
eval "$(nodenv init -)"

alias ls='ls -GF'
eval "$(pyenv init -)"
