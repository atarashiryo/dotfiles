{ config, lib, pkgs, ... }:

{
  home-manager.users.rev = { pkgs, ... }: {
    xdg.configFile."kitty".source = ../kitty;
  };
}
