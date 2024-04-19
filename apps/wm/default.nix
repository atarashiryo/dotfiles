{ config, pkgs, ... }:

{
  imports = [ ./hyprland ];

  environment.systemPackages = with pkgs; [
    libsForQt5.polkit-kde-agent
  ];
}
