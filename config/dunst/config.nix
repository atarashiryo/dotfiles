{ config, lib, pkgs, ... }:

{
  home-manager.users.rev = { pkgs, ... }: {
    xdg.configFile."dunst".source = ../dunst;
  };
}
