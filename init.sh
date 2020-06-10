#!/usr/bin/env bash
#!/bin/bash
#
# Initialize a dotfile repository using the dots manager
#
# 1. Create the $HOME/.local/lib directory
# 2. Clone the dots manager tool into the lib directory
# 3. Kick off the dots/contrib/initialize script to handle the rest of the setup
#    of the dotfiles. The DOTS_CLONE_DIR environment will be set for this
#
# This script must be sourced!
[[ $_ == $0 ]] && echo "Please source me!" && exit 1

# Clone the dots manager utility
if [[ ! -d "$HOME/.local/lib/dots" ]]; then
    echo -e "\033[0;32m==>\033[0m Installing dots managment utility"
    git clone -q https://github.com/EvanPurkhiser/dots "$HOME/.local/lib/dots"
fi

# Setup the environment for the new dots repository
DOTS_CLONE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$HOME/.local/lib/dots/contrib/initialize"
