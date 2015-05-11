function _sort_length () {
  local things=$@
  local file=$1
  awk '{print length"\t"$0}' $file | sort -rn | cut -f2-
}

function join {
  local IFS="$1"; shift; echo "$*";
}

# Hombrew variables
export HOMEBREW_GITHUB_API_TOKEN="0edd4d53d288a8f7dc81e522fb3ed6d0e5e43f6b"
export HOMEBREW_PREFIX=$(brew --prefix)


# UNIXy environment stup
export EDITOR="`which mvim` -f"
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.composer/vendor/bin:$PATH
export PATH=$HOMEBREW_PREFIX/sbin:$PATH
export PATH=$HOMEBREW_PREFIX/bin:$PATH

# Perl stuff
export PERL5LIB=$HOME/perl5/lib/perl5/
export PATH=$HOME/perl5/bin:$PATH

# Add homebrew ruby gems to path
export PATH=$(brew --prefix ruby)/bin:$PATH
export PATH=$(brew --prefix python)/bin:$PATH

# Add go-gotten stuff to path
export GOPATH=$HOME/.go
export PATH=$(brew --prefix go)/libexec/bin:$PATH
export PATH=$GOPATH/bin:$PATH

# export PATH=$(join : `echo $PATH | ${HOME}/bin/strtok | sort -u`)

export LESSOPEN='|'`which lesspipe.sh`' %s'

# set php version
source $(brew --prefix php-version)/php-version.sh && php-version 5.4

export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/janusz/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

# Stuff that only makes sense for bash
#
if [ -n "$TERM" ]; then
		# setup liquid prompt
		if [ -f /usr/local/share/liquidprompt ]; then
			. /usr/local/share/liquidprompt > /dev/null 2>&1
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
alias ls='gls -GF --color'

function excel () {
  if [[ $# = 0 ]]
  then
    open -a "Microsoft Excel"
  else
    [[ $1 = /* ]] && F="$1" || F="$PWD/${1#./}"
    open -a "Microsoft Excel" --args "$F"
  fi
}

function code () {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        [[ $1 = /* ]] && F="$1" || F="$PWD/${1#./}"
        open -a "Visual Studio Code" --args "$F"
    fi
}

# Tell the rest of the world my profile's loaded!
export MY_PROFILE_IS_LOADED=1
