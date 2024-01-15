# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
	services.samba-wsdd = {
	  # make shares visible for windows 10 clients
	  enable = true;
	  openFirewall = true;
	};

  services.samba = {
    enable = true;
    securityType = "user";
    extraConfig = ''
      workgroup = WORKGROUP
      server string = smbnix-data
      netbios name = smbnix-data
      server role = standalone server
      #security = user 
      #use sendfile = yes
      #max protocol = smb2
      # note: localhost is the ipv6 localhost ::1
      hosts allow = 192.168.0. 127.0.0.1 localhost
      hosts deny = 0.0.0.0/0
      guest account = nobody
      map to guest = bad user
    '';
    shares = {
      SHARED-DATA = {
        path = "/home/erik/SHARED";
        browseable = "yes";
        "read only" = "no";
        "guest ok" = "yes";
        "public" = "yes";
        "writable" = "yes";
        "create mask" = "0644";
        "directory mask" = "0755";
      };
    };
  };
}
