# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alacritty
    arc-theme
    avahi
    baobab
    bash-completion
    bat
    bibata-cursors
    btop
    chromium
    curl
    discord
    duf
    evince
    feh
    firefox
    flameshot
    font-manager
    gimp
    git
    gnome.dconf-editor
    gnome.gnome-disk-utility
    inkscape
    kitty
    lollypop
    meld
    nomacs
    ripgrep
    scrot
    simplescreenrecorder
    spotify
    sublime4
    variety
    vivaldi
    vivaldi-ffmpeg-codecs
    vlc
    vscode
    wget
    widevine-cdm
    wpsoffice
    zsh
    zsh-completions
    zsh-syntax-highlighting
  ];
}
