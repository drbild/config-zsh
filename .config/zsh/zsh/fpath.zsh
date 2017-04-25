# add each topic folder to fpath so that they can add functions and completion scripts
for topic_folder ($ZSH/*) if [ -d $topic_folder ]; then fpath=($topic_folder $fpath); fi;

# Make the Homebrew zsh-completions package available
if [ -d "/usr/local/share/zsh-completions" ]; then fpath=(/usr/local/share/zsh-completions $fpath); fi;
