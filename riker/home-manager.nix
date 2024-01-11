{ config, pkgs, ... }:
{
  users.users.erik.isNormalUser = true;

  home-manager.users.erik = { pkgs, ... }: {
    home.packages = [ pkgs.atool pkgs.httpie ];
    programs.bash.enable = true;

    # The state version is required and should stay at the version you
    # originally installed.
    home.stateVersion = "23.11";
  };
}
