# Define TERM - allows vim to disappear when closed.
export TERM=xterm

# Zsh.
#export SHELL=/bin/zsh
#exec /bin/zsh -l

# Define PATH.
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/lib

# Hidden Files.
alias show_hidden_files='defaults write com.apple.finder AppleShowAllFiles YES'
alias hide_hidden_files='defaults write com.apple.finder AppleShowAllFiles NO'

# X11.
export PATH=/opt/X11/bin:$PATH

# Apache Maven.
export PATH=/usr/local/apache-maven/apache-maven-3.2.1/bin:$PATH

# MongoDB.
export PATH=/usr/local/mongodb/mongodb-osx-x86_64-2.6.3/bin:$PATH

# MySQL.
export PATH=/usr/local/mysql/bin:$PATH
alias start_mysql='sudo /usr/local/mysql/support-files/mysql.server start'
alias stop_mysql='sudo /usr/local/mysql/support-files/mysql.server stop'
alias restart_mysql='sudo /usr/local/mysql/support-files/mysql.server restart'

# Git.
export PATH=/usr/local/git/bin:$PATH

# Heroku.
export PATH=/usr/local/heroku/bin:$PATH

# Tex.
export PATH=/usr/local/texlive/2014basic/bin/x86_64-darwin:$PATH
export TEXMFHOME=/usr/local/texmf
alias reload_tex='sudo texhash'

# Pebble SDK.
export PATH=/Users/Ayush/pebble-dev/PebbleSDK-current/bin:$PATH

# Android.
export ANDROID_HOME=/usr/local/android-sdk
export PATH=$ANDROID_HOME:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH

# GTKMM.
export PKG_CONFIG_PATH=/usr/local/Cellar/pkg-config

# Tmux.
alias tmux="TERM=screen-256color-bce tmux"

# Java 8.
export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0_65`

# Java 7.
# export JAVA_HOME=`/usr/libexec/java_home -v 1.7.0_51`

# JUnit.
export CLASSPATH=/usr/local/junit/junit-4.12.jar:$CLASSPATH
export CLASSPATH=/usr/local/junit/hamcrest-core-1.3.jar:$CLASSPATH
