# Script for setting up enviroment in new linux distro 
# Created by Trvon
# clear &&  echo -e "\nWelcome, do you need to set up your user info?(y/n)\n\tex. Username & Email"
# read run && clear
# sudo echo -e "\nWhat package manager are you using?\n\n\t(1) Fedora\n\t(2) Debian\n\t(3) Arch"
# read pac && clear
#  Sets the package manager variable
# case "$pac" in 
# 	"1") fedora ;;
# 	"2") debian ;;
# 	"3") pacman ;;
# 	*) echo "Not an option." exit 1 ;;
# esac

# Uses these variables for all intitializations
echo -e "\nWhat is you haxer name?"
read name
echo -e "What is your primary email"
read email
clear

# VIM setup
# Need to fix installs for Arch
command -v vim >/dev/null 2>&1 || 
{
	echo  -e "\nVim not installed, Installing...\n"
	sudo Pacman -S vim -y
}
cat ../dotfiles/vimrc > ~/.vimrc

#  Git setting up Git
command -v git >/dev/null 2>&1 || 
{
	echo -e "\nGit is not installed, Installing...\n"
	sudo Pacman -S git -y
}

if [ ! -f ~/.gitconfig ] ; then
	echo -e "\nSetting up github...\n"
	git config --global user.name $name
	git config --global user.email $email
fi
clear

# Starts RSA with 4096  Process
command -v openssh >/dev/null 2>&1 || {
	echo -e "\nInstall ssh...\n"
	sudo Pacman -S openssh -y
}

if [ ! -f ~/.ssh/id_rsa.pub ]; then
	ssh-keygen -t rsa -b 4096
	# ssh-add
fi
clear

# bash initialization with resources
sh ./backup_restore_dotfiles.sh

echo -e "\nAll setup configurations are complete, enjoy linux :)\n"
