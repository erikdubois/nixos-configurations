# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

# { config, pkgs, ... }:

# {
#   #services.xserver.displayManager.defaultSession = "none+dwm";
#   services.xserver.windowManager.dwm.enable = true;
#   nixpkgs.overlays = [
#     (final: prev: {
#       dwm = prev.dwm.overrideAttrs (old: { src = /home/erik/.config/arco-chadwm/chadwm ;});
#     })
#   ];
# }

{
  #services.xserver.displayManager.defaultSession = "none+dwm";
  services.xserver.windowManager.dwm.enable = true;

  pkgs.stdenv.mkDerivation = {
    # name of our derivation
    name = "dwm";

    # sources that will be used for our derivation.
    src = ./config/arco-chadwm/chadwm;

    buildInputs = [Imlib2 libX11 libXft libXinerama gnumake acpi];

    installPhase = ''
      mkdir $out
      rm config.h -rf
      make dwm
      mv dwm $out
    '';
  };
}