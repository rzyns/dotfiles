if [ -f $HOME/.profile ]; then
  source $HOME/.profile
fi

if [ -f /usr/local/share/liquidprompt ]; then
  source /usr/local/share/liquidprompt
fi

if [ -e "${HOME}/.iterm2_shell_integration.bash" ]; then
  source "${HOME}/.iterm2_shell_integration.bash"
fi

