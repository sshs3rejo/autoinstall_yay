sudo pacman -S --needed git base-devel --noconfirm
sudo pacman -S go --noconfirm
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
yay -Y --gendb
yay -Syu --devel