<h1 align="center">My Dotfiles</h1>

<!-- <img src="assets/preview.png" alt="Rice Showcase" align="right" width="450"> -->

- **Operating System:** [arch](https://archlinux.org/)
- **Compositor:** [Hyprland](https://github.com/hyprwm/Hyprland)
- **Terminal Emulator:** [Kitty](https://github.com/kovidgoyal/kitty)
- **Status Bar:** [waybar](https://github.com/Alexays/Waybar/)
- **App Launcher:** [rofi](https://github.com/lbonn/rofi)
- **Notification Daemon:** [mako](https://github.com/emersion/mako)
- **Shell:** [zsh](https://www.zsh.org/)
- **Shell Plugin Manager:** [zgenom](https://github.com/jandamm/zgenom)
- **Browser:** [Brave](https://brave.com/)



## ✔️ Installation
Presuming you're starting from a live boot with nothing yet done to your machine, the steps are as follows:

1. Initialize and populate your keys.
```sh
pacman-key --init
pacman-key --populate archlinux
```
2. Install the latest version of `archinstall`.
```sh
sudo pacman -S archinstall
```
3. Clone this repository and run the installer..
```
$ git clone https://gitlab.com/toxocious/dotfiles.git && cd dotfiles && ./install
```

Ths install script will likely take several minutes.

The installer will create symlinks and overwrite files. It will also install all packages from the pacakges listed in [package_installer.sh](assets/bootstrap/package_installer.sh).
> Please backup your current configs before installing.

After the script has installed all of the listed packages and has copied over the designated config files, it's recommended that you manually update certain configs to your liking, such as `hyprland.conf` to update your monitor config.



## 🖥️ Wallpapers
[Wallpaper Folder](https://gitlab.com/toxocious/dotfiles/-/tree/main/assets/wallpapers "wallpapers folder")
