{ config, pkgs, ... }:

{
  programs.hyprland = {
     enable = true;
     xwayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
     waybar
     rofi-wayland
     dunst
     waypaper
     swaybg       
     grim
     cliphist
  ];
}
