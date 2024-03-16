{ config, lib, pkgs, ... }:

{
  home-manager.users.rev = { pkgs, ... }: {
    programs.rofi = {
      enable = true;
      theme = ./theme.rasi;
    };
  };
}
