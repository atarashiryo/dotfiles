{ config, lib, pkgs, ... }:

{
  home-manager.users.rev = { pkgs, ... }: {
    xdg.configFile."hypr".source = ../hypr;
  };
}
