{ config, lib, pkgs, ... }:

{
  imports = [ 
    ./hypr
    ./waybar
    ./rofi
    ./kitty
    ./dunst/config.nix
  ];
}

