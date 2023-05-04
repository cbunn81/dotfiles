#!/usr/bin/env zsh

cd "$(dirname "${BASH_SOURCE}")";

git pull origin main;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "powerlevel10k" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;
	rsync -avh --no-perms \
		./powerlevel10k ~/.oh-my-zsh/themes/;
	source ~/.zshrc;
}

if [[ "$1" == "--force" || "$1" == "-f" ]]
then
	doIt;
else
	read "REPLY?This may overwrite existing files in your home directory. Are you sure? (y/n) ";
	echo "";
	if [[ "$REPLY" =~ ^[Yy]$ ]]
	then
		doIt;
	fi;
fi;
unset doIt;
