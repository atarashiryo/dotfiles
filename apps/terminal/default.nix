{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kitty
    btop
    neofetch
    nitch
    distrobox
  ];

  virtualisation.docker.enable = true;
}
