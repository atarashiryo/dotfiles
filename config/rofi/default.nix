{ config, lib, pkgs, ... }:

{
   programs.rofi = {
     enable = true;
     theme = ./theme.rasi
   };
}

