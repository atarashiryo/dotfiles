{ config, lib, pkgs, ... }:

{
  home-manager.users.rev = { pkgs, ... }: {
    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      theme = ./theme.rasi;
    };
  };
}

