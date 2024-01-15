# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

# Plasma + Chadwm

{
  environment.systemPackages = with pkgs; [
    arc-kde-theme
    btop
    dash
    eww
    feh
    font-awesome
    gnumake
    imlib2
    jetbrains-mono
    kate
    lolcat
    lxappearance
    materia-kde-theme
    nitrogen
    ocs-url
    pavucontrol
    picom
    rofi
    sddm-kcm
    sxhkd
    xfce.thunar
    xfce.thunar-archive-plugin
    xorg.libX11.dev
    xorg.libXft
    xorg.libXinerama
];
}