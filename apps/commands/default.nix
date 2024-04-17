{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    btop
    neofetch
    nitch
    distrobox
  ];

  virtualisation.docker.enable = true;
}
