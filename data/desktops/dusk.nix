# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  #services.xserver.displayManager.defaultSession = "none+dusk";
  services.xserver.windowManager.dwm.enable = true;
  nixpkgs.overlays = [
  (final: prev: {
    dwm = prev.dwm.overrideAttrs (old: { src = /home/erik/.config/arco-dusk ;});
  })
  ];

}

