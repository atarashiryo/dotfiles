{ config, lib, pkgs, ... }:

{
  imports = [ 
    ./hypr
    ./waybar
    ./kitty
    ./dunst
    ./rofi
  ];
}

