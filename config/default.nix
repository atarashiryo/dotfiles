{ config, pkgs, ... }:

{
  imports = [
    ./dunst
    ./hypr
    ./kitty
    ./rofi
    ./themes
    ./waybar
  ];
}
