{ config, lib, pkgs, ... }:

{
  home-manager.users.rev = { pkgs, ... }: {
    xdg.configFile."rofi".source = ../rofi;
  };
}
