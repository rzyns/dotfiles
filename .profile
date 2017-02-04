# This is for environment variables and such that are not shell-specific or
# scripts and such which detect their own environment

export HOMEBREW_GITHUB_API_TOKEN=a680c42052b44d2dd8ba4330abee825309ad006f
export PATH=/usr/local/bin:/usr/local/sbin:$HOME/.composer/vendor/bin:$HOME/.themekit:$PATH

export JIRA_URL="https://tenthavenuecommerce.atlassian.net"
#export JIRA_NAME="janusz"

# this is in .profile because you need it to be able to run node stuff
eval "$(nodenv init -)"

alias ls='ls -GF'
export PYENV_ROOT="${HOME}/.pyenv"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi
