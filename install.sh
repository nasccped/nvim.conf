#!/bin/sh

INPUTS=" $@ "
CONFIG_DIR="$HOME/.config"
NVIM_DIR="$CONFIG_DIR/nvim"
HELP_MESSAGE=\
"neovim config install script

usage: ./install.sh [FLAG(S)]

flags:
	--help   | -h   Prints the help panel
	--force  | -f   Overrides all neovim data at $NVIM_DIR directory

all flags must be separated, like \"--help -p -f\" instead of \"--help -pf\"

take a look into README.md for extra info..."
HELP_FLAG="--help"
HELP_ALIAS="-h"
HELP_TRIGGER=$(case "$INPUTS" in
	*" $HELP_FLAG "* | *" $HELP_ALIAS "*)
		echo true;;
	*)
		echo false;;
esac)
FORCE_FLAG="--force"
FORCE_ALIAS="-f"
FORCE_TRIGGER=$(case "$INPUTS" in
	*" $FORCE_FLAG "* | *" $FORCE_ALIAS "*)
		echo true;;
	*)
		echo false;;
esac)
ERR_NVIM_ALREADY_EXISTS="$NVIM_DIR path directory already exists.
       you can use \`$FORCE_FLAG\` flag to override all data.

       WARNING: this will erase all your neovim configuration.
                consider renaming the original folder and then, running
                this script"
WARN_CONFIG_DIR_DOESNT_EXISTS="$CONFIG_DIR path doesn't exists. creating one..."
WARN_NVIM_ALREADY_EXISTS="nvim config directory already exists.
      the current directory will be copied to the nvim config path."

# when the program can't recover from a given state
error_and_kill() {
	local message="$1"
	if [ "$message" == "" ]; then
		echo -e "\e[91mfatal error\e[0m with no message. aborting..."
	else
		echo -e "\e[91merror\e[0m: ${message}"
	fi
	exit 1
}
# when the program can proceeds but with some kind of warning
warning() {
	local message="$1"
	if [ "$message" == "" ]; then
		echo -e "\e[93mwarn\e[0m with no message (o_O)..."
	else
		echo -e "\e[93mwarn\e[0m: ${message}"
	fi
}
# ask for the user
ask() {
	printf "%s [y/n]: " "$1"
	read ans
	case "$ans" in
		[yY] | [yY][eE][sS]) return 0;;
		*) return 1;;
	esac
}
# if help called
if $HELP_TRIGGER; then
	echo "$HELP_MESSAGE"
	exit 0
fi
# check config dir
if [ ! -d "$CONFIG_DIR" ]; then
	warning "$WARN_CONFIG_DIR_DOESNT_EXISTS"
	mkdir -p "$CONFIG_DIR"
fi
# checks nvim status
if [ -d "$NVIM_DIR" ]; then
	if $FORCE_TRIGGER; then
		warning "$WARN_NVIM_ALREADY_EXISTS\n"
		if ask "this will erase all your old data (including .git dir). are you sure?"; then
			rm -rf "$NVIM_DIR/*"
			echo
		else
			echo -e "\naborting..."
			exit 0
		fi
	else
		error_and_kill "$ERR_NVIM_ALREADY_EXISTS"
	fi
else
	echo "creating a new $NVIM_DIR path..."
	mkdir -p "$NVIM_DIR"
fi
# last alert
echo -e "copying files from the current dir ($(pwd))
to neovim config path ($NVIM_DIR)\n"
# running copy
COMMAND="$(cp -pr . $NVIM_DIR) 2>/dev/null"
# checks success
if eval "$COMMAND"; then
	echo "done!"
else
	error_and_kill "\`$COMMAND\` command failed (returned not 0)..."
fi
