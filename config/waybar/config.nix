{ config, lib, pkgs, ... }:

{
  home-manager.users.rev = { pkgs, ... }: {
    xdg.configFile."waybar".source = ../waybar;
  };
}
