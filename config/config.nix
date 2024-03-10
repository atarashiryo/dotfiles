{ config, lib, pkgs, ... }:

{
  imports = [ 
    ./hypr/config.nix
    ./waybar/config.nix
    ./kitty/config.nix
    ./rofi/config.nix
    ./dunst/config.nix
  ];
}

