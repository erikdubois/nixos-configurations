{ config, lib, pkgs, ... }:
{
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];
  #virtualisation.virtualbox.guest.enable = true;
  #virtualisation.virtualbox.guest.x11 = true;
}
