<h1 align="center">My Dotfiles</h1>
<!-- <img src="assets/preview.png" alt="Rice Showcase" align="right" width="450"> -->



# ✔️ Installation
Presuming you're starting from a live boot with nothing yet done to your machine, you'll want to install NixOS on your machine from a **minimal installation**.

## Working From A Minimal Installation
### Setting Up A Network Connection &mdash WiFi
For WiFi users, you'll also want to connect to a network if you haven't yet.
```sh
$ nmcli device wifi list
$ nmcli device wifi connect "<SSID>" password "<PASSWORD>"
$ ping google.com
```

Verify that you have a connection by pinging a website. If you have successfully connected to your network, proceed with rebuilding your system.

### Adding The Git Package
From a minimal installation of NixOS you'll want to add the `git` package by editing `/etc/nixos/configuration.nix`.

Once done, rebuild your machine afterwards so that you can clone this repository.

### Cloning the repository
We expect this repository to be cloned into $HOME/.config/nixos.

```sh
$ git clone https://gitlab.com/toxocious/dotfiles.git $HOME/.config/nixos --branch NixOS
```

## Notice
**Do NOT run the installation script as an administrator.**

Doing so will cause directories to potentially be created in the wrong place.

Ths install script will likely take several minutes.

The installer will create symlinks and overwrite existing files.
> Please backup your current configs before installing.
