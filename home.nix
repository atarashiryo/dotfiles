{ config, pkgs, ... }:

{
  imports = [
    config/dunst
    config/hypr
    config/kitty
    config/rofi
    config/waybar
  ];
}
