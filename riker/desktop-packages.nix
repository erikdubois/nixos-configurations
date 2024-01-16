# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

# Plasma + Awesome, Bspwm, i3wm and more

{
  environment.systemPackages = with pkgs; [
    #obs-studio-plugins.wlrobs
    arc-kde-theme
    btop
    cava
    cmatrix
    dash
    eww
    feh
    font-awesome
    gnumake
    grim
    imlib2
    jetbrains-mono
    kate
    lolcat
    lxappearance
    mako
    materia-kde-theme
    micro
    nitrogen
    ocs-url
    pavucontrol
    picom
    pywal
    rofi
    slstatus
    st
    sddm-kcm
    sparklines
    swaybg
    sxhkd
    waybar
    wdisplays
    wofi
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.xfce4-terminal
    xorg.libX11.dev
    xorg.libXft
    xorg.libXinerama
    yad
];
}
