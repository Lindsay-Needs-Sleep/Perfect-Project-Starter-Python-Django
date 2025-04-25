# Install our inputrc
inputrc_file=$(pwd)/.devcontainer/inputrc
if (cat /etc/inputrc | grep --quiet "include $inputrc_file"); then
    echo "already added $inputrc_file to /etc/inputrc";
else
    sudo bash -c 'echo "\$include '$inputrc_file'" >> /etc/inputrc'
fi

# Install our bash.bashrc
bashrc_file=$(pwd)/.devcontainer/bash.bashrc
if (cat /etc/bash.bashrc | grep --quiet "source $bashrc_file"); then
    echo "already added $bashrc_file to /etc/bash.bashrc";
else
    sudo bash -c 'echo "source '$bashrc_file'" >> /etc/bash.bashrc'
fi

# enable git push -f from in the dev container
git config --global --add safe.directory $(pwd)
# setup git hooks
git config core.hooksPath git_hooks
# to undo: git config --unset core.hookspath

# download node modules for eslinting and stuff
npm install
