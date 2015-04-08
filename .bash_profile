# Hombrew variables
export HOMEBREW_GITHUB_API_TOKEN="0edd4d53d288a8f7dc81e522fb3ed6d0e5e43f6b"
export HOMEBREW_PREFIX=$(brew --prefix)

# Perl stuff
export PERL5LIB=$HOME/perl5/lib/perl5/

# UNIXy environment stup
export EDITOR="`which mvim` -f"
export PATH=$HOME/bin:$HOME/.composer/vendor/bin:$HOMEBREW_PREFIX/sbin:$HOMEBREW_PREFIX/bin:$HOMEBREW_PREXI/opt/go/libexec/bin:$HOME/perl5/bin:$PATH
export PATH=$PATH:$(brew --prefix ruby)/bin
export PATH=$PATH:$(brew --prefix go)/libexec/bin
export LESSOPEN='|'`which lesspipe.sh`' %s'


# Go stuff
export GOPATH=$HOME/.go


# set php version
source $(brew --prefix php-version)/php-version.sh && php-version 5
php-version 5.4

# Docker variables
export DOCKER_HOST=tcp://127.0.0.1:2376
export DOCKER_CERT_PATH=/Users/janusz/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1


# Stuff that only makes sense for bash
#
if [ `basename $SHELL` == "bash" ]; then
		# setup liquid prompt
		if [ -f /usr/local/share/liquidprompt ]; then
			. /usr/local/share/liquidprompt
		fi

		# Setup bash completion
		if [ -f $(brew --prefix)/etc/bash_completion ]; then
			. $(brew --prefix)/etc/bash_completion
		fi
fi

# Node stuff
if [ -f $HOME/.nvm/nvm.sh ]; then
  . /Users/janusz/.nvm/nvm.sh
fi

# my aliases
alias excel='open -a "Microsoft Excel"'

# Tell the rest of the world my profile's loaded!
export MY_PROFILE_IS_LOADED=1