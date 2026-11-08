# autoinstall_yay

Script de instalação automática do [yay](https://github.com/Jguer/yay) — helper de AUR para Arch Linux.

Instala o yay do zero em uma máquina Arch recém-instalada, incluindo as dependências de compilação, e já inicializa a base de dados de pacotes do AUR.

## Uso

```bash
chmod +x auto_yay.sh
./auto_yay.sh
```

## O que ele faz, em ordem

```bash
sudo pacman -S --needed git base-devel --noconfirm
sudo pacman -S go --noconfirm
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
yay -Y --gendb
yay -Syu --devel
```

| Passo | Por quê |
|---|---|
| `base-devel` + `git` | `makepkg` precisa de compilador e do git para baixar o PKGBUILD |
| `go` | O yay é escrito em Go |
| `git clone` + `makepkg -si` | Instalação padrão de pacote AUR |
| `yay -Y --gendb` | Gera o banco de dados do AUR, para as buscas funcionarem |
| `yay -Syu --devel` | Atualiza o sistema e pacotes `-git` |

## Aviso

`makepkg` **não pode** rodar como root — o script clona e compila como usuário comum, usando `sudo` só no pacman. Rodar o script inteiro com `sudo` quebra o `makepkg`.

`--noconfirm` em todas as etapas significa instalação sem nenhuma pergunta. Leia o script antes de rodar em máquina que não é sua.

## Licença

MIT
