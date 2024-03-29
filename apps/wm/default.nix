{ config, pkgs, ... }:

{
  imports = [ ./hyprland ];

  environment.systemPackages = with pkgs; [
     kdePackages.polkit-kde-agent-1
  ];
}
