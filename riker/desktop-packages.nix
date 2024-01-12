# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

# Plasma + Chadwm

{

  services.xserver.windowManager.dwm.enable = true;
  environment.systemPackages = with pkgs; [
    btop
    dash
    eww
    feh
    font-awesome
    lolcat
    nitrogen
    ocs-url
    pavucontrol
    picom
    rofi
    sxhkd
    xfce.thunar
    xfce.thunar-archive-plugin
    jetbrains-mono
    gnumake
    xorg.libX11.dev
    xorg.libXft
    imlib2
    xorg.libXinerama
];
}
