{ config, lib, pkgs, ... }:

{
   programs.rofi = {
     enable = true;
     package = pkgs.rofi-wayland;
     theme = ./theme.rasi;
   };
}

