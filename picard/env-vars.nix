# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, editor, browser, ... }:

{
  environment.variables = {
    EDITOR = "${editor}";
    BROWSER = "${browser}";
    QT_QPA_PLATFORM = "xcb";
    QT_QPA_PLATFORMTHEME = lib.mkForce "qt5ct";
  };	
}
