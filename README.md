<center>
<h1>My Dotfiles</h1>
<img src=".github/previews/Monitor_Preview_08-43-21.png" alt="Desktop Showcase" width="768">
</center>



# Installation
Presuming you're starting from a live boot with nothing yet done to your machine, you'll want to install NixOS on your machine from a **minimal installation**.

## Working From A Minimal Installation
### Setting Up A Network Connection &mdash; WiFi
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

> Alternatively, you can temporarily install the `git` package in your active shell with `nix-shell -p git` and then proceed with the installation guide without having to rebuild or reboot your machine.

### Cloning the repository
We expect this repository to be cloned into `$HOME/.config/nixos`.

```sh
$ git clone https://gitlab.com/toxocious/dotfiles.git $HOME/.config/nixos --branch NixOS
```


There are two included hosts that you need to be mindful of; one for a desktop configuration and one for a laptop configuration. 

While it isn't *required*, it's strongly advised that you take a look at either of them and modify them to your needs.

Be sure to copy your `/etc/nixos/hardware-configuration.nix` into whichever of the host configuration directory that you intend on using.

Once done, run the included [./install.sh](./install.sh) script to build your machine, passing in the machine name that you'll be using.
> Default options are `athena` for the desktop configuration and `artemis` for the laptop configuration.



## Notice
**Do NOT run the installation script as an administrator.**

Doing so will cause directories to potentially be created in the wrong place.

Ths install script will likely take several minutes.

The installer will create symlinks and overwrite existing files.
> Please backup your current configs before installing.



## Current Status
Some things are, unfortunately, broken for the time being.

- Weather sometimes works and sometimes doesn't work in the dashboard drop down
- Uptime doesn't work in the dashboard dropdown (`uptime -p` is not valid due to an older version of the command)
- Performance tab in the dashboard does not currently update CPU or GPU temps (missing driver or package or something)



## To Do
- Implement silent booting
